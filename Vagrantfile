# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.ssh.insert_key = false

  # Multiple machines configuration
  servers = [
    {
      :hostname => "Pluto",
      :box => "shekeriev/debian-11",
      :ip => "172.16.1.50",
      :ssh_port => "2200"
    },
    {
      :hostname => "Saturn",
      :box => "shekeriev/debian-11",
      :ip => "172.16.1.51",
      :ssh_port => "2201"
    }
  ]

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]
      node.vm.network :private_network, ip: machine[:ip]
      node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
      node.vm.provision "shell", path: "bootstrap.sh"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end
    end
  end

  # Single machine configuration
  # Must exist
  # config.vm.box = "shekeriev/debian-11"
  # ---

  # Network settings
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "172.16.1.10"
  # config.vm.network "public_network"

  # Folder settings
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider settings
  # Must exist
  # config.vm.provider "virtualbox" do |vb|
  #   # vb.gui = true
  #   vb.memory = "2048"
  #   vb.cpus = 4
  # end
  # ---
  
  # Provision settings
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

# Must exist
#   config.vm.provision "shell", path: "bootstrap.sh"
# ---
end
