# update the $PATH environment variable
Exec {
  path => [
		"/usr/local/sbin",
		"/usr/local/bin",
		"/usr/sbin",
		"/usr/bin",
		"/sbin",
		"/bin",
	]
}

# keep package information up to date
exec {
	"apt_update":
	command => "/usr/bin/apt-get update"
}

# install packages.
package {
	"wget":            ensure => installed, require => Exec ["apt_update"];
	"bzip2":           ensure => installed, require => Exec ["apt_update"];
	"tar":             ensure => installed, require => Exec ["apt_update"];
	"git":             ensure => installed, require => Exec ["apt_update"];
	"build-essential": ensure => installed, require => Exec ["apt_update"];
	"gzip":            ensure => installed, require => Exec ["apt_update"];
	"zlib1g-dev":      ensure => installed, require => Exec ["apt_update"];
	"ncurses-dev":     ensure => installed, require => Exec ["apt_update"];
}

# command line tasks
exec {

	# install bwa
	'dl_bwa':
		command   => 'wget -O bwa-0.7.12.tar.bz2 http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2/download',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/bwa-0.7.12.tar.bz2',
		require   => Package[ 'wget' ];			
	'unzip_bwa':
		command   => 'bunzip2 --keep bwa-0.7.12.tar.bz2',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/bwa-0.7.12.tar',       
		require   => [ Exec[ 'dl_bwa' ], Package[ 'bzip2' ] ];
	'untar_bwa':
		command   => 'tar xvf bwa-0.7.12.tar',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/bwa-0.7.12',       
		require   => [ Exec[ 'unzip_bwa' ], Package[ 'tar' ] ];
	'make_bwa':
		command   => 'make',
		cwd       => '/usr/local/src/bwa-0.7.12',
		creates   => '/usr/local/src/bwa-0.7.12/bwa',
		require   => Exec[ 'untar_bwa' ];
	'symlink_bwa':
		command   => 'ln -s /usr/local/src/bwa-0.7.12/bwa /usr/local/bin/bwa',
		creates   => '/usr/local/bin/bwa',       
		require   => Exec[ 'make_bwa' ];

	# install samtools
	'dl_samtools':
		command   => 'wget -O samtools-1.2.tar.bz2 http://sourceforge.net/projects/samtools/files/samtools/1.2/samtools-1.2.tar.bz2/download',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/samtools-1.2.tar.bz2',      
		require   => Package[ 'wget' ];
	'unzip_samtools':
		command   => 'bunzip2 --keep samtools-1.2.tar.bz2',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/samtools-1.2.tar',
		require   => [ Exec[ 'dl_samtools' ], Package[ 'bzip2' ] ];
	'untar_samtools':
		command   => 'tar xvf samtools-1.2.tar',
		cwd       => '/usr/local/src',
		creates   => '/usr/local/src/samtools-1.2',
		require   => [ Exec[ 'unzip_samtools' ], Package[ 'tar' ] ];
	'make_samtools':
		command   => 'make',
		cwd       => '/usr/local/src/samtools-1.2',
		creates   => '/usr/local/src/samtools-1.2/samtools',
		require   => [ Exec[ 'untar_samtools' ], Package[ 'zlib1g-dev' ] ];
	'symlink_samtools':
		command   => 'ln -s /usr/local/src/samtools-1.2/samtools /usr/local/bin/samtools',
		creates   => '/usr/local/bin/samtools',       
		require   => Exec[ 'make_samtools' ];
	
	# clone the project repo
	'clone_repo':
		command   => 'git clone https://github.com/dmlond/arangs2015.git',
		cwd       => '/home/vagrant',
		creates   => '/home/vagrant/arangs2015',
		require   => Package[ 'git' ];
	'chown_repo':
		command   => 'sudo chown -R vagrant /home/vagrant/arangs2015',
		require   => Exec[ 'clone_repo' ];
	'rm_repo_data':
		command   => 'rm -rf /home/vagrant/arangs2015/data',
		require   => Exec[ 'clone_repo' ];
	'symlink_data':
		command   => 'ln -s /vagrant_data /home/vagrant/arangs2015/data',
		require   => Exec[ 'rm_repo_data' ];

    # the pipeline itself. whether or not it is actually a good idea to 
    # run the pipeline during provisioning is up for debate, but just to
    # demonstrate that this is possible, here it is. Note that we are now
    # introducing a number of variables (starting with $), that have to 
    # be made available by 'facter'. In the current setup, the values of
    # these variables are defined in the Vagrantfile. There are other ways
    # to make them available as well, such as from the environment, among
    # others.
    
    'index_reference':
    	command   => "bwa index -a bwtsw ${reference}",
    	creates   => "/home/vagrant/arangs2015/data/${reference}.bwt",
    	cwd       => "/home/vagrant/arangs2015/data",
    	require   => Exec[ 'symlink_bwa', 'symlink_data' ];
    'map_r1':
    	command   => "bwa aln -t ${cores} ${reference} ${fastq1} -f ${fastq1}.sai",
    	creates   => "/home/vagrant/arangs2015/data/${fastq1}.sai",
    	cwd       => "/home/vagrant/arangs2015/data",    
    	require   => Exec[ 'index_reference' ];
    'map_r2':
    	command   => "bwa aln -t ${cores} ${reference} ${fastq2} -f ${fastq2}.sai",
    	creates   => "/home/vagrant/arangs2015/data/${fastq2}.sai",
    	cwd       => "/home/vagrant/arangs2015/data",    
    	require   => Exec[ 'index_reference' ];
    'bwa_sampe':
    	command   => "bwa sampe ${reference} ${fastq1}.sai ${fastq2}.sai ${fastq1} ${fastq2} -f ${sam}",
    	creates   => "/home/vagrant/arangs2015/data/${sam}",
    	cwd       => "/home/vagrant/arangs2015/data",
    	require   => Exec[ 'map_r1', 'map_r2' ];
    'samtools_filter':
    	command   => "samtools view -bS -F 4 -q 50 -o ${sam}.filtered ${sam}",
    	creates   => "/home/vagrant/arangs2015/data/${sam}.filtered",
    	cwd       => "/home/vagrant/arangs2015/data",
	require   => Exec[ 'bwa_sampe', 'symlink_samtools' ];
    'samtools_sort':
    	command   => "samtools sort ${sam}.filtered ${sam}.sorted",
	creates   => "/home/vagrant/arangs2015/data/${sam}.sorted.bam",
    	cwd       => "/home/vagrant/arangs2015/data",
	require   => Exec[ 'samtools_filter' ];
    'samtools_index':
    	command   => "samtools index ${sam}.sorted.bam",
	creates   => "/home/vagrant/arangs2015/data/${sam}.sorted.bam.bai",
    	cwd       => "/home/vagrant/arangs2015/data",
    	require   => Exec[ 'samtools_sort' ];        

}


