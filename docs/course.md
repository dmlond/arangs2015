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
    - NB other possible tools include **chef**

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



## DAY 3

[Worksheet](https://github.com/rioualen/arangs2015/blob/master/docs/2015-05-13/Worksheet.md)

### Morning wrap-up

* XMind.
* Commit.

### Taking a look at .json format

### Editing puppet file

* Move stuff from `pipeline.sh` to `default.pp` puppet file?

```
# recreate BWA index if not exists
if [ ! -e $REFERENCE.bwt ]; then
	echo "going to index $REFERENCE"

	# Warning: "-a bwtsw" does not work for short genomes,
	# while "-a is" and "-a div" do not work not for long
	# genomes. Please choose "-a" according to the length
	# of the genome.
	bwa index -a bwtsw $REFERENCE
else
	echo "$REFERENCE already indexed"
fi
```

* *What exactly goes to pipeline, to puppet to Vagrantfile, to VBox?*
    - Data download scripts `download_plasmodium_raw.sh` and `download_plasmodium_reference.sh`
    - Bwa and Samtools download scripts
* Puppet is actually a pipeline itself?
* Reduction of the pipeline to the very basic operation genome alignment? Basically, `fasta` + `fastq` = `sam`, `sai`, etc

### Docker

#### Docker vs virtualization
*md table*
Docker  Virtualization
image   image
host    host
container   instance
* Containers use up less resources & space
* Several containers can share host resources
* They can have their package version without conflicts
*graphviz sch*
* Security issues ?
* Launch Docker image if available, else downloads them on the fly from Docker registry.
* Image vs client vs machine ?

[sch](http://www.google.fr/url?source=imglanding&ct=img&q=http://zdnet3.cbsistatic.com/hub/i/r/2014/10/02/1f130129-49e2-11e4-b6a0-d4ae52e95e57/resize/770x578/3f83f67acfa33fe05865373b2b4b71dd/docker-vm-container.png&sa=X&ei=MqVUVeS1K6rlsAS_kID4DQ&ved=0CAkQ8wc&usg=AFQjCNHynakxkWA3l42a6TRdpgbwufMhNA)
[sch2](http://www.google.pt/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0CAcQjRw&url=http%3A%2F%2Fwww.linformaticien.com%2Factualites%2Fid%2F33508%2Fdocker-1-0-l-outil-qui-va-booster-l-adoption-du-cloud.aspx&ei=Y6hUVZLNH42nyATptoCgCw&bvm=bv.93112503,d.cWc&psig=AFQjCNEpfqcUKnPSPqXd7Ryqn6EH3Orc0g&ust=1431697864253097)


## DAY 4

[Worksheet](https://github.com/dmlond/arangs2015/blob/master/docs/2015-05-13/intro_docker/Worksheet.md)
[Readme](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-13/intro_docker)
### Docker again

* So what are trhe differences beteween docker, docker machine and docker compose anyway ?
Answers can be found [here](http://flurdy.com/docs/docker/docker_compose_machine_swarm_cloud.html)

 
* Few links
 > Nice n quick Docker [tuto](http://www.docker.com/tryit)
 > [User](https://docs.docker.com/userguide/) [guides](https://docs.docker.com/machine/)
 > [Wikipedia](http://en.wikipedia.org/wiki/Docker_%28software%29)



#### Practice


* install docker-machine
* install docker
* create a docker-machine called arangs2015
```
docker-machine create --driver virtualbox arangs2015

```

* configure docker to talk to your arangs2015 docker-machine

```
eval "$(docker-machine env arangs2015)" # create ENV var

participant@t10:~/Desktop/arangs2015$ env | grep DOCKER
DOCKER_HOST=tcp://192.168.99.100:2376
DOCKER_TLS_VERIFY=1
DOCKER_CERT_PATH=/home/participant/.docker/machine/machines/arangs2015
```

* pull the busybox image from the Docker registry
```
docker search busybox
docker pull busybox
```
* run an interactive + tty sh session inside a busybox image container
`docker run -i -t busybox`

#### in another terminal

* list the docker-machines and their state
`docker-machine ls`
* configure docker to talk to your arangs2015 docker-machine
* list docker images
`docker images`
* list docker containers
`docker ps`

#### in the terminal where you are running busybox
    echo "HELLO WORLD"
    uname -a
    ls /
    try some other commands
    `exit`
    echo $?
    instead of running 'sh', run ls /notthere
    echo $?
    list out *all* containers
    rm all containers
```
docker ps -a
docker rm $(docker ps -aq)
```
 > There are as many containers as ran docker machines

`docker rm $ID`
    remove the busybox image
`docker images`


#### TODO
* run an interactive + tty irb session inside a ruby:latest container (do not pull first)

**inside the container**
```ruby
puts "HELLO WORLD"
puts "GOODBYE WORLD"
exit
```
* echo $?
* run it again
```
abort 'argh!'
```
* echo $?
* what did you see
#### End of TODO

* run an interactive + tty bash session inside a busybox container with your Host home directory mounted as a volume to /mydir

Settings:

VBox > arangs Settings > Sharing > setup home dir
Back to terminal
```
docker-machine ls
docker-machine ssh
```
**inside the container**
```
sudo mkdir /home/participant
sudo mount -t vboxsf HOME /home/participant
ls -ltr $HOME
```

#### TODO
echo "HI FROM DOCKER" > /mydir/hi.from.docker
exit
* ls ~/hi.from.docker
* cat ~/hi.from.docker
* rm ~/hi.from.docker
* run a background (daemon) tutum/hello-world container, with a name 'helloworld', and exposed port 80
* list out the running containers
* dump the log of the helloworld container
* inspect the helloworld container
* find out what port on your Host port 80 of the container is exposed to
**in another terminal**
* find out which ip address is used by the docker-machine
**open your browser**
* navigate to http://$docker-machine-ip:$HELLOPORT
* what do you see?
* stop the helloworld container
* rm the helloworld container
* rerun the helloworld container, but do not export port 80 (remove '-p 80')

**open your browser**
* navigate to http://$docker-machine-ip:$HELLOPORT
* what do you see now?


**in the terminal**
* run an interactive + tty 'sh' session inside another tutum/hello-world container linked to the 'helloworld' container as helloworld

**inside the container**
```
wget -O - http://helloword
exit
```
* why did you not have to put a PORT on the url above?
* stop the running 'helloworld' container
* remove all containers

**in the terminal**
* list and remove all stopped containers
* list and remove all images
* remove all images
* stop the docker-machine.
#### End of TODO


## Beginning of DAY 4 program

[Worksheet](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-14/docker_build)
[Readme](https://github.com/dmlond/arangs2015/tree/master/docs/2015-05-14/)

* *Docker images are designed to host a single application and its dependencies. They are designed to run on the host as if natively installed. To compose a pipeline, you use or create docker images for each application required, and run containers from the host more or less hooked in to the host, similar to the way you would run a natively installed application.*
* *Docker images always must start from some other Docker image as a starting point.*
Syntax name/tag ex. Unbuntu/trusty
container or image ?
*"docker build context" needed -> dir -> docker file*
docker build dir = image

### Docker Compose

https://docs.docker.com/compose/install/
1.
su -
curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
2.
create dir
cd dir
3.
write docker file
4.
write docker-compose.yml
5.
build
6.
run

## Day 5

One more link about [docker](https://www.conetix.com.au/blog/what-is-docker?utm_content=buffer32d58&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
Alternatives to Docker: LXD, rkt.

