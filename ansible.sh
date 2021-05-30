#/bin/bash

sudo cp /vagrant/keys/* /home/vagrant/.ssh/
sudo chown -R vagrant. /home/vagrant/.ssh/
sudo chmod 600 /home/vagrant/.ssh/id_rsa
sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo cat /home/vagrant/.ssh/id_rsa.pub | tee -a /home/vagrant/.ssh/authorized_keys

sudo dnf makecache -y
sudo dnf install epel-release -y
sudo dnf makecache -y
sudo dnf install ansible -y
sudo dnf install vim -y
sudo dnf install tree -y
sudo dnf install git -y
echo "audocmd FileType yaml setlocal ai ts=2 sw2 etc" > /home/vagrant/.vimrc

mkdir /home/vagrant/prelim-exam

touch /home/vagrant/prelim-exam/ansible.cfg
echo "[defaults]" >> /home/vagrant/prelim-exam/ansible.cfg
echo "inventory = ./inventory" >> /home/vagrant/prelim-exam/ansible.cfg
echo "remote_user = vagrant" >> /home/vagrant/prelim-exam/ansible.cfg
echo "host_key_checking = False" >> /home/vagrant/prelim-exam/ansible.cfg
echo "[privilege_escalation]" >> /home/vagrant/prelim-exam/ansible.cfg
echo "become = True" >> /home/vagrant/prelim-exam/ansible.cfg
echo "become_user = root" >> /home/vagrant/prelim-exam/ansible.cfg
echo "become_method = sudo" >> /home/vagrant/prelim-exam/ansible.cfg
echo "become_ask_pass = False" >> /home/vagrant/prelim-exam/ansible.cfg

touch /home/vagrant/prelim-exam/inventory
echo "[ansible]" >> /home/vagrant/prelim-exam/inventory
echo "10.67.17.10" >> /home/vagrant/prelim-exam/inventory
echo "[target]" >> /home/vagrant/prelim-exam/inventory
echo "10.67.17.11" >> /home/vagrant/prelim-exam/inventory

sudo cp /vagrant/main.yaml /home/vagrant/prelim-exam/
sudo chown -R vagrant. /home/vagrant/prelim-exam/
