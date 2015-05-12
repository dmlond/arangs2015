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
		command   => 'bunzip2 bwa-0.7.12.tar.bz2',
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
		command   => 'bunzip2 samtools-1.2.tar.bz2',
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

    # clone depository
    'clone_arangs2015' :
        command   => 'git clone https://github.com/el-mat/arangs2015.git',
        cwd       => '/home/vagrant/',
        creates   => '/home/vagrant/arangs2015',
        require   => Package[ 'git' ];

}
