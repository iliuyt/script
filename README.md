# script

### server boot

wget -O - http://git.iliuyt.com/liuyt/script/raw/branch/master/server_boot/install.sh | bash


### 开启root
sudo su 
echo 'PermitRootLogin yes'>>/etc/ssh/sshd_config
mv /home/ubuntu/.ssh/authorized_keys /root/.ssh/authorized_keys
service ssh restart