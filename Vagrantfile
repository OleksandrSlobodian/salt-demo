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
		config.vm.define "master" do |smaster|
			smaster.vm.box = "ubuntu/trusty64"
			smaster.vm.network "private_network", ip: "#{SALT_MASTER_ADDRESS}"
			smaster.vm.hostname = "smaster"
			smaster.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", MASTER_MEMORY]
			end
			smaster.vm.provision "shell", path: "scripts/installSaltMaster.sh"
		end
	end

	AGENT_INSTANCES.times do |i|
		config.vm.define "minion_#{i}" do |sminion|
			sminion.vm.box = "ubuntu/trusty64"
			sminion.vm.network "private_network", ip: "#{SALT_SUBNET}.#{i+50}"
			sminion.vm.hostname = "minion.#{i}"
			sminion.vm.provider :virtualbox do |vba|
				vba.customize ["modifyvm", :id, "--memory", AGENT_MEMORY]
			end
			sminion.vm.provision "shell", path: "scripts/installSaltAgent.sh"
		end
	end	
end
