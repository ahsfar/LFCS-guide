# ExamPractice

## 1:

* 1:
ls -ld /opt
drwxr-xr-x. 3 root root 4096 Dec 15 17:22 /opt
sudo find . -type f -perm u+x | sudo tee /opt/foundthem.txt

find . -type f -perm /4000
sudo find . -type f -perm /4000 -exec rm {} \;

find . -type f -size +1c -exec cp {} /opt/ \;
find . -type f -size +1k -exec rsync -R {} /opt/ \;

* 2:
sudo nano script.sh 
#!/bin/bash
cp -R /var/www/ /opt/www-backup/

crontab -e
sudo nano /etc/crontab
0 4 * * *  root  /opt/script.sh

* 3: 
sudo nano /etc/security/limits.conf 
@john           hard    nproc          30
@jane           soft    fsize           1024
ulimit -a

* 4:
sudo useradd -m -s /bin/dash mary
sudo useradd mary
sudo passwd mary
sudo usermod -aG sudo mary
groups mary
mary : mary sudo
sudo usermod -g developers mary
sudo usermod -s /bin/bash mary
usermod: no changes
grep '^mary:' /etc/passwd
mary:x:1005:1005:,,,:/home/mary:/bin/bash

* 5:
ls /proc/sys/kernel/
sysctl -a
sudo sysctl -w vm.swappiness=10
sudo cat /etc/sysctl.conf


* 6:
sudo nano /etc/fstab
/dev/vdb1 /backups xfs  defaults 0 0 

mount
sudo unmount /dev/vdb2 /mnt
sudo mount /dev/vdb2 /mnt -o ro


* 7:
sudo pvcreate /dev/vdc /dev/vdd
sudo pvdisplay
sudo vgcreate volume1 /dev/vdd
sudo vgdisplay
sudo vgextend volume1 /dev/vdd
sudo lvcreate -n website_files -L 3G volume1

* 8:

git init
git remote add origin https://github.com/kodekloudhub/git-for-beginners-course.git
git pull origin master


* 9:
docker ps
docker stop 
docker ps -a
docker rm

docker images
docker build -f Dockerfile . -t kodekloudwebserv
docker run kodekloudwebserv
docker run -d --publish 8081:80 --name webserver2 kodekloudwebserv


* 10:

sudo nano /etc/exports
/home 10.0.0.0/24(ro)


* 11:

  
* 12:

  
* 13:

  
* 14:

  
* 15:

  
* 16:

  
* 17:


## 2:

* 1:

sudo nano /etc/systemd/timesyncd.conf
NTP=0.europe.pool.ntp.org 1.europe.pool.ntp.org
sudo systemctl status systemd-timesyncd
sudo systemctl restart systemd-timesyncd


timedatectl
timedatectl list-timezones | grep -i bucharest
timedatectl --help
sudo timedatectl set-timezone Europe/Bucharest

* 2:

sudo crontab -e -u john

0 4 * * 3 find /home/john/ -type d -empty -delete

sudo crontab -l -u john

* 3:

ip a | grep -i 10.5.5.2
sudo nano /opt/interface.txt

sudo sh -c "ip a | grep -i 10.5.5.2 | awk '{print $NF}' > /opt/interface.txt"

* 4:

groups jane
sudo usermod -g jane jane
sudo usermod -aG sudo jane
sudo mkdir /home/jane/
ls -l /home
sudo chown jane:jane /home/jane/
sudo usermod -s /bin/bash jane
sudo passwd jane


* 5:

sudo iptables -t nat -A PREROUTING -p tcp -s 10.5.5.0/24 --dport 81 -j DNAT --to-destination 192.168.5.2:80
sudo iptables -t nat -L -n -v
sudo iptables -t nat -A POSTROUTING -s 10.5.5.0/24 -j MASQUERADE
sudo apt install iptables-persistent


* 6:

openssl x509 -in file* -noout -text
openssl x509 -in file* -noout -text | grep "Public-Key"

* 7:

ls -l /opt/
sudo setfacl --modify janet:rw /opt/aclfile

https://www.redhat.com/en/blog/access-control-lists#:~:text=What%20is%20an%20ACL%3F,part%20of%20a%20demo%20group.

* 8:

sudo nano /etc/security/limits.conf

janet            hard    nproc           100
@mail            soft    fsize           8192


* 9:

touch file1
git add .
git commit -m "Created first required file"
git status
git push origin master


* 10:

getenforce
sestatus

sudo sh -c "getenforce > /opt/selinuxmode.txt"

