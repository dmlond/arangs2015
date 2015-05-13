# ARANGS 2015

## DAY 1

### Introduction

Presentations & expectations.

### Versioning: setting up git & github

[Instructions](https://github.com/rioualen/arangs2015/tree/master/docs/2015-05-11/github)

* Forking the course files: [here](https://github.com/dmlond/arangs2015)
* What's the difference between cloning and forking?
    > See [stackoverflow](http://stackoverflow.com/questions/6286571/git-fork-is-git-clone)
* ssh connection to github:
    > [Link](https://github.com/settings/ssh)

    ```ssh-keygen -t rsa```
    > Some [useful](https://help.github.com/articles/set-up-git/) [links](https://help.github.com/articles/generating-ssh-keys/)
    
    ```vi .gitconfig```
    
    > Enter editing mode: type "i"
    
    ``` 
    [user]
     name = Claire Rioualen
     email = claire.rioualen@inserm.com
    [push]
     default = simple
    ```
    
    > Save and quit: type "escape" to quit editing mode, then ":wq"

[Instructions](https://github.com/rioualen/arangs2015/tree/master/docs/2015-05-11/git)
  
* Setting up git:
    [Link](https://help.github.com/articles/set-up-git/)
```
apt-get install git
git init
git clone https://github.com/rioualen/arangs2015.git
git remote -v
```
![Alt text](http://g.gravizo.com/g?
  digraph G {
    node [shape=box,style=filled,color=".7 .3 1.0"];
    Github -> Local [style=bold,label="pull",lp="10"];
    Local -> Github [style=bold,label="push",lp="20"];
  }
)

NB: Cloning can be done through ssh or https, better use the ssh one. 

```
git add course.md
git status
git commit -m "commit message"
git status 
git push origin master
```

Conflicts management: diff files, then edit locally, add and commit again.
In the worst case: delete the whole directory and clone it again...

* ```git``` is built-in Rstudio

### Running a basic pipeline

[Instructions](https://github.com/rioualen/arangs2015/blob/master/data/README.md)

* Pipeline can be found in bin/ 
* Data can be fetched automatically using the scripts `download_plasmodium_raw.sh` and 
`download_plasmodium_reference.sh` in the bin folder.
* `bwa` and `samtools` should be installed (see scripts in bin/): bwa-0.7.12 & samtools-1.2 (different from apt-get versions)
   
    > SAM = Sequence Alignment/Map)

    > BWA = Burrows-Wheeler Aligner 

* Git can ignore files if they're too big to commit, needed only locally...

`vi .gitignore`
```
\*sam\*
\*fasta\*
...
```

* edit `$PATH`

 `export PATH=/folder/of/executable:$PATH`

A couple of important points:
- the folders in the list are separated by `:`
- using the bash shell (!) the list is read from left to right. In CShell (`csh`) it is read right to left.
- in general, shells split "words" on spaces, unless the whole sentence is inside quotes. So, if any of the
folders has spaces in it (`/Documents and Settings/`) you have to quote the list, otherwise it will stop
at `/Documents`
- If you want to put a word right after `$PATH`, you can delimit the variable name with curly braces: 
`${PATH}foo`

## DAY 2

[Worksheet](https://github.com/rioualen/arangs2015/blob/master/docs/2015-05-12/Worksheet.md)

### Morning wrap-up

* Use of XMind.
* Commit file.

### VirtualBox

* md5 is a way to check the integrity of an *.iso file.
* VM set-up:

    * Memory (RAM)
    * Virtual hard drive (VDI)
    * Disc image

[graphviz]

### Installing Vagrant

    * Installing [tiny](https://atlas.hashicorp.com/olbat/boxes/tiny-core-micro), a Vagrant box.
    * Just run `vagrant init`
    * Edit `VagrantFile`
    * Run the VM: `vagrant up`

![Alt text](http://g.gravizo.com/g?
  digraph G {
    edge [dir=none];
    node [shape=box,style=filled,color=".7 .3 1.0"];
    VBox -> Vagrant [style=bold,label="Vagrantfile"];
  }
)



* Develop own box?
* Provisioning?

### Adding Puppet in the loop
    
* Download puppet

```
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
sudo apt-get -y install puppet
```

* Check puppet script without actually executing it.

`puppet apply --noop default.pp`

* Update `Desktop/arangs2015/conf/vagrant/manifests/default.pp` file to clone the git repository:

```
# clone git repository
'clone_git':
command   => 'git clone https://github.com/rioualen/arangs2015.git',
cwd       => '/home/vagrant',
creates   => '/home/vagrant/arangs2015',
require   => Package[ 'git' ];
``` 
* Change setting in the VM, links to data (could've re-run data download scripts instead)

```
	'chown_repo':
		command   => 'sudo chown -R vagrant /home/vagrant/arangs2015',
		require   => Exec[ 'clone_repo' ];
	'rm_repo_data':
		command   => 'rm -rf /home/vagrant/arangs2015/data',
		require   => Exec[ 'clone_repo' ];
	'symlink_data':
		command   => 'ln -s /vagrant_data /home/vagrant/arangs2015/data',
		require   => Exec[ 'rm_repo_data' ];
```


* Run Vagrant from `Desktop/arangs2015/conf/vagrant`

```
(vagrant up)
vagrant provision
vagrant ssh
```

### Run the pipeline from the VM

* Download ref genome `*.fasta`
* Download read files `*.fastq.gz`
* Run `pipeline.sh`















