- Clone your personal fork of our repository onto your machine
- Use git to show information about the commit history for the project
- Show information about files changed during the commits
- Show information about files changed, with the status of each change for
commit 4c4ff5ece4c3132c6fa29f3e826e3272686c78e0 (try 4c4ff5ece4)
- add a file to the repository (use your favorite text editor)
- use git status to find out the state of the repository
- try git status --porcelain
- What if you didnt like this file, how could you get rid of it (dont do it)
- stage this file change
- what do git status, and git status --porcelain show
- How could you get rid of this file now? Go ahead and fully delete the file.
- Create a new file, and make sure it gets committed to the repository
- What remote git repositories does your git repository know about?
- push your new changes to the file up to your github repository
- Find the newly committed file in your github repository.  Edit it using
Github and make a change.
- Go back to the commandline and use git to pull these changes
- unix rm the file you created.
- What do git status and git status --porcelain show?
- Can you get it back?
- rm it again, then stage the removal.
- get it back again
- git rm the file.  How is this different than using unix rm?
- Commit the removal of the file, and push the changes up to Github
- Use the Github Web interface to inspect changes for this file.  Can you
still find the contents of the file in Github?  Do you think it is a
good idea to store usernames and passwords in publicly available GitHub accounts?
- See how far you can go with this by changing and staging various file combinations, then changing already staged files, then reverse staged changes, untracked changes of files with staged changes, and fully revert some of the files.
   - Avoiding what git command will ensure that none of these changes ever
   make it into the git log for the repository
- What if you had committed (no pushes) a bunch of changes to your local fork of the repo, but decided that you didnt like any of it, and would like to get rid of all those commits and revert to the state of the repo as it exists in GitHub.  What would be the easiest way to do this?
