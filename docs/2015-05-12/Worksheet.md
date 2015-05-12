Launching a tiny Linux by hand on Virtualbox
============================================

- Download the [SliTaz](http://www.slitaz.org/en/get/) ISO and launch it as a LiveCD in VirtualBox (no virtual drive needed)
- In Virtualbox, look at the different ways to end the SliTaz process. What are the differences between "pause", "save state" and "power off"? In what state are you able to change the system settings of the VM?
- How much RAM is assigned by Virtualbox to the VM? By how much can you increase that "in the green"?
- How many processors are assigned? By how much can this be increased?
- In SliTaz, what package manager does this Linux distribution use?
- Would you be able to compile from source on this VM in its current state?
- What tools would you look for to check if you can compile from source?
- Is git installed?

Launching a tiny Linux with Vagrant
===================================

- Install [vagrant](http://vagrantup.com).
- Have a look at the available [vagrant boxes](https://atlas.hashicorp.com/boxes/search)
- Search for a `tiny` box for the provider `virtualbox`
- Click on the search result. There should be an instruction for how to initialize the box in a `fixed width font`
- Create a new folder in the terminal and navigate into it. Then run the initialization command.
- There should now be a file called `Vagrantfile`. Open it in a text editor.
- Assign more RAM (2048) to the VM by editing the Vagrantfile.
- Turn on the GUI 
- This box does not use `bash`, it uses `sh`. Specify this in the Vagrantfile using `config.ssh.shell="sh"`
- When you're done configuring the Vagrantfile, save it, then launch the VM with `vagrant up`
- There might be some error messages where it tries to "mount" folders. If you wait long enough it'll give up - it's not a problem.

Launching and provisioning a usable Linux with Vagrant and Puppet
=================================================================

![tahr](http://www.exclusiveadventuresnz.com/images/hunting/big-game/bull-tahr/bull-tahr-banner1.jpg)

- Have a look at this edited [Vagrantfile](https://github.com/dmlond/arangs2015/blob/master/conf/vagrant/Vagrantfile)
- Which Linux distribution is specified in this file? Can you find it in the vagrant cloud? Is this a common distribution? 
How does it compare to the operating system of your host desktop? Are there likely to be guest additions for this
distribution?
- Provisioning is the process of installing and configuring additional tools on a base OS. Before lunch we saw an
example of provisioning using shell commands in the Vagrantfile. Which provisioner is used in this edited Vagrantfile?
- Install `puppet` using the following commands:

```
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
    sudo dpkg -i puppetlabs-release-trusty.deb
    sudo apt-get update
    sudo apt-get -y install puppet
```

- Now have a look at [this provisioning script](https://github.com/dmlond/arangs2015/blob/master/conf/vagrant/manifests/default.pp).
- What would the instructions after `dl_bwa` (line 35) do?
- What immediately preceding steps does `untar_bwa` require?
- What is the Current Working Directory (`cwd`) where BWA is unzipped?
- What is the function of `symlink_bwa`? What other methods could be used to achieve the same effect (think of `$PATH`)
- Do a test run of the provisioning script. If you do it as follows, nothing will be installed yet:

 `puppet apply --noop default.pp`

- Now try to add another install command to the provisioning script. Make the command clone the course github repo 
(`git clone`). Make this happen in the home directory of the vagrant user (`cwd` should specify this). Make sure that
the for this step required package `git` is already installed. Specify the name of the folder that will be created.
