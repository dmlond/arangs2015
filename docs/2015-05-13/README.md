![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Shareable virtual machines and containers: vagrant and docker
-------------------------------------------------------------
*2015-05-12*

On the previous day we learnt how to interact with vagrant boxes, which contain an entire
OS with all the dependencies that are needed for our analysis. Our pipeline has therefore
become fully specified and reproducible. However, this approach is not particularly 
efficient with our compute resources, both in terms of storage - we have downloaded an
entire OS, when actually a lot of its functionality already existed on our computer - and
in terms of compute power and RAM memory: we are now running two entire operating systems
side by side (the host and the guest).

A more efficient approach would be to only install the parts of the guest OS that we don't
have yet and run those, while most of the system processes are delegated to the host OS.
Due to some enhancements in the architecture of Linux operating systems this is now more
or less possible. With this approach we strictly speaking are no longer running entire
virtual machines, but "containers". This functionality is provided by `docker`, which we
will explore today. 

(On other operating systems, e.g. Mac OSX, docker containers can also be used, but because 
these operating systems have a different architecture, there is still a small virtual 
machine running in the background so the efficiency gains aren't quite as great.)

We hope to accomplish the following learning goals today:

Vagrant
-------

- How Vagrant can be used to store and share machine images
- How to mount local directories onto the Virtual Machine

Docker
------

- How Docker builds off virtualization with a different approach
- The docker toolset: `docker`, `docker-machine`, and `docker-compose`
- Container Applications compared to Virtual Machine Images
- How to create a docker machine
- How to configure the Docker commandline application to work with a docker machine
- The global docker hub registry
- Volume Containers to permanently store and share data
- How to plug host directories into the file system expected by a container application

Requirements
------------

* [vagrant](https://www.vagrantup.com/downloads.html)
* [docker](https://docs.docker.com/installation/)