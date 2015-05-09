![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

ARANGS15
========
Introduction, Installation, Git and Github 101 
----------------------------------------------
*2015-05-11*

Computationally intensive research, such as genome assembly or other types of analyses in
Next Generation Sequencing, ought to be reproducible so that other researchers can verify
results and build on them. This is hampered by the fact that analysis pipelines often
depend on numerous, hard-to-install programs that each have different versions and that 
can be parameterized with a variety of settings. It is therefore no good if we describe 
our research methods simply as "we used `foo` (Smith, 2013) and `bar` (Jones, 2014)".

Our entire research environment, with all the tools and data that we use and how we use 
them, should be fully described in machine-readable configuration and executable files. 
In turn, these files should be fully versioned so that there is no ambiguity about what 
version is used. To manage that we will use a system that originates in the Linux 
community, `git`, which tracks the history of text files (in any syntax format) in public,
such that different people can collaborate on the same files.

Many different providers host `git` repositories. The most popular one, which has the best
features for collaboration, is Github. Today we will dive into `git` and Github, to 
accomplish the following learning goals:

Github
------

- The open source culture, and licensing
- Class Github repositories
- Forking our repositories to make your own copy
- Using forks as a proxy for 'citations' of code
- Following our repositories
- Pulling changes from our repositories
- Submitting Pull Requests (sharing back)

Git
---

- Cloning repositories
- Local and remote repositories
- .gitignore and secrets
- The Git Workflow

Requirements
------------

- A [github](http://github.com) account
- [git](http://git-scm.com/downloads)