#!/bin/bash

# this is a simple pipeline that maps FASTQ reads to a reference genome (in FASTA format).

# Here we define where our data reside. Perhaps we may need to modify this depending on
# how we run the pipeline.
DATA=../data

# Here we define the number of cores we will use for the calculations. Perhaps we may need
# to modify this depending on the configuration of our VM
CORES=2

# The location of the reference genome in relation to the data folder
REFERENCE=$DATA/Pf3D7_v2.1.5.fasta

# The location of the reads in relation to the data folder
READS_1=$DATA/ERR022523_1.fastq.gz
READS_2=$DATA/ERR022523_2.fastq.gz
FASTQS="$READS_1 $READS_2"

# recreate BWA index if not exists
if [ ! -e $REFERENCE.bwt ]; then
	echo "going to index $REFERENCE"

	# Warning: "-a bwtsw" does not work for short genomes,
	# while "-a is" and "-a div" do not work not for long
	# genomes. Please choose "-a" according to the length
	# of the genome.
	bwa index -a bwtsw $REFERENCE
else
	echo "$REFERENCE already indexed"
fi

# lists of produced files. These will be assigned values as we run the pipeline
SAIS=""
SAM=""

# iterate over FASTQ files
for FASTQ in $FASTQS; do

	# create new names from the stem of the FASTA and FASTQ files
	LOCALFASTA=`echo $REFERENCE | sed -e 's/.*\///'`
	LOCALFASTQ=`echo $FASTQ | sed -e 's/.*\///'`
	OUTFILE=$DATA/$LOCALFASTQ-$LOCALFASTA.sai

	# grow the list of *.sai files
	SAIS="$SAIS $OUTFILE"

	# create a name for the SAM file
	SAM=`echo $OUTFILE | sed -e "s/_.*/-$LOCALFASTA.sam/"`

	# note: we don't do basic QC here, because that might mean
	# that the mate pairs in the FASTQ files go out of order,
	# which will result in the bwa sampe step taking an inordinate
	# amount of time

	# do bwa aln if needed
	if [ ! -e $OUTFILE ]; then
		echo "going to align $FASTQ against $REFERENCE"

		# use $CORES threads
		bwa aln -t $CORES $REFERENCE $FASTQ > $OUTFILE
	else
		echo "alignment $OUTFILE already created"
	fi
done

# do bwa sampe if needed
if [ ! -e $SAM ]; then

	# create paired-end SAM file
	echo "going to run bwa sampe $FASTA $SAIS $FASTQS > $SAM"
	bwa sampe $REFERENCE $SAIS $FASTQS > $SAM
else
	echo "sam file $SAM already created"
fi

# do samtools filter if needed
if [ ! -e $SAM.filtered ]; then
	# -bS   = input is SAM, output is BAM
	# -F 4  = remove unmapped reads
	# -q 50 = remove reads with mapping qual < 50
	echo "going to run samtools view -bS -F 4 -q 50 $SAM > $SAM.filtered"
	samtools view -bS -F 4 -q 50 $SAM > $SAM.filtered
	gzip -9 $SAM
else
	echo "sam file $SAM.filtered already created"
fi

# do samtools sorting if needed
if [ ! -e $SAM.sorted.bam ]; then

	# sorting is needed for indexing
	echo "going to run samtools sort $SAM.filtered $SAM.sorted"
	samtools sort $SAM.filtered $SAM.sorted
else
	echo "sam file $SAM.sorted already created"
fi

# created index for BAM file if needed
if [ ! -e $SAM.sorted.bam.bai ]; then

	# this should result in faster processing
	echo "going to run samtools index $SAM.sorted.bam"
	samtools index $SAM.sorted.bam
else
	echo "BAM file index $SAM.sorted.bam.bai already created"
fi
