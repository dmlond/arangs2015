# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # We are using Ubuntu 14.04 "Trusty Tahr"
  config.vm.box = "ubuntu/trusty64"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "../../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    
     # (Don't) boot with headless mode
     vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "default.pp"

    # This data structure is a set of key/value pairs. The key names
    # will appear in the puppet manifest as variables (starting with
    # $), so that we are able to parameterize our pipeline from 
    # outside the VM.
    puppet.facter = {
      "sam"       => "outfile.sam",
      "reference" => "Pf3D7_v2.1.5.fasta",
      "cores"     => "2",
      "fastq2"    => "ERR022523_2.fastq.gz",
      "fastq1"    => "ERR022523_1.fastq.gz",        
    }
  end
end
