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

- How Vagrant can be used to store and share machine images
- How to mount local directories onto the Virtual Machine
- How Docker builds off virtualization with a different approach
- The docker toolset: `docker`, `docker-machine`, and `docker-compose`
- Container Applications compared to Virtual Machine Images
- How to create a docker machine
- How to configure the Docker commandline application to work with a docker machine
- The global docker hub registry
- Volume Containers to permanently store and share data
- How to plug host directories into the file system expected by a container application

Schedule
--------

The outline for today is as follows:

- _Session 1_: Recap from yesterday: How Vagrant and Puppet can automate the creation and
configuration of compute environments and how to run analyses inside a VM. Brief
aside on how to organize data, e.g. as produced by different runs of a pipeline or
different steps in a larger analysis.
- _Session 2_: If all has gone well, we will be able to access the folder
`arangs2015/data` on the host by navigating to `/vagrant_data/` on the VM. Verify that
this is the case and that you can read from it (e.g. by accessing the README.md using
`more`) as well as write to it (e.g. `touch foo` should create an empty file `foo`).
Modify the pipeline shell script to point it to the right folder and run it.
- _Session 3_: Docker introduction. We will now begin to look at a newer technology that has emerged within the last few years, Docker.  In this session,
we will go over the basic concepts of the Docker system, and get to know its
similarities and differences with Virtualization.  We will then learn about the docker ecosystem on registry.docker.hub. We will then install the
software we will be using in the class.
- _Session 4_: Docker Machine, and Docker Commandline.  In this part we will
create our first Docker Machine, and then work with the docker commandline to
run some of the official images hosted by the Docker Hub.  In doing so, we will learn about the following important concepts:
  - a visceral feeling for how docker is different from virtualization
  - The Docker lexicon: image and container
  - The different kinds of Docker image
  - docker ENV
  - The intimate relationship between the docker commandline and the hub
  - mounting locally hosted directories as docker volumes
  - running containers as a different user than root
  - exposing ports
  - managing machines, images, and containers
  - when the docker-machine is not so transparent

Requirements
------------

* [vagrant](https://www.vagrantup.com/downloads.html)
* [docker](https://docs.docker.com/machine/#installation)
