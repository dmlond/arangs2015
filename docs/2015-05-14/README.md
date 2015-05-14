![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Building and composing docker images
----------------------------------------
*2015-05-13*

On the previous day we learnt that docker images are a more efficient way to package applications and data.  Today we will get a better understanding of how
to use this efficiency for our own purposes.  We will be building our own docker
images.  We will see how Docker allows us to create an almost universally
compatible package for each 'application' that is required in our analysis
pipeline. We will also learn ways that Docker can be used to package our data.

We hope to accomplish the following learning goals:

Docker
------

- Docker build contexts
- Dockerfile syntax
- 'docker-compose'
- Creating a data distribution image that makes our data easily accessible
  to our application images using --volumes-from
- Using docker logs to find out more about our running (or not) containers
