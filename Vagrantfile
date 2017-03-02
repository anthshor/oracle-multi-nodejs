# -*- mode: ruby -*-
# vi: set ft=ruby :
MY_VAR = ENV['MY_VAR']

Vagrant.configure(2) do |config|

  config.vm.box = "anthshor/ol6"
  
  config.vm.define "db" do |db|
    db.vm.hostname = "oracle6"
    db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    db.vm.network "private_network", ip: "192.168.33.11"
    db.vm.network "forwarded_port", guest: 7000, host: 7000
    db.vm.network "forwarded_port", guest: 8081, host: 8081
    db.vm.provision "shell",  path: "provision.sh", args: MY_VAR
  end

  config.vm.define "web1" do |web1|
    web1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web1.vm.network "private_network", ip: "192.168.33.12"
    web1.vm.network "forwarded_port", guest: 7000, host: 7001
    web1.vm.provision :shell, path: "web_provision.sh"
  end

  config.vm.define "web2" do |web2|
    web2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web2.vm.network "private_network", ip: "192.168.33.13"
    web2.vm.network "forwarded_port", guest: 7000, host: 7002
    web2.vm.provision :shell, path: "web_provision.sh"
  end

  config.vm.define "web3" do |web3|
    web3.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web3.vm.network "private_network", ip: "192.168.33.14"
    web3.vm.network "forwarded_port", guest: 7000, host: 7003
    web3.vm.provision :shell, path: "web_provision.sh"
  end

  config.vm.define "web4" do |web4|
    web4.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web4.vm.network "private_network", ip: "192.168.33.15"
    web4.vm.network "forwarded_port", guest: 7000, host: 7004
    web4.vm.provision :shell, path: "web_provision.sh"
  end

  config.vm.define "web5" do |web5|
    web5.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web5.vm.network "private_network", ip: "192.168.33.16"
    web5.vm.network "forwarded_port", guest: 7000, host: 7005
    web5.vm.provision :shell, path: "web_provision.sh"
  end
end
