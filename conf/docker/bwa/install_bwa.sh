#!/bin/bash

# download and extract bwa source
wget -O bwa-0.7.12.tar.bz2 http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2/download
tar jxf bwa-0.7.12.tar.bz2
# build bwa and move it into /usr/local/bin
cd bwa-0.7.12
make
mv bwa /usr/local/bin
# clean up to minimize the size of the resulting image
cd ..
rm -rf bwa-0.7.12*
