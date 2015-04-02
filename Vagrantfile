# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  

  config.vm.define "db" do |db|
    db.vm.box = "kikitux/oracle65-1disk"
    db.vm.hostname = "oracle6"
    db.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    db.vm.network "forwarded_port", guest: 8080, host: 8080
    db.vm.network "forwarded_port", guest: 7000, host: 7000
    db.vm.provision "shell",  path: "provision.sh"
  end

  config.vm.define "web1" do |web1|
    web1.vm.box = "kikitux/oracle6"
    web1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
    web1.vm.network "forwarded_port", guest: 80, host: 8081
    web1.vm.provision :shell, path: "web_provision.sh"
  end

end
