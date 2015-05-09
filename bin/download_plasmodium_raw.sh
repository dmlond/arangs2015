#!/bin/bash

# this script downloads two gzipped files with FASTQ reads from the EBI short read archive
wget -O ../data/ERR022523_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_1.fastq.gz
wget -O ../data/ERR022523_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_2.fastq.gz
