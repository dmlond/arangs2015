![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Sharing automated, reproducible NGS analyses
--------------------------------------------
*2015-05-15*

On this last day we will tie it all together and practice how to share our analysis
environments with each other and the world. We have looked at `git` and Github as a way
to track and share the entire history of text files and projects. We have looked at 
virtualization as a way to run controlled environments on host computers. We have looked
at `puppet` as a way to specify additional dependencies to be installed on a VM, and at
Vagrant as a way to combine downloading, provisioning and launching virtual machines. We 
have therefore learnt that one way to share an analysis environment is using a Vagrantfile
and a puppet manifest.

Subsequently, we discovered that a more efficient way to run controlled environments is 
by using `docker`. We saw that docker containers can be composed from other containers,
and that the full specification of this process is contained in a Dockerfile.

During this week we have run a simple analysis pipeline in a number of different 
environments, starting from a poorly controlled, hard to reproduce situation where tools
and data are installed by hand on operating systems that each may have their own quirks.
We then moved towards more controlled situations.

Finally, now, we will look at convenient was to share our analysis environments. For 
vagrant there is a list of boxes that is managed on Github (pull requests are welcome)
that is hosted on the domain [vagrantbox.es](http://www.vagrantbox.es/). However, a more
complete solution, that includes packaging and hosting, is provided by 
[Atlas](https://atlas.hashicorp.com/) (previously known as vagrantcloud.com).

For Docker containers there is similar functionality provided by 
[Docker hub](https://hub.docker.com): hosting of containers, including even a facility
to search useful containers using `docker search`.