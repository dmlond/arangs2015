![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

vagrant/virtualbox
==================
This folder contains configuration files for downloading, provisioning and launching a
virtual machine.

The Vagrantfile contains configuration options for hiding or showing the graphical 
interface, changing the amount of RAM for the VM, and specifies what provisioner to 
use (puppet) and where the manifests are.

The puppet manifest (in manifests/default.pp) contains the installation instructions for
`bwa` and `samtools` and their dependencies. In addition, the manifest clones the 
arangs2015 git repository into the VM, so that the pipeline scripts are available.

To get started with this, firstly:

* install virtualbox: https://www.virtualbox.org
* install vagrant: http://www.vagrantup.com/

You will then be able to issue the following commands. Where we say `local>` we refer to
commands typed in the terminal of the host OS. `vm>` are commands that are issued inside
the vagrant box.

* bring up the arangs15 box: make sure you are connected to the internet

    `local> vagrant up`

* ssh to arangs15, list out the contents, check the version of bwa and samtools, then exit back to your box

    `local> vagrant ssh`

    `vm> ls`

    `vm> bwa`

    `vm> samtools`

    `vm> exit`

* Capture and use the vagrant ssh-config as a standard ssh configuration file (for use by 
ssh, and perl, python, ruby, etc. ssh wrappers)

    `local> vagrant ssh-config > arangs15.conf`
    
    `local> ssh -F arangs15.conf arangs15`
    
    `vm> exit`

* check the status of the arangs15 box

    `local> vagrant status`

*  suspend the arangs15 box (does not destroy the image, so puppet does not need to run 
again, and any files stored on the virtual filesystem are preserved), then bring it back 
up:

    `local> vagrant suspend`
    
    `local> vagrant up`

* destroy the arangs15 box (all data on the virtual filesystem, including puppet 
configuration, are destroyed)

    `local> vagrant destroy --force`