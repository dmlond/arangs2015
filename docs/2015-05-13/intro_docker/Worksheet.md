* install docker-machine
* install docker
* create a docker-machine called arangs2015
* configure docker to talk to your arangs2015 docker-machine
* pull the busybox image from the Docker registry
* run an interactive + tty sh session inside a busybox image container

**in another terminal**
* list the docker-machines and their state
* configure docker to talk to your arangs2015 docker-machine
* list docker images
* list docker containers

**in the terminal where you are running busybox**
* echo "HELLO WORLD"
* uname -a
* ls /
* try some other commands
* exit
* echo $?
* instead of running 'sh', run ls /notthere
* echo $?
* list out all containers
* rm all containers
* remove the busybox image
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
* run an interactive + tty bash session inside a busybox container with your Host home directory mounted as a volume to /mydir

**inside the container**
```
ls /mydir
echo "HI FROM DOCKER" > /mydir/hi.from.docker
exit
```
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
* stop the docker-machine
