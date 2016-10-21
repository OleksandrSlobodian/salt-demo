# saltstack-demo

A simple multi Vagrant box setup to play around with Saltstack. You need working Vagrant on your machine to use this demo.

Before you run Vagrant up - change following parameters in Vagrantfile as per your need/taste:
```
MASTER_MEMORY=2048
AGENT_MEMORY=1024
MASTER_INSTANCES=1
AGENT_INSTANCES=1
```
Also if you face issue with network or getting box up, try changing the subnet in Vagrantfile 

```
SALT_SUBNET="10.10.17"
SALT_MASTER_ADDRESS="10.10.17.10"
```
Once `vagrant up --provision` runs successfully, you should see one master and multiple agents based on your configuration.

```
