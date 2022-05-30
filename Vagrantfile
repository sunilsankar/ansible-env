# -*- mode: ruby -*-
# vi: set ft=ruby :



Vagrant.configure(2) do |config|

  config.ssh.insert_key = false
  config.vm.synced_folder "./", "/vagrant"
  
  # Ansible Master Server
  config.vm.define "ansiblemaster" do |node|
   
  config.vm.provision "shell", path: "tasks/install.sh"
    node.vm.box               = "almalinux/8"
    node.vm.box_check_update  = true
    node.vm.hostname          = "ansible.example.com"

    node.vm.network "private_network", ip: "192.168.16.100"
  
    node.vm.provider :virtualbox do |v|
      v.name    = "ansiblemaster"
      v.memory  = 2048
      v.cpus    =  2
    end
  
    node.vm.provider :libvirt do |v|
      v.memory  = 2048
      v.nested  = true
      v.cpus    = 2
    end

end
  NodeCount = 2

  (1..NodeCount).each do |i|

    config.vm.define "node#{i}" do |node|

      node.vm.box               = "almalinux/8"
      node.vm.box_check_update  = false
      node.vm.box_version       = "3.3.0"
      node.vm.hostname          = "node#{i}.example.com"

      node.vm.network "private_network", ip: "192.168.16.10#{i}"

      node.vm.provider :virtualbox do |v|
        v.name    = "kworker#{i}"
        v.memory  = 1024
        v.cpus    = 1
      end

      node.vm.provider :libvirt do |v|
        v.memory  = 1024
        v.nested  = true
        v.cpus    = 1
      end

  end
end
end
