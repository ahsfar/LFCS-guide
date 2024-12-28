# ExamPractice

## LFCS Mock Exam 1:

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
sudo passwd mary
bob@caleston-lp10:~$ sudo adduser mary
Adding user `mary' ...
Adding new group `mary' (1006) ...
Adding new user `mary' (1005) with group `mary' ...
Creating home directory `/home/mary' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for mary
Enter the new value, or press ENTER for the default
        Full Name []: 
        Room Number []: 
        Work Phone []: 
        Home Phone []: 
        Other []: 
Is the information correct? [Y/n] y

sudo usermod -aG sudo mary
groups mary
# mary : mary sudo
sudo usermod -g developers mary
sudo usermod -s /bin/bash mary
# usermod: no changes
grep '^mary:' /etc/passwd
# mary:x:1005:1005:,,,:/home/mary:/bin/bash

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


## LFCS Mock Exam 2:

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


