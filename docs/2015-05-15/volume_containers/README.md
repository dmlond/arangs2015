![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

Docker Volume Containers
========================

We have focused so far on a specific kind of container that wraps an application
and allows one to run the application on the host like it was natively installed.
In this part of the course, we are going to focus on a way to use docker to automate
the process of reproducibly providing your data to your applications.

The foundation for this is that you have to share your data somewhere on the web,
publicly accessible to the world.
In this case, we are using the plasmodium data that researchers have already made available

* [Reference](ftp://ftp.sanger.ac.uk/pub/project/pathogens/Plasmodium/falciparum/3D7/3D7.version2.1.5/Pf3D7_v2.1.5.fasta)
* [Pair 1 Raw](ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_1.fastq.gz)
* [Pair 2 Raw](ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_2.fastq.gz)

With docker, you can create a special image with a program that automates the process
of downloading your data at runtime into a particular directory, and then making that
directory available for other containers to use.

The parts needed are:
```
docker_build_context/
    Dockerfile
    download_data.sh
```
modified [docker-compose-data.yml](https://github.com/dmlond/arangs2015/blob/master/docker-compose-data.yml)

export COMPOSE_FILE=docker-compose-data.yml

run bin/pipeline.docker.sh as normal

docker run -v `pwd`/data:/mvdir ubuntu:trusty cp /wdir/* /mvdir
