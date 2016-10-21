# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

MASTER_MEMORY=2048
AGENT_MEMORY=1024
MASTER_INSTANCES=1
AGENT_INSTANCES=1

SALT_SUBNET="10.10.17"
SALT_MASTER_ADDRESS="10.10.17.10"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	MASTER_INSTANCES.times do |i|
		config.vm.define "master" do |master|
			master.vm.box = "ubuntu/trusty64"
			master.vm.network "private_network", ip: "#{SALT_MASTER_ADDRESS}"
			master.vm.hostname = "master"
			master.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", MASTER_MEMORY]
			end
			master.vm.provision "shell", path: "scripts/installSaltMaster.sh"
		end
	end

	AGENT_INSTANCES.times do |i|
		config.vm.define "minion.#{i}" do |minion|
			minion.vm.box = "ubuntu/trusty64"
			minion.vm.network "private_network", ip: "#{SALT_SUBNET}.#{i+50}"
			minion.vm.hostname = "minion.#{i}"
			minion.vm.provider :virtualbox do |vba|
				vba.customize ["modifyvm", :id, "--memory", AGENT_MEMORY]
			end
			minion.vm.provision "shell", path: "scripts/installSaltAgent.sh"
		end
	end	
end
