#!/bin/bash
wget -O samtools-1.2.tar.bz2 http://sourceforge.net/projects/samtools/files/samtools/1.2/samtools-1.2.tar.bz2/download
tar jxf samtools-1.2.tar.bz2
# build samtools and move it into /usr/local/bin
cd samtools-1.2
make
mv samtools /usr/local/bin
# clean up to minimize the size of the resulting image
cd ..
rm -rf samtools-1.2*
