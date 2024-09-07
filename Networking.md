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


## Section 1
<details><summary>show</summary>
<p>
  
```bash
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
```

</p>
</details>

### Summary
* Display Network Interfaces:
`ip a`
* Show Routing Table:
`ip route show`
* Check Listening Ports for SSH:
`sudo ss -tlnp | grep :22`
* Check Listening Ports for DNS:
`sudo netstat -tlnp | grep 53`
* Check Listening Ports for HTTP:
`sudo netstat -tlnp | grep 8080`
```shell
sudo vi /etc/hosts  
8.8.8.8 example.com
```
* Add IP Address to Interface:
`sudo ip a add 192.168.9.3/24 dev eth1`
* Edit Netplan Configuration:
```shell
sudo vim 99-custom.yaml  
network:  
  version: 2  
  ethernets:  
    enp6s0:  
      dhcp4: false  
      dhcp6: false  
      addresses:  
        - 10.0.10.5/24
```
* Set Permissions for Netplan File:
`sudo chmod 600 /etc/netplan/99-custom.yaml`
* Apply Netplan Configuration:
`sudo netplan apply`
* Test Netplan Configuration:
`sudo netplan try (then press Enter)`
* Reapply Netplan Configuration:
`sudo netplan apply`
* Check Specific Interface Address:
`ip a | grep enp6s0`
* Save Routing Table to File:
```shell
sudo ip route show > route.txt
sudo ip r > route.txt
```
* Display Listening Sockets:
`ss -tlnp`
* Check Listening Ports with Netstat:
`sudo netstat -tulpn | grep LISTEN`
* Edit Systemd Resolved Configuration:
```shell
sudo vim /etc/systemd/resolved.conf  
#DNS --> DNS=8.8.8.8
```


## Section 2
<details><summary>show</summary>
<p>
  
```bash
# https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server

sudo ufw status numbered 

sudo ufw allow from 207.45.232.181

sudo ufw allow from 10.11.12.0/24

sudo ufw status numbered
sudo ufw delete 5
sudo ufw insert 1 deny from 10.0.0.19
```

</p>
</details>

### Summary

* Check UFW Status with Numbers:
`sudo ufw status numbered`
* Allow Specific IP Access:
`sudo ufw allow from 207.45.232.181`
* Allow Subnet Access:
`sudo ufw allow from 10.11.12.0/24`
* Check UFW Status Again:
`sudo ufw status numbered`
* Delete Rule by Number:
`sudo ufw delete 5`
* Deny Access from Specific IP:
`sudo ufw insert 1 deny from 10.0.0.19`

## Section 3
<details><summary>show</summary>
<p>
  
```bash
cat /etc/ssh/sshd_config


sudo vi /etc/ssh/sshd_config
PasswordAuthentication no
sudo systemctl restart sshd

sudo apt install squid -y
sudo systemctl start squid

sudo vi /etc/squid/squid.conf
http_access deny localnet

sudo vi /etc/squid/squid.conf
acl vpn src 203.0.110.5
http_access allow vpn
# allow before http_access deny otherwise it won’t work

sudo vi /etc/ssh/sshd_config
#AddressFamily any
AddressFamily inet

sudo vi /etc/squid/squid.conf
http_access allow external

sudo vi /etc/squid/squid.conf
acl facebook dstdomain .facebook.com
http_access deny facebook

sudo vi /etc/ssh/sshd_config
PasswordAuthentication yes
PermitRootLogin no
sudo systemctl restart sshd
```

</p>
</details>

### Summary

* View SSH Configuration:
`cat /etc/ssh/sshd_config`
* Edit SSH Configuration to Disable Password Authentication:
```shell
sudo vi /etc/ssh/sshd_config  
PasswordAuthentication no
```
* Restart SSH Service:
`sudo systemctl restart sshd`
* Install Squid Proxy:
`sudo apt install squid -y`
* Start Squid Service:
`sudo systemctl start squid`
* Edit Squid Configuration to Deny Local Network Access:
```shell
sudo vi /etc/squid/squid.conf  
http_access deny localnet
```
* Allow VPN IP Access in Squid
```shell
acl vpn src 203.0.110.5  
http_access allow vpn
```
* Edit SSH Configuration to Use IPv4 Only:
```shell
sudo vi /etc/ssh/sshd_config  
AddressFamily inet
```
* Allow External Access in Squid:
`http_access allow external`
* Deny Access to Facebook in Squid:
```shell
acl facebook dstdomain .facebook.com  
http_access deny facebook
```
* Revert SSH Password Authentication and Deny Root Login:
```shell
PasswordAuthentication yes  
PermitRootLogin no
```
* Restart SSH Service Again:
`sudo systemctl restart sshd`
