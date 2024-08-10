# Networking.md
25% of Exam

- Configure IPv4 and IPv6 networking and hostname resolution
- Set and synchronize system time using time servers
- Monitor and troubleshoot networking
- Configure the OpenSSH server and client
- Configure packet filtering, port redirection, and NAT
- Configure static routing
- Configure bridge and bonding devices
- Implement reverse proxies and load balancers

  
ip a

ip route show

sudo ss -tlnp | grep :22

sudo netstat -tlnp | grep 53

sudo netstat -tlnp | grep 8080

sudo vi /etc/hosts
8.8.8.8         example.com

sudo ip a add 192.168.9.3/24 dev eth1

sudo vim 99-custom.yaml

network:
  version: 2
  ethernets:
    enp6s0:
      dhcp4: false
      dhcp6: false
      addresses:
        - 10.0.10.5/24

sudo chmod 600 /etc/netplan/99-custom.yaml

sudo netplan apply

sudo netplan try
and click enter button

sudo netplan apply

ip a | grep enp6s0



sudo ip route show > route.txt
sudo ip r > route.txt

ss -tlnp

sudo netstat -tulpn | grep LISTEN


sudo vim /etc/systemd/resolved.conf
#DNS --> DNS=8.8.8.8

—
https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server

sudo ufw status numbered 

sudo ufw allow from 207.45.232.181

sudo ufw allow from 10.11.12.0/24

sudo ufw status numbered
sudo ufw delete 5
sudo ufw insert 1 deny from 10.0.0.19
