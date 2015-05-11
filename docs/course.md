## ARANGS 2015

### Introduction

Presentations & expectations.

### Versioning: setting up git & github

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
    ```
    
    > Save and quit: type "escape" to quit editing mode, then ":wq"
    
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
```
git add course.md
git status
git commit -m "commit message"
git status 
git push origin master
```

* ```git``` is built-in Rstudio

