GitHub Worksheet
================

* Create your personal Github Account
* Find the Arangs2015 repository
  - Does it have an Open Source License? MIT
  - Who Owns the Repository? dmlond
  - How many people have forked the repository? 11 (and counting)
  - How many contributors are working on this repository? 2
  - Who are they? dmlond, rvosa
  - How many commits have been made? 73 Who made the latest commit? dmlond
* Take a look at the data directory.
  - Where did we get the data that we analyzed for our pipeline? sra dnanexus
  - Do we make it easy for you to download the same data that we used? yes by providing links to the actual files
* Go back to the bin directory
  - What is consistently found in each directory? Readme.md
  - View the pipeline.sh file
  - View it in raw mode
  - Who can you blame for this file? dmlond and rvosa
  - What is its history?
* Go back to the repository root
  - What is the git clone url for the repository?
    https https://github.com/dmlond/arangs2015.git
    ssh git@github.com:dmlond/arangs2015.git
    You should clone the ssh one to push stuff back
* Fork our Repository
* Check to make sure the `git` executable is available. If not, install it.
sudo yum install git
* [Create an SSH key](https://help.github.com/articles/generating-ssh-keys/) so that you can commit and `push` changes back to your repository.
```bash
$ ssh-keygen -t rsa
```
* [Merge the changes made upstream into your local fork](https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/)
