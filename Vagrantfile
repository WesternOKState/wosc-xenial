# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.hostname = 'wosc.xenial'
  config.vm.box = "bento/ubuntu-16.04"
  
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", create: true
  config.vm.provider "virtualbox" do |vb|
		vb.name = "wosc-xenial"
		vb.memory = 1024
		vb.cpus = 2
    line = `VBoxManage list systemproperties | grep "Default machine folder"`
    vb_machine_folder = line.split(':')[1].strip()
    disk = File.join(vb_machine_folder, vb.name, 'disk2.vdi')
    unless File.exist?(disk)
      vb.customize ['createhd', '--filename', disk, '--variant', 'Fixed', '--size', 60 * 1024]
    end
    vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk]
  end
  config.vm.provision "shell", inline: <<-SHELL
	sudo bash /vagrant/provision.sh
  SHELL
end
