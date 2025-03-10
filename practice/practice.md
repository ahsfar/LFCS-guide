# ExamPractice

### It's for Exam Practice. Still in Progress... 
(Internal notes: It'll all be merged into a single set of lenghty questions ... )
## Set 1:

* 1:

```bash
ls -ld /opt
drwxr-xr-x. 3 root root 4096 Dec 15 17:22 /opt
sudo find . -type f -perm u+x | sudo tee /opt/foundthem.txt

sudo find . -type f -perm /=s -exec rm {} \;

find . -type f -size +1c -exec cp {} /opt/ \;
find . -type f -size +1k -exec rsync -R {} /opt/ \;
```

* 2:
```bash
sudo nano script.sh 
#!/bin/bash
cp -R /var/www/ /opt/www-backup/

crontab -e
sudo nano /etc/crontab
0 4 * * *  root  /opt/script.sh
```

* 3: 
```bash
sudo nano /etc/security/limits.conf 
@john           hard    nproc          30
@jane           soft    fsize           1024
ulimit -a
```

* 4:
```bash
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
```

* 5:
```bash
ls /proc/sys/kernel/
sysctl -a
sudo sysctl -w vm.swappiness=10
sudo cat /etc/sysctl.conf
```

* 6:
```bash
sudo nano /etc/fstab
/dev/vdb1 /backups xfs  defaults 0 0 

mount
sudo unmount /dev/vdb2 /mnt
sudo mount /dev/vdb2 /mnt -o ro
```

* 7:
```bash
sudo pvcreate /dev/vdc /dev/vdd
sudo pvdisplay
sudo vgcreate volume1 /dev/vdd
sudo vgdisplay
sudo vgextend volume1 /dev/vdd
sudo lvcreate -n website_files -L 3G volume1
```

* 8:

```bash
git init
git remote add origin https://github.com/kodekloudhub/git-for-beginners-course.git
git pull origin master
```

* 9:

```bash
docker ps
docker stop 
docker ps -a
docker rm

docker images
docker build -f Dockerfile . -t kodekloudwebserv
docker run kodekloudwebserv
docker run -d --publish 8081:80 --name webserver2 kodekloudwebserv
```

* 10:

```bash
sudo nano /etc/exports
/home 10.0.0.0/24(ro)
```

* 11:

```bash

sudo lsof -i :80

pgrep -a nginx

```

* 12:

```bash
sudo ip addr add 10.5.0.1/24 dev eth1

ip route show default

cat /etc/resolv.conf

```
  
* 13:

```bash
lsblk	                  List block devices and partitions.
fdisk /dev/vdb	        Partition a disk.
mkfs.ext4 /dev/vdb1	    Format a partition with ext4 file system.
mount /dev/vdb1 /mnt	  Mount a partition to a directory.
umount /mnt	            Unmount a partition.
fsck /dev/vdb1	        Check and repair a file system.
resize2fs /dev/vdb1	    Resize an ext2/ext3/ext4 file system.
```
  
* 14:

```bash
sudo fallocate -l 1024M /swfile

sudo chmod 600 /swfile

sudo mkswap /swfile

sudo swapon /swfile

/swfile none swap sw 0 0

```
  
* 15:

 ```bash
Run the sudo dstat --top-io --top-bio command to get the process name with I/O activity.
Run the pgrep python3 command to get the PID of the process.
Run sudo lsof -p <PID> to list the open files by the process.
Run sudo lsof -p <PID> | awk '{print $9}' | while read file; do df $file; done to get the device details.
Find the actual partition used by running the pvs command and store the actual device name in /opt/devname.txt.

sudo pidstat -d 1

```
 
* 16:

```bash

bob@node01:~$ sudo find /data -type f -exec du -h {} + | sort -rh | head -n 1
196M    /data/683/lf

sudo rm -rf /data/683/lf

```
  
* 17:

```bash

/etc/ssh/sshd_config

X11Forwarding no

Match User bob
    X11Forwarding yes

```

## Set 2:

* 1:

```bash

sudo nano /etc/systemd/timesyncd.conf
NTP=0.europe.pool.ntp.org 1.europe.pool.ntp.org
sudo systemctl status systemd-timesyncd
sudo systemctl restart systemd-timesyncd


timedatectl
timedatectl list-timezones | grep -i bucharest
timedatectl --help
sudo timedatectl set-timezone Europe/Bucharest

```

* 2:

```bash
sudo crontab -e -u john

0 4 * * 3 find /home/john/ -type d -empty -delete

sudo crontab -l -u john

```

* 3:

```bash

ip a | grep -i 10.5.5.2
sudo nano /opt/interface.txt

sudo sh -c "ip a | grep -i 10.5.5.2 | awk '{print $NF}' > /opt/interface.txt"

```

* 4:
```bash
groups jane
sudo usermod -g jane jane
sudo usermod -aG sudo jane
sudo mkdir /home/jane/
ls -l /home
sudo chown jane:jane /home/jane/
sudo usermod -s /bin/bash jane
sudo passwd jane

```

* 5:

```bash

sudo iptables -t nat -A PREROUTING -p tcp -s 10.5.5.0/24 --dport 81 -j DNAT --to-destination 192.168.5.2:80
sudo iptables -t nat -L -n -v
sudo iptables -t nat -A POSTROUTING -s 10.5.5.0/24 -j MASQUERADE
sudo apt install iptables-persistent

```

* 6:

```bash
openssl x509 -in file* -noout -text
openssl x509 -in file* -noout -text | grep "Public-Key"
```


* 7:

```bash
ls -l /opt/
sudo setfacl --modify janet:rw /opt/aclfile

https://www.redhat.com/en/blog/access-control-lists#:~:text=What%20is%20an%20ACL%3F,part%20of%20a%20demo%20group.
```


* 8:

```bash
sudo nano /etc/security/limits.conf

janet            hard    nproc           100
@mail            soft    fsize           8192
```


* 9:

```bash
touch file1
git add .
git commit -m "Created first required file"
git status
git push origin master
```


* 10:

```bash
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

```

* 11:

```bash
sudo systemctl status nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```



* 12:

```bash
sudo vgextend volume1 /dev/vdc
sudo lvresize --size 2G /dev/volume1/lv1
```


* 13:

```bash
https://hpc.ncsu.edu/Documents/unixtut/unix7.html
```




* 14:

```bash
virt-install --name mockexam2 --memory=1024 --vcpu=1 --disk=/var/lib/libvirt/images/ubuntu.img --os-variant=ubuntu22.04 --noautoconsole --import

virsh list -all
virsh autostart mockexam2
```


* 15:

```bash
bridge.yaml

network:
  version: 2
  renderer: networkd
  ethernets:
    eth1:
      dhcp4: no
    eth2:
      dhcp4: no
  bridges:
    bridge1:
      dhcp4: yes
      interfaces:
        - eth1
        - eth2

sudo netplan apply
```


* 16:

```bash
docker rmi nginx -f
docker images

docker run -d -p 80:80 --name apache_container --restart on-failure:3 httpd
```



* 17:

```bash

```
nslcd


## Set 3:

* 1:

```bash
sudo rm /etc/nginx/sites-enabled/default

sudo nano /etc/nginx/sites-available/proxy.conf

proxy_pass http://google.com;

sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf

sudo systemctl reload nginx.service
```



* 2:

```bash
sudo nano /etc/crontab 
0 4 15 * *       su - mary -c  'find /home/mary/ -type d -empty -delete'
```


* 3:

```bash
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
```


* 4:

```bash
sudo sysctl -w vm.swappiness=30

sudo nano /etc/sysctl.conf
vm.dirty_ratio=15
```


* 5:

```bash
sudo groupadd developers
sudo useradd jane
sudo usermod -g developers jane
groups jane
sudo usermod -aG jane jane
sudo usermod -aG sudo jane
sudo usermod -s /bin/bash jane
```


* 6:

```bash
sudo nano /etc/ssh/sshd_config

PasswordAuthentication no

Match User john
  PasswordAuthentication yes
```


* 7:

```bash
find /usr -type f -size +1G
sudo find /usr -type f -size +1G -exec rm {} \;
```


* 8:

```bash
sudo vgcreate VG1 /dev/vdb /dev/vdc
sudo vgdisplay
sudo pvdisplay
sudo lvcreate -L 6G VG1 --name LV1
sudo lvdisplay
```


* 9:

```bash
sudo iptables -t nat -A PREROUTING -s 10.11.12.0/24 -d 10.9.9.1 
sudo iptables -t nat -A POSTROUTING -s 10.11.12.0/24 -j MASQUERADE
```


* 10:

```bash
cat Dockerfile 
FROM nginx
COPi index.html /usr/share/nginx/html/index.html

docker build -f Dockerfile . -t kodekloud/nginx_kodekloud:1.0

sudo docker run -d -p 81:80 --name kodekloud_webserv kodekloud/nginx_kodekloud:1.0
```


  
* 11:
```bash
cd kode

git pull origin master

sudo nano file1
line2

git add .
git commit -m "Added line2 to our project"

git push origin master
```
  
* 12:
```bash
sudo mkfs.ext4 /dev/vdd

sudo nano /etc/fstab

/dev/vdd /home/bob/backups ext4 defaults 0 2

sudo mount -a

```
  
* 13:
```bash
top

sudo kill

sudo rm script.sh

```
  
* 14:
```bash

sudo find /file/path/ -type f -size +500 -exec rm {} \;

```
  
* 15:
```bash
top

sudo kill id

```
  
* 16:
```bash
sudo apt install systemd-timesyncd

sudo systemctl status systemd-timesyncd

sudo nano /etc/systemd/timesyncd.conf 

[Time]
NTP=0.asia.pool.ntp.org 1.asia.pool.ntp.org 2.asia.pool.ntp.org 3.asia.pool.ntp.org

sudo systemctl restart systemd-timesyncd
```
  
* 17:
```bash

bob@node01:~$ lsblk
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
nbd0    43:0    0   2G  0 disk /share

sudo umount /share

sudo nbd-client -d /dev/nbd0

sudo nbd-client -l 127.0.0.1

sudo nbd-client 127.0.0.1 -N disk2

sudo mount /dev/nbd0 /mnt
```

## Set 4:

* 1:

```bash

sudo kill id

```
  
* 2:

```bash

sudo nano /etc/nginx/sites-available/loadbalancer.conf

server ip_addr weight=3;

sudo nginx -t

sudo ln -s /etc/nginx/sites-available/loadbalancer.conf /etc/nginx/sites-enabled/loadbalancer.conf

sudo systemctl reload nginx

```
  
* 3:

```bash

cat /etc/passwd
sudo usermod -s /bin/bash jane
grep '^jane:' /etc/passwd

sudo usermod -aG sudo jane
groups jane


```
  
* 4:

```bash

sudo crontab -e -u john
0 3 * * 1,6 tar acf /home/john/www-snapshot.tgz /var/www
sudo crontab -l -u john

```
  
* 5:
```bash

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

sudo netplan apply

```

* 6:

```bash

sudo iptables -t nat -A PREROUTING -p tcp -s 10.9.9.0/24 --dport 80 -j DNAT --to-destination 10.100.0.8:80
sudo iptables -t nat -A POSTROUTING -s 10.9.9.0/24 -j MASQUERADE

```

* 7:

```bash

sudo timedatectl set-ntp true

timedatectl set-timezone Asia/Singapore

sudo timedatectl show-timesync | grep FallbackNTP

sudo systemctl restart systemd-timesyncd

```
  
* 8:
```bash

git status

git add .

git commit -m "Initial commit of project1"

git push origin master

```
  
* 9:

```bash

openssl x509 -in /home/bob/certs/third* -noout -text | grep "kodekloud.com"

sudo rm /home/bob/certs/first*

```
  
* 10:

```bash

sudo lvresize --extents 100%VG VG1/LV1

```
  
* 11:

```bash

docker ps -a

docker rm 63 -f

```
  
* 12:

```bash

sudo mkfs.ext4 /dev/vdc

sudo nano /etc/fstab

/dev/vdc /home/bob/share ext4 defaults 0 2

sudo mount -a

```
  
* 13:

```bash

sudo nano /etc/sysctl.conf

net.ipv6.conf.all.forwarding = 1

sudo sysctl --system

```
  
* 14:

```bash

sudo semanage fcontext -a -t httpd_sys_content_t "/var/www(/.*)?"

sudo restorecon -Rv /var/www/

```
 
* 15:

```bash

find /opt/archive/ -type f -perm /u=x

sudo rm /opt/archive/file43492

```
  
* 16:

```bash

df -h

sudo find /mnt -type f -exec ls -s {} + | sort -n -r | head -1 | awk '{print $2}' | xargs sudo rm -f

```
  
* 17:


```bash

sudo swapoff /additionalspace

```

