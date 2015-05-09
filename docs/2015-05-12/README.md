ARANGS15 - 2015-05-12 - Virtualization and provision with Virtualbox and puppet
===============================================================================
On the previous day we learned how to track changes in, and collaborate on, text files 
using `git` and Github. We would now be able to share analysis scripts, configuration
files, and (small) data files. However, simply pointing other researchers to our text
files does not assure that they would end up running their analyses in the exact same 
environment, with the same tools (and their underlying libraries).

We can solve this problem by using virtualization. Recent advances in computing power and
architecture has made it possible to run additional operating systems ("guests", "Virtual
machines") inside the operating system that runs the computer (the "host"). Several 
different software packages allow host OSs to run guest VMs. The most popular of these in
the open source community is Virtualbox, which we will explore today.

Virtualbox allows us to host VMs, so we could tell our collaborators to install a specific
operating system (example: Ubuntu 14.04LTS) on it and run our scripts there. However, 
unless we specify an OS version that is specifically geared towards NGS analysis (example:
BioLinux) there are going to be many missing tools. This brings us back to the situation
where we have to say about these tools that "we used `foo` (Smith, 2013) and `bar` 
(Jones, 2014)". That's no good: these tools will have different versions, and they may 
need to be compiled (with which flags?).

We could re-invent the wheel and write shell scripts to download and install all the tools
needed, but there are better ways. `Puppet` is used by system administrators to bring new
servers up and running automatically: by running a "puppet manifest" (a kind of script or
configuration file) all the dependencies that are defined are verified and if any are 
missing they are installed using the instructions in the manifest. This process is called
"provisioning".

In principle we could start a VM in Virtualbox, log in on it, and then typing the 
provisioning commands by hand on the terminal of our fresh guest VM. However, we would 
then probably find out that the puppet manifest itself has requirements (such as the 
`puppet` command, or the `git` command) that aren't on the VM yet. To break out of this
dependency loop (and to avoid having to type the provisioning commands by hand every time
we create a new VM) we will use a system that combines the download and installation of
VMs as well as their provisioning: Vagrant. The end result is to have a fully specified
environment consisting of a guest OS with all the installation instructions for 
dependencies bundled into a Vagrant "box". With today's instructions and exercises we 
hope to accomplish the following learning goals:

Virtualbox
----------

- Download and install, if needed
- Configuration of VMs (memory, processors, networking)
- Launching, suspending, quitting, removing VMs
- Sharing data between guest and host

Puppet
------

- Download and install, if needed
- Applying puppet manifests
- Writing simple puppet manifests

Vagrant
-------

- Download and install, if needed
- Adding / initializing a vagrant box
- Launching, suspending, quitting, removing boxes
- Logging into a box

Requirements
------------

* [virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [puppet](https://github.com/puppetlabs/puppet/releases)
* [vagrant](https://www.vagrantup.com/downloads.html)