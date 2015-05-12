create a ~/.gitconfig file with our [example](https://github.com/dmlond/arangs2015/blob/master/docs/2015-05-11/git/example_gitconfig)
- Clone your personal fork of our repository onto your machine
choose the SSH clone url
```bash
$ git clone your_ssh_clone_url
```
- Use git to show information about the commit history for the project
```bash
$ git log
```
- Show information about files changed during the commits
```bash
$ git log --name-only
```
- Show information about files changed, with the status of each change for
commit 4c4ff5ece4c3132c6fa29f3e826e3272686c78e0 (try 4c4ff5ece4)
```bash
$ git log -1 -U --name-status -c 4c4ff5ece4c3132c6fa29f3e826e3272686c78e0
$ git log -1 -U --name-status 4c4ff5ece4
$ git show 4c4ff5ece4
```
- add a file to the repository (use your favorite text editor)
- use git status to find out the state of the repository
- try git status --porcelain
- What if you didnt like this file, how could you get rid of it (dont do it)
```bash
$ git checkout -- filename
```
- stage this file change
```bash
$ git add filename
```
- what do git status, and git status --porcelain show
- How could you get rid of this file now? Go ahead and fully delete the file.
```bash
$ git reset HEAD file
$ rm file
```
- Create a new file, and make sure it gets committed to the repository
- What remote git repositories does your git repository know about?
```bash
$ git remote -v
```
- push your new changes to the file up to your github repository
```bash
$ git push
```
- Find the newly committed file in your github repository.  Edit it using
Github and make a change.
- Go back to the commandline and use git to pull these changes
```bash
$ git pull
```
- unix rm the file you created.
```bash
$ rm file
```
- What do git status and git status --porcelain show?
- Can you get it back?
```bash
$ git checkout -- file
```
- rm it again, then stage the removal.
```bash
$ rm file
$ git rm file
```
- get it back again
```bash
$ git reset HEAD file
$ git checkout -- file
```
- git rm the file.  How is this different than using unix rm?
you can git rm a file, and it will physically remove it and git rm it at
the same time

- Commit the removal of the file, and push the changes up to Github
```bash
$ git commit
```
- Use the Github Web interface to inspect changes for this file.  Can you
still find the contents of the file in Github?  Do you think it is a
good idea to store usernames and passwords in publicly available GitHub accounts?

NO, because GitHub allows you to review the history of your files, where they can
see the passwords.  There are ways to remove them, but it is not easy

- See how far you can go with this by changing and staging various file combinations, then changing already staged files, then reverse staged changes, untracked changes of files with staged changes, and fully revert some of the files.
    - Avoiding what git command will ensure that none of these changes ever
    make it into the git log for the repository, or get pushed to a remote
         git commit
    - What if you had committed (without pushes) a bunch of changes to your local fork of the repo, but decided that you didnt like any of it, and would like to get rid of all those commits and revert to the state of the repo as it exists in GitHub.  What would be the easiest way to do this?
    ```bash
    $ cd ..
    $ rm -rf arangs2015
    $ git clone SSH-CLONE-URL
    ```
- Edit one of the files, but do not add the changes.  Create a branch called 'try_bowtie'.  Use git status to find out the state of the repo.  Add and commit
your changes to the branch.  Use git to find out all the branches you have made (you might see branches pulled in when you forked the repository from someone else).  Change to the master branch.  Use git status to find out the state of the repository.  Can you find your changes?  Switch back to the 'try_bowtie' branch.  Can you find your changes now?  Switch back to the master branch.  Merge try_bowtie in to the master branch.  Use git status to find the status of the master branch. Commit and push these changes to Github.  Use the Github web interface to find out if the branch was pushed. Remove the 'try_bowtie' branch from your repository.
```bash
$ echo "CHANGED" >> changed_file
$ git checkout -b try_bowtie
$ git status
$ git add changed_file
$ git commit changed_file
$ git branch
$ git checkout master
$ git status
$ git checkout try_bowtie
$ git status
$ git checkout master
$ git merge try_bowtie
$ git commit
$ git push
$ git branch -D try_bowtie
```
