#This will install and start the salt-minion-service

zypper in -y salt-minion
echo master: 192.168.122.2 >> /etc/salt/minion
systemctl enable salt-minion.service
systemctl start salt-minion.service
