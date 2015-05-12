On Linux, every command (by first approximation) is an executable that resides somewhere on the file system. 
When you type a command, the operating system scans a select number of folders that might contain the 
executable that corresponds with the command you typed. This list of folders is defined by the environment
variable `$PATH`. So, if you type a command that corresponds with an executable that is not in any of the
folders that are in the `$PATH`, the command will not be found. It does not matter that you are INSIDE the
folder with the executable RIGHT THERE: it is still not going to be found. How to change that? By updating
the value of the `$PATH` environment variable. Like so:

 `export PATH=/folder/of/executable:$PATH`

A couple of important points:
- the folders in the list are separated by `:`
- using the bash shell (!) the list is read from left to right. In CShell (`csh`) it is read right to left.
- in general, shells split "words" on spaces, unless the whole sentence is inside quotes. So, if any of the
folders has spaces in it (`/Documents and Settings/`) you have to quote the list, otherwise it will stop
at `/Documents`
- If you want to put a word right after `$PATH`, you can delimit the variable name with curly braces: 
`${PATH}foo`
