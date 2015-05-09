![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Data folder
-----------
When cloned locally, this folder will contain a set of short read (FASTQ)
data files and a reference genome (FASTA). You will be able to fetch these
data automatically using the scripts `download_plasmodium_raw.sh` and 
`download_plasmodium_reference.sh` in the bin folder. Given this location,
we will then be able to run analyses locally on the host OS as well as from
VMs and containers.

The short read (FASTQ) data for the course comes from the 
[Genome Epidemiology Network](http://www.malariagen.net/data)

It can be downloaded from the Short Read Archive

Consult the following for more information:
- http://sra.dnanexus.com/runs/ERR022523
- http://sra.dnanexus.com/runs/ERR022523/studies

The ftp URLs to the actual files added to the data container are:
- ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_1.fastq.gz
- ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_2.fastq.gz

The reference genome for *Plasmodium falciparum* comes from the Sanger centre:

- ftp://ftp.sanger.ac.uk/pub/project/pathogens/Plasmodium/falciparum/3D7/3D7.version2.1.5/Pf3D7_v2.1.5.fasta

