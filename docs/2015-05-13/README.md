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
configuration of compute environments and how to run analyses inside a VM. To capture our
understanding of yesterday's progress, we will each make a mindmap with XMind. Give it a 
name that includes your computer (t1, t2, etc.), add the file to your git repository and 
send us a pull request. This way we have all of them together. Then we will have a brief
aside on how to organize data, e.g. as produced by different runs of a pipeline or
different steps in a larger analysis.
- _Session 2_: We are going to make our own vagrant box file to share with others. The end
result will be something [like this](https://atlas.hashicorp.com/Naturalis/boxes/arangs2015),
which you can install with `vagrant init Naturalis/arangs2015` (etc.). A box file
is [a combination of the virtual hard drive of the VM and metadata](http://docs.vagrantup.com/v2/boxes/format.html).
This bundling is made using the [packer program](https://packer.io/), which you should install.
The bundler requires some extra scripts and config files, which we will adapt from
[here](https://github.com/hashicorp/atlas-packer-vagrant-tutorial).
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