ls -l /usr/bin/less
-rwxr-xr-x. 1 root root 199048 Feb 20  2024 /usr/bin/less
ls -lZ /usr/bin/less
-rwxr-xr-x. 1 root root system_u:object_r:bin_t:s0 199048 Feb 20  2024 /usr/bin/less

sudo restorecon /usr/bin/less
ls -lZ /usr/bin/less
-rwxr-xr-x. 1 root root system_u:object_r:bin_t:s0 199048 Feb 20  2024 /usr/bin/less

* 11:

sudo systemctl status nginx
sudo systemctl start nginx
sudo systemctl enable nginx


* 12:

sudo vgextend volume1 /dev/vdc
sudo lvresize --size 2G /dev/volume1/lv1

* 13:

https://hpc.ncsu.edu/Documents/unixtut/unix7.html



* 14:

virt-install --name mockexam2 --memory=1024 --vcpu=1 --disk=/var/lib/libvirt/images/ubuntu.img --os-variant=ubuntu22.04 --noautoconsole --import

virsh list -all
virsh autostart mockexam2

* 15:

bridge.yaml


sudo netplan apply

* 16:

docker rmi nginx -f
docker images

docker run -d -p 80:80 --name apache_container --restart on-failure:3 httpd


* 17:

nslcd


## 3:

* 1:

sudo rm /etc/nginx/sites-enabled/default

sudo nano /etc/nginx/sites-available/proxy.conf

proxy_pass http://google.com;

sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf

sudo systemctl reload nginx.service


* 2:

sudo nano /etc/crontab 
0 4 15 * *       su - mary -c  'find /home/mary/ -type d -empty -delete'

* 3:

sudo vim /etc/netplan/extrainterface.yaml

network:
  version: 2
  ethernets:
    enp0s10:
      dhcp4: false
      dhcp6: false
      addresses:
        - 10.198.0.5/24
      routes:
        - to: 192.168.0.0/24
          via: 10.198.0.1

sudo netplan apply
ip route

sudo ip addr add 10.5.0.9/24 dev enp0s10

* 4:

sudo sysctl -w vm.swappiness=30

sudo nano /etc/sysctl.conf
vm.dirty_ratio=15

* 5:

sudo groupadd developers
sudo useradd jane
sudo usermod -g developers jane
groups jane
sudo usermod -aG jane jane
sudo usermod -aG sudo jane
sudo usermod -s /bin/bash jane

* 6:

sudo nano /etc/ssh/sshd_config

PasswordAuthentication no

Match User john
  PasswordAuthentication yes

* 7:

find /usr -type f -size +1G
sudo find /usr -type f -size +1G -exec rm {} \;

* 8:

sudo vgcreate VG1 /dev/vdb /dev/vdc
sudo vgdisplay
sudo pvdisplay
sudo lvcreate -L 6G VG1 --name LV1
sudo lvdisplay

* 9:

sudo iptables -t nat -A PREROUTING -s 10.11.12.0/24 -d 10.9.9.1 
sudo iptables -t nat -A POSTROUTING -s 10.11.12.0/24 -j MASQUERADE

* 10:

cat Dockerfile 
FROM nginx
COPi index.html /usr/share/nginx/html/index.html

docker build -f Dockerfile . -t kodekloud/nginx_kodekloud:1.0

sudo docker run -d -p 81:80 --name kodekloud_webserv kodekloud/nginx_kodekloud:1.0

  
* 11:

  
* 12:

  
* 13:

  
* 14:

  
* 15:

  
* 16:

  
* 17:


## 4:

* 1:

  
* 2:

sudo usermod -s /bin/bash jane
grep '^jane:' /etc/passwd

sudo usermod -aG sudo jane
groups jane

  
* 3:

sudo crontab -e -u john
0 3 * * 1,6 tar acf /home/john/www-snapshot.tgz /var/www
sudo crontab -l -u john

  
* 4:

network:
  version: 2
  renderer: networkd
  ethernets:
    eth2:
      dhcp4: no
    eth3:
      dhcp4: no
  bonds:
    bond0:
      dhcp4: yes
      interfaces:
        - eth2
        - eth3
      parameters:
        mode: active-backup
        primary: eth3

  
* 5:

sudo iptables -t nat -A PREROUTING -p tcp -s 10.9.9.0/24 --dport 80 -j DNAT --to-destination 10.100.0.8:80
sudo iptables -t nat -A POSTROUTING -s 10.9.9.0/24 -j MASQUERADE


* 6:

timedatectl set-timezone Asia/Singapore

* 7:

  
* 8:

openssl x509 -in first.crt -noout -text | grep "kodekloud.com"

  
* 9:

  
* 10:

  
* 11:

  
* 12:

  
* 13:

  
* 14:

  
* 15:

  
* 16:

  
* 17:




