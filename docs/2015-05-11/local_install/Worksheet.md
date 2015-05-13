We are going to try to run [pipeline.sh](https://github.com/dmlond/arangs2015/blob/master/bin/pipeline.sh). Have a look at the script.

- How many values does the `$FASTQS` variable hold? 2
- How many values will the `$SAIS` variable hold when running the script? 2 Why? because it loops over $FASTQS
- How many times will the `$SAM` variable be assigned a value? 2 Is it the same value? No Why? Because it uses a different value of $OUTFILE each time
- What's the function of the if/else statements, why would they be there?
to check for the existence of files and not run parts of the pipeline if they already exist
- Which programs need to be installed to run pipeline.sh?
bwa, samtools
- Which versions of these programs do we need (consult the download* scripts)?
bwa 0.7.12
samtools 1.2
- Download and (try to) compile these programs.
- Are there any libraries missing?
- If there are missing libraries, try to install these with the package manager (`apt-get`)
- Make sure the compiled programs are on the `$PATH`.
```bash
export PATH="/dir/of/program:${PATH}"
```
- Download the data. If you use the download* scripts for this, where will the data end up? ../data
- Will the pipeline.sh be able to find the data there?
yes, because it hardcodes it
- Does it matter where you run the pipeline?
yes, because it hardcodes data relative to the bin directory
