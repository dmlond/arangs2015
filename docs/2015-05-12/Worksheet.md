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
- Assign more RAM to the VM by editing the Vagrantfile.
- This box does not use `bash`, it uses `sh`. Specify this in the Vagrantfile using `config.ssh.shell="sh"`
- When you're done configuring the Vagrantfile, save it, then launch the VM with `vagrant up`
