wget -O - https://repo.saltstack.com/apt/ubuntu/ubuntu14/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/ubuntu14/latest trusty main" >> /etc/apt/sources.list

sudo apt-get -y update

apt-get install -y salt-minion
sudo cp /vagrant/conf/minion /etc/salt
sudo cp /vagrant/conf/_schedule.conf /etc/salt/minion.d
echo "10.10.17.10 salt" >> /etc/hosts

service salt-minion restart
