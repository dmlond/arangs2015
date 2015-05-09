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

- The open source culture and github
- Course Github repositories
- Forking our repositories to make your own copy
- Using forks as a proxy for 'citations' of code
- Following our repositories
- Pulling changes from our repositories
- Submitting Pull Requests (sharing back)
- Cloning repositories
- Local and remote repositories
- .gitignore and secrets
- The Git Workflow

Schedule
--------

The outline for today is as follows:

- _Session 1_: Introductions. Expectation management: what do we expect from the course,
what could be added/changed/removed, are we all technically ready for this? All create
accounts on Github.com and install `git` if needed.
- _Session 2_: A simple pipeline. We will look at a pipeline in shell script that maps
short reads against a reference genome. If we are comfortable with Linux shell commands
we should be able to understand what the pipeline does. All fork and clone the course 
repository and try to run the pipeline. Install the tools and data that the pipeline 
requires as needed.
- _Session 3_: First run of the pipeline. If all tools were installed correctly and the
data are there we should be able to run the pipeline. If there are any bugs in the 
pipeline whose fix the whole class benefits from, commit your corrections to your 
repository and submit a pull request.
- _Session 4_: Complete running the pipeline. Address any questions and confusions that
arose during the previous sessions.

Requirements
------------

- A [github](http://github.com) account
- [git](http://git-scm.com/downloads)
- any tools and data needed by the pipeline