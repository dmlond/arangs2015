![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

Introducing Docker
==================

[Docker](www.docker.com) has some similarities with Virtualization Technologies:

- both involve the creation of reuseable images
- both involve running one or more instances of an image on a Host machine
- images can be transported from one Host to another and run successfully
so long as the hosting software is installed

Docker images differ from Virtualization images in many important ways.

- They are 5-10 times smaller
- They depend on and use much more of the host linux resources
- They are less secure
- Instances are called Containers
- Containers can be instantiated and run within seconds
- Containers can be plugged in to the Host tty, STDIN, STDOUT, and STDERR

The primary difference between a Docker image and a VM image is tied to
a philosophical difference.  

VM images are created to host an entire machine architecture which is run as if it were its own machine, completely oblivious to its host.  

Docker images are designed to host a single application and its dependencies.  They are designed to run on the host as if natively installed.  To compose a pipeline, you use or create docker images for each application required, and run containers from the host more or less hooked in to the host, similar to the way you would run a natively installed application.

Docker Ecosystem
----------------

**Docker Machine**

Host systems must install and run the Docker daemon.  The daemon can only run on a modern (version created within the last 2 years) Linux Kernal.  Almost all flavors of Linux (Fedora, Redhat, Ubuntu, Debian) use the Linux Kernal, and can host the daemon on them natively.  Some flavors of \*Nix (Mac OSX in particular), do not use the Linux Kernal. They must run the docker daemon inside a VirtualMachine built on one of the Linux flavors with a modern kernal.  This can introduce a bit more complexity, but it also introduces the powerful concept of using external docker hosts 'in the cloud'.

The docker daemon runs a web service in the background and listens to special ports for requests to manage docker images and containers. It provides a REST interface API that can be used by any client.  Typically, it uses an encrypted connection called TLS, which is a standard system used by many network client-server communications. TLS requires that each client generate an encrypted certificate (not the same as used by GitHub) to be used when they communicate with the service. The primary client that uses the REST interface is the docker commandline interface.

The [docker-machine](https://docs.docker.com/machine) command automates the process of getting a docker host running on any computer with a supported Virtualization system (Virtualbox and VMware are supported). It makes it much easier to get Docker up and running if you do not have Systems Administration expertise.  It does this by:
  - downloading a special VM image for a specified VM management system preconfigured to host and run the docker daemon
  - generating TLS certificates
  - starting and stopping the VM
  - Providing an easy way to configure the Environment needed by the Docker commandline interface (see below)
The docker-machine command can also be used to create docker machines on many cloud [hosting systems](https://docs.docker.com/machine/#using-docker-machine-with-a-cloud-provider), which may be attractive to those wanting to purchase more powerful compute environments than are provided by their own machine, or institution.

**Docker**

The [docker commandline interface](https://docs.docker.com/reference/commandline/cli/) is written in the Go programming language.  There are versions available for every known operating system (even Windows 10!).  It is designed to interface with the Docker Machine daemon over the network using its REST interface.  By compartmentalizing the docker interface from the docker machine, it is possible to use the same docker command to interface with a docker machine running anywhere on the network.

The client must run in the context of a special set of Environment variables:
* DOCKER_TLS_VERIFY (1 if using TLS, default)
* DOCKER_CERT_PATH (path to TLS certificate if using TLS)
* DOCKER_HOST (url and port to the Docker Host daemon service)

The docker commandline interface provides the full set of tools needed to create and manage docker images and image container instances.

* pull images from a Docker Registry (it knows about the Official Docker Registry by default)
* push images to a Docker Registry (requires login)
* list images
* build images from a build context (more about this tomorrow)
* remove images
* tag images (acts like an alias)
* run container instances of images
* list containers
* start and stop existing container instances (background only)
* pause/unpause existing containers (foreground and background)
* kill a running container (stop is preferred but kill can be used to stop a runaway container process)
* rm stopped/killed container instances
* inspect container instances (running or stopped)
* Dump the log (STDOUT) from a running container
* save and load a tar file of an image (can be used instead of a registry to move docker images from one machine to another)
* exec a command in a running container (allows you to interact with, and change the state of a running container)

There are many arguments that you can provide to the [Run](https://docs.docker.com/reference/run/) command:
* container naming (docker provides default names to all containers, sometimes humorous), you can specifically name a container at run time
* interactivity mode (interactive or daemon mode)
* attach the host tty (we will demonstrate this) to an interactive container
* mount local directories to the container file system
* connect one container to another container to make a private network between them
* mount volumes from other, special containers, called volume containers, to the container file system
* set the user, group, working directory to be used inside the container
* set environment variables
* override the default entrypoint or command (more on this tomorrow)
* connect host and container STDIN, STDOUT, and STDERR
* expose container ports to the host

**Docker Registry**

Docker has hosted a worldwide [Registry](https://registry.hub.docker.com/) of Docker images.  Anyone with docker can share their own images with the world.  Images shared on the Docker Registry cannot be private.  It is possible to [host your own registry](http://docs.docker.com/registry/deploying/).

The Docker commandline tool is preconfigured to know about and use the official
Docker Registry.

- docker pull i will pull the image i down onto your host
- docker run i will pull the image i down if it is not present, and then run a container of i

Lesson Plan
-----------

- install docker-machine and docker
- explore the Docker Registry
- run some docker images
  - with and without docker pull
  - with and without local storage
  - with exposed ports
  - connected to other container systems/services
- inspect information about containers
- inspect the log from running containers
- remove images
- remove containers (with volumes)

Resources
---------
- https://www.docker.com/
- https://docs.docker.com/machine/
- https://docs.docker.com/compose/
- https://docs.docker.com/userguide/
- https://docs.docker.com/reference/commandline/cli/
- https://registry.hub.docker.com
- https://registry.hub.docker.com/u/tutum/hello-world/
