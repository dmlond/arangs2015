![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Virtualization and provision with Virtualbox and puppet
-------------------------------------------------------
*2015-05-12*

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

- Download and install of Virtualbox, if needed
- Configuration of VMs using Virtualbox (memory, processors, networking)
- Launching, suspending, quitting, removing VMs
- Download and install Puppet, if needed
- Applying puppet manifests
- Writing simple puppet manifests
- Download and install Vagrant, if needed
- Adding / initializing a vagrant box
- Launching, suspending, quitting, removing boxes
- Logging into a box


Schedule
--------

The outline for today is as follows:

- _Session 1_: Virtualization 101. We will start with a brief recap of day 1 and deal with 
any outstanding issues. We will then dip our toes into using Virtualbox by installing a 
tiny Linux distribution on it, [SliTaz](http://www.slitaz.org/en/get/), which we will 
assign more resources (2048Mb RAM). You can safely remove and destroy this VM while you're
playing around or when you're done. We just needed this to see how to install "by hand".
- _Session 2_: Managing virtual machines using Vagrant. After having seen how to install
and configure a Linux distribution by hand we will now learn how to use Vagrant to manage
this. Initialize another tiny Linux, this time with Vagrant: 
`vagrant init olbat/tiny-core-micro`. Edit the Vagrantfile to increase RAM to 2048Mb and
to turn on the graphical user interface of the VM in Virtualbox. You can do this by 
removing some comments in the Vagrantfile. In addition, specify `config.ssh.shell="sh"` 
in the file. You can then start the VM by typing `vagrant up` in the terminal. If it seems
to hang when creating synced folders you can break out of this with Ctr+C, and then log
in on the VM using `vagrant ssh`. This VM is again too minimal for us to do something 
useful with so feel free to destroy it (`vagrant destroy`).
- _Session 3_: Provisioning virtual machines using Puppet. We will now have a look at the
previously prepared file `arangs2015/conf/vagrant/Vagrantfile`. This file specifies that
the VM is to be provisioned using the Puppet manifest that is, relative to the 
Vagrantfile, in `manifests/default.pp`. Edit the puppet manifest to add the extra
instruction to clone your fork of the course repo into the home directory of the VM user
`vagrant`. To test whether you got the puppet syntax right you can do a dry run on the 
host with `puppet apply --noop manifests/default.pp`. When all seems correct, launch and
provision the box using `vagrant up` and log into it with `vagrant ssh`.
- _Session 4_: Running the pipeline. If the course repo was successfully cloned into the 
VM by puppet we should be able to navigate into the repo folder and run our pipeline. 
However, the puppet manifest was run as root (`sudo puppet apply ...`) so our current user 
(which is, well, try `whoami` - Who am I?) cannot write to it. You can change ownership 
with `sudo chown -R vagrant arangs2015`. Then download the data into the VM and run the 
pipeline.

Requirements
------------

* [virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [puppet](https://github.com/puppetlabs/puppet/releases)
* [vagrant](https://www.vagrantup.com/downloads.html)