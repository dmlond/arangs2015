![GTPB](http://gtpb.igc.gulbenkian.pt/bicourses/images/GTPB2015logo.png "GTPB")

Git
===
[A Brief History](http://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git)
Git was created in 2005 by Linus Torvalds as the main system to manage the source code for the Linux Kernal. Like all source code version control systems, git was primarily designed by software engineers for software engineers. Some of its arcane workflow patterns are meant for complex software projects, where developers need to try lots of different things on the core source of the project in parallel, and then merge in the paths that turned out to be useful. But its core features are useful for researchers wanting to make their research software, and even data, accessible to other researchers.

The Git Workflow
----------------

 Git has a basic worflow that all users will encounter:

  - Make a change to the files in the repository (edit a file, move a new file in, remove an already tracked file).  These create 'untracked changes'.
  - Discard untracked changes to files, leaving them in the state they were in when they were last committed.
  - Stage (git add, git rm, git mv) one or more untracked changes to become the next commit.  Only these changes will be recorded by git when you commit the changes.  This encourages the creation of logically grouped commits of sets of files with a shared history, or raison d'etre.
  - Commit the staged changes to the repository, along with a description of why
  these changes were applied (a commit message).

Git also has some more advanced workflows that may or may not be useful in a scientific context:

  - Make a change to one or more files, stage these changes, then change your mind and revert them to their previously committed state.  Git requires you to unstage (reset) the changes before you can revert them.
  - Make a change to one or more files, stage these changes, then make another change to one or all files with staged changes. In this situation, git will retain up to three states for the file:
    - untracked 'new' changes
    - staged changes
    - the last committed changes (if present)
  It is possible to revert the untracked changes, leaving the file in its currently staged state. It is also possible to unstage the staged changes without losing the current untracked changes (this would allow you to forget about staged changes in favor of the current changes).  Finally, it is possible to revert the file and unstage its changes all the way back to its previously committed state.
    - create a branch in your repository.  These allow you to pursue changes tothe code base in parallel with the 'master' (or other branches).  If the changes pursued end up being fruitful, git allows you to merge all changes in the branch into another branch (including the master), even if you have made
    commits in the target branch (subject to normal git merge behavior).

It is important to realize that any directory that has been initialized with git (either by git init, or git clone) is an entire git repository unto itself. You could archive the directory with tar or zip and copy it to another server, or send it to another user. These would essentially be 'clones' (like running git clone) of your repository. With this in mind, git provides workflows that only make sense when working with git repositories stored on remote systems (other servers, github, bitbucket, etc.).:

  - pull changes committed to the remotely stored repository into your repository. If the changes can be merged in without conflict, you will not need to add/commit them again.
  - If conflicts are found when pulling changes to a remote repository into your repository, you will have to [resolve the conflicts](https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/).
  - push changes that you have committed to your repository to the remote repository
  - attach branches (including master) to different remote git repositories. This can be useful if you are developing a fork of someone else's repository, but you want to make it easy to merge changes they make into your own on a regular basis.  You can routinely switch to the branch tracking the other project, pull in recent changes, and then decide which of the changes you want to merge into your other branch(es).

The Git Scientific Workflow
---------------------------

In science, you create a project folder to house all of your data, documentation,
project specific source code, and binary executables in a
[well-designed project directory structure](http://dx.doi.org/10.1371/journal.pcbi.1000424). As you generate or
receive new datasets, you should document information about them, including
their provenance. As you make changes to your source code, you should document
details about these changes, and tie these changes to changes in datasets
produced by the changed code. If you try a new version of externally developed
software, you should document this, especially if changes are seen in the data
produced by the change in version. For each figure that you generate for the
publication manuscript, you should document all input data, scripts, and
external software that you used to generate them. You should document the
production of the manuscript, especially changes that are made to it that are
the result of new information from external research, or the use of new
technology.
  Gits features that can make it easy to track all of this documentation:

* Project centered: each project directory should be a git repository. If one project depends on code from another project, git provides multiple ways to 'reference' the other project:
  - fork: we have already seen this in action when you forked the class repository. In this scenario, Project B is a direct reuse of the files created
  for Project A. By forking project B from project A, you can use features of
  git to merge in changes to project A files that are useful to project B.
  - submodule: git makes it possible to store a pointer in one repository
  to another repository. In this scenario, Project A uses code from one or more
  other Projects.
* Commit Messages: All source control systems are designed to make it easy to tie
changes in the project file system to descriptions and information about why those changes were made.  Much of the above documentation can be managed by carefully controlling the way you commit changes to files in the project to the git repository, and crafting well designed, informative commit messages to go with each commit.
* Logical Commits: Researchers might use this by committing changes to analysis code along with new datasets that were produced by running the newly changed code, with a commit message describing how the changes to the code affected the changes to the dataset.
* Clones and Forks: When you copy/tar/zip your project directory, or push it to Github, you are creating a clone.  Anyone that installs your clone on their machine (untar/unzip/git clone) can use the git command to access its entire life-history documentation, and even revert files to previous states to investigate or use them. They can then adapt the repository to their own uses, commit new changes, etc. without affecting the original repository. In addition, both you and your colleagues retain the potential to push and/or pull changes made in one fork of the repository into any other fork.
* Citeable Code: github and zenodo have teamed up to allow specific versions of a [git repository to be assigned a DOI](https://guides.github.com/activities/citable-code/) that people can cite. An example of that is [here](https://github.com/naturalis/monophylizer) (notice the DOI badge at the bottom of the README.md).
* Testable Code: you can make it so that after every push to github, the repository is submitted to a server that runs the tests you have written for your code. This way, users (and yourself) can verify that everything (still) works. An example is [here](https://github.com/naturalis/supersmart) (notice the ''build passing'' badge. Click on it and you can see the test results).

Git Gotchas
-----------

- Git does not track empty directories, nor does it track any set of hierarchically arranged directories that terminate in empty directories. To see this in action, do the following:
```bash
mkdir foo
git status (note foo is not there)
mkdir foo/bar
git status (note, neither foo, nor bar are there)
mkdir foo/bar/baz
git status (still no foo, bar, or baz)
rm -rf foo
```
This becomes apparent when you push your repository to github.  You will notice that any empty directories are completely missing.  Git only tracks directories in the context of its files.

- Git can store and even 'version' changes to binary files, but it does so inefficiently (it stores the entire contents of each version in its repo history directory).  It will not provide visual diffs of binary files, unless there are [tools](http://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes) that it can use to get a textual proxy of the files that it can use to compare using traditional text diff.

Resources
---------
- https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf
- http://rogerdudler.github.io/git-guide/
- http://git-scm.com/book/en/v2/Getting-Started-Git-Basics
- http://git-scm.com/documentation/
