# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "devbox"
  config.vm.define "devbox" do |node|
    node.vm.hostname = "devbox"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    node.vm.network "private_network", ip: "10.10.20.10"
    node.vm.synced_folder '.', '/vagrant'
    node.ssh.forward_agent = true
    node.ssh.insert_key = true
    # Remove all stdin is not a tty errors
    node.vm.provision "fix-no-tty", type: "shell" do |s|
      s.privileged = false
      s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
    # PROVISION START 
    node.vm.provision "file", source: "~/.ssh/id_rsa", destination: "~/.ssh/id_rsa"
    node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"
    node.vm.provision "file", source: "~/.gitconfig", destination: "~/.gitconfig"
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/devbox.yml"
      ansible.host_key_checking = false
    end
    # PROVISION END
  end
end
