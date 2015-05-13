FROM centos:latest
RUN ["/usr/sbin/useradd", "bwa_user"]
RUN ["/usr/bin/yum", "install", "-y", "wget"]
RUN ["mkdir", "-p", "/home/bwa_user/data"]
RUN ["mkdir","-p","/home/bwa_user/data"]
RUN ["chown","bwa_user","/home/bwa_user/data"]
RUN ["chgrp","bwa_user","/home/bwa_user/data"]
RUN ["chmod","777","/home/bwa_user/data"]
ADD download_plasmodium_raw.sh /usr/local/bin/download_plasmodium_raw.sh
VOLUME ["/home/bwa_user/data"]
WORKDIR /home/bwa_user/data
USER bwa_user
CMD "/usr/local/bin/download_plasmodium_raw.sh"
