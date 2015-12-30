# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.guest = :linux
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8888
  #config.vm.network "forwarded_port", guest: 3389, host: 63389

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
  #   # Customize the hardware:
      vb.memory = "1024"
      vb.cpus = 2
  end

  config.vm.communicator = "ssh"

  config.vm.provision "shell", name: "prepare_server",                  path: "00_prepare_server.sh"
  config.vm.provision "shell", name: "install_parallels_fibonacci",     path: "10_install_parallels_fibonacci.sh"

end
