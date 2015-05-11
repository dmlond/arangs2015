## ARANGS 2015

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
