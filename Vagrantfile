# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "mini-kube"

  config.vm.hostname = "mini-kube"
  config.vm.box = "bento/ubuntu-20.04"
  # config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.56.10"
  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "mini-kube"
    vb.cpus = 4
    vb.memory = "4096"
  end

  config.vm.provision "shell", path: "./scripts/common.sh"
  config.vm.provision "shell", path: "./scripts/minikube.sh", privileged: false

  config.vm.provision "shell", inline: <<-SHELL
    echo "Welcome to MiniKube"
  SHELL
end
