![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Building and composing docker containers
----------------------------------------
*2015-05-13*

On the previous day we learnt that docker containers are a more efficient way to specify
an entire environment in which our pipeline can be run. The efficiency gains come from the
fact that docker uses some of the functionality that is already present in the host, so 
that we save on disk space and processor and RAM needs.

Given that docker containers can apparently combine the functionality they provides with
those of the host, it should perhaps be possible to layer functionality even more by 
composing new functions from multiple containers. Today we will explore this functionality
by looking at `docker-compose`.

We hope to accomplish the following learning goals:

Docker
------

- Dockerfile syntax
- Docker build contexts
- `docker-compose`
- How docker-compose can automate volume mounts to host locally stored data
- How the logging system can help debug applications.
