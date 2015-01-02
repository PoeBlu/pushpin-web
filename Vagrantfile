# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  #config.vm.network "forwarded_port", 
  #  host: 8000, guest: 8000,
  #  auto_correct: true

  #config.vm.network "forwarded_port", 
  #  host: 8001, guest: 8001,
  #  auto_correct: true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false

    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.provision "shell",
    inline: "apt-get -qq update && apt-get install -y \
                    python3-pip \
                    rabbitmq-server \
                    python-dev \
                    libpq-dev"

  config.vm.synced_folder ".", "/root/", create: true

  config.vm.provision "shell",
    inline: "pip3 install -r /root/requirements.txt"

  config.vm.provision "shell",
    path: "runscripts/vagrantrun.sh"

end
