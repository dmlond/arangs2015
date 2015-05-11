We are going to try to run [pipeline.sh](https://github.com/dmlond/arangs2015/blob/master/bin/pipeline.sh). Have a look at the script.

- How many values does the `$FASTQ`S variable hold?
- How many values will the `$SAIS` variable hold when running the script? Why?
- How many times will the `$SAM` variable be assigned a value? Is it the same value? Why?
- What's the function of the if/else statements, why would they be there?
- Which programs need to be installed to run pipeline.sh?
- Which versions of these programs do we need (consult the download* scripts)?
- Download and (try to) compile these programs. 
- Are there any libraries missing?
- If there are missing libraries, try to install these with the package manager (`apt-get`)
- Make sure the compiled programs are on the `$PATH`.
- Download the data. If you use the download* scripts for this, where will the data end up?
- Will the pipeline.sh be able to find the data there? 
- Does it matter where you run the pipeline?
