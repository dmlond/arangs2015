FROM ubuntu:trusty
MAINTAINER Darin London <darin.london@duke.edu>

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y bzip2 \
    && apt-get install -y tar \
    && apt-get install -y build-essential \
    && apt-get install -y zlib1g-dev
ADD install_bwa.sh install_bwa.sh
# this downloads the bwa source, makes it, moves it into place, then removes
# the downloads in one transaction to make sure downloads do not remain
# in the image
RUN ./install_bwa.sh

# this creates a default command that gets
# run when the container is run without arguments
# it will print the usage + version of bwa and exit
CMD bwa
