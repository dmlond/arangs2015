* Create a Docker build context that builds an image from ubuntu:trusty.  Build your own image (use your machine_name, e.g. t2, in the name) from this.
* run an interactive bash shell in your new image
* create a file in the build context you created above called info.txt with the following information in it:
This is a file on the image
Add this file to the resulting image at /etc/info.txt
* Run an interactive bash shell with your new image. See if you can find the file (list it, cat it)
* Run another container of your image, but instead of running 'bash', run 'cat /etc/info.txt'
* add a CMD to cat the contents of /etc/info.txt
* Run a container of your image without any command
* create a docker-compose.yml file in the build context directory.  Have it build the current directory (.), and run 'echo FOO' as the command. Build it and run it with docker-compose.
* (Bonus) save a tar file of the docker image on your file system (run docker without any arguments for a hint).  Use scp to share your image with your neighbor (e.g. if your neighbor machine is t3, use the following to copy your_image.tar to their home directory):
```bash
$ scp t3:your_image.tar
```
* Load up your neighbors image
* Repeat the ways you ran your image with your neighbors image.

Take a look at this [Docker Build Context](https://github.com/dmlond/arangs2015/tree/master/conf/docker/bwa).

* What files are in the context?
* What does install_bwa.sh do?
* How does the Dockerfile use install_bwa.sh
* What do you think will happen if you build and run a container of this with no arguments?

Take a look at this [docker-compose.yml](https://github.com/dmlond/arangs2015/blob/master/docker-compose.yml)

* how many services are defined?
* what do they build
* what do you think the 'volumes' argument does?
* see if you can build and run some of the services

Take a look at [pipeline.docker.sh](https://github.com/dmlond/arangs2015/blob/master/bin/pipeline.docker.sh)
* How does it use docker?
* Can you run it?
