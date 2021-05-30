# -*- mode: ruby -*-
# vi: set ft=ruby:

Vagrant.configure("2") do |config|
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "centos/8"
    ansible.vm.hostname = "ansible"
    ansible.vm.network "private_network", ip: "10.67.17.10", virtualbox_intnet: true

    ansible.vm.provider "virtualbox" do |vb|
      vb.name = "ansible"
      vb.cpus = 1
      vb.memory = 512
    end
    ansible.vm.provision "shell", path: "ansible.sh"
  end

  config.vm.define "target" do |vm1|
    vm1.vm.box = "centos/8"
    vm1.vm.hostname = "target"
    vm1.vm.network "private_network", ip: "10.67.17.11", virtualbox_intnet: true

    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "target"
      vb.cpus = 1
      vb.memory = 512
    end
    vm1.vm.provision "shell", path: "target.sh"
  end

end
