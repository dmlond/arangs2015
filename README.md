# ARANGS 2015
Automated and Reproducible Analysis of Next Generation Sequencing Source code, data, documentation and reference materials.

## Data

The data for the course comes from the [Genome Epidemiology Network](http://www.malariagen.net/data)

It can be pulled from the Short Read Archive

Consult the following for more information:
* http://sra.dnanexus.com/runs/ERR022523
* http://sra.dnanexus.com/runs/ERR022523/studies

The ftp URLs to the actual files added to the data container are:
* ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_1.fastq.gz
* ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_2.fastq.gz

## Reference materials

* DNA Sequencing Technologies
http://www.nature.com/scitable/topicpage/DNA-Sequencing-Technologies-690

* "A Quick Guide to Organizing Computational Biology Projects"
http://dx.doi.org/10.1371/journal.pcbi.1000424

* "A quick guide for developing effective bioinformatics programming skills."
http://dx.doi.org/10.1371/journal.pcbi.1000589

* "The Sanger FASTQ file format for sequences with quality scores, and the Solexa/Illumina FASTQ variants"
http://dx.doi.org/10.1093%2Fnar%2Fgkp1137

* "A Practical Comparison of De Novo Genome Assembly Software Tools for Next-Generation Sequencing Technologies"
http://dx.doi.org/10.1371/journal.pone.0017915

* "A beginner's guide to eukaryotic genome annotation"
http://dx.doi.org/10.1038/nrg3174

* NGS glossary spreadsheet
https://docs.google.com/spreadsheet/ccc?key=0Av8UW3JvZsgcdE9wZW1sYzlCQWFwNjBXLWMtQzZLN3c#gid=0

* NGS platforms
https://docs.google.com/document/pub?id=1rYbBPELjjezRVjkQfkulJI2jNxL5LsRuNXVv_CxCpd4

* Unix Tutorials
http://tldp.org/LDP/abs/html/
http://www.ee.surrey.ac.uk/Teaching/Unix/

## Syntax Format Descriptions

* SAM/BAM http://samtools.sourceforge.net/SAM1.pdf
* VCF Format http://www.1000genomes.org/wiki/Analysis/Variant%20Call%20Format/vcf-variant-call-format-version-40
* FASTQ http://maq.sourceforge.net/fastq.shtml
* Sequence file formats http://bioinf.comav.upv.es/courses/sequence_analysis/sequence_file_formats.html

## Executables

* samtools http://samtools.sourceforge.net/
* bwa http://bio-bwa.sourceforge.net/
* fastqc http://www.bioinformatics.babraham.ac.uk/projects/fastqc/

## vagrant/virtualbox

* install virtualbox: https://www.virtualbox.org
* install vagrant: http://www.vagrantup.com/
* check out available vagrant boxes: http://www.vagrantbox.es
* add the fedora 18 box to your vagrant boxes:

    `local> vagrant box add fedora http://puppet-vagrant-boxes.puppetlabs.com/fedora-18-x64-vbox4210.box`

* bring up the arangs13 box: make sure you are connected to the internet

    `local> vagrant up`

* ssh to arangs13, list out the contents, check the version of bwa and samtools, then exit back to your box

    `local> vagrant ssh`

    `arangs13> ls`

    `arangs13> bwa`

    `arangs13> samtools`

    `arangs13> perldoc Bio::Db::Sam`

    `arangs13> exit`

* Capture and use the vagrant ssh-config as a standard ssh configuration file (for use by ssh, and perl, python, ruby, etc. s\
sh wrappers)
    `local> vagrant ssh-config > arangs13.conf`
    `local> ssh -F arangs13.conf arangs13`
    `arangs13> exit`

* check the status of the arangs13 box

    `local> vagrant status`

*  suspend the arangs13 box (does not destroy the image, so puppet does not need to run again, and any files stored on the vi\
rtual filesystem are preserved), then bring it back up

    `local> vagrant suspend`
    `local> vagrant up`

* destroy the arangs13 box (all data on the virtual filesystem, including puppet configuration, are destroyed)

    `local> vagrant destroy --force`

## Docker, docker-machine, docker-compose
