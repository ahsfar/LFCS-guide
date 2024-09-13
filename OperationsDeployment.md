# OperationsDeployment.md
25% of Exam

- Configure kernel parameters, persistent and non-persistent
- Diagnose, identify, manage, and troubleshoot processes and services
- Manage or schedule jobs for executing commands
- Search for, install, validate, and maintain software packages or repositories
- Recover from hardware, operating system, or filesystem failures
- Manage Virtual Machines (libvirt)
- Configure container engines, create and manage containers
- Create and enforce MAC using SELinux




## Section 1
<details><summary>show</summary>
<p>
  
```bash
shutdown --help
# https://www.cyberciti.biz/faq/switch-boot-target-to-text-gui-in-systemd-linux/
systemctl get-default
sudo systemctl set-default graphical.target
sudo reboot
sudo nano /etc/default/grub
grub-install /dev/vda > /home/bob/grub.txt 2>&1
systemctl get-default > /home/bob/boot-target.txt
sudo shutdown -c
# https://docs.rackspace.com/docs/linux-reboot-and-shutdown-commands#:~:text=Cancel%20a%20shutdown,to%20cancel%20a%20scheduled%20shutdown.

```

</p>
</details>


### Summary

* View shutdown command help:
   `shutdown --help`
   * Display help options for the `shutdown` command.

* Check the current default boot target:
   `systemctl get-default`
   * Show the current systemd default boot target (e.g., graphical or multi-user).

* Set default boot target to graphical mode:
   `sudo systemctl set-default graphical.target`
   * Change the default boot target to graphical mode (GUI).

* Reboot the system:
   `sudo reboot`
   * Reboot the system immediately.

* Edit GRUB configuration:
   `sudo nano /etc/default/grub`
   * Open the GRUB configuration file for editing.

* Install GRUB and redirect output to a file:
   `grub-install /dev/vda > /home/bob/grub.txt 2>&1`
   * Install GRUB on `/dev/vda` and save both stdout and stderr to `grub.txt`.

* Save the default boot target to a file:
   `systemctl get-default > /home/bob/boot-target.txt`
   * Write the current default boot target to `boot-target.txt`.

* Cancel a scheduled shutdown:
   `sudo shutdown -c`
   * Cancel any scheduled shutdown or reboot operation.


## Section 2
<details><summary>show</summary>
<p>
  
```bash
#!/bin/bash
tar acf archive.tar.gz dir1
systemctl status sshd.service | grep -i pid
#!/bin/bash
systemctl is-enabled sshd.service
#!/bin/bash
chmod 0100 /home/bob/dir8
systemctl status sshd.service > /home/bob/service.txt
systemctl --help
sudo systemctl mask apache2
# https://www.techrepublic.com/article/masked-services-linux-how-manage/
sudo systemctl unmask apache2
# kkloud.service -> configuration
[Unit]
Description=KodeKloud Service
After=sshd.service

[Service]
ExecStart=/usr/local/bin/kkloud
ExecStop=/usr/local/bin/kkloud --savedata
KillMode=process
Restart=always
Type=simple

[Install]
WantedBy=multi-user.target

```

</p>
</details>

### Summary
* 
```shell
```

## Section 3

<details><summary>show</summary>
<p>
  
```bash
ps lax
ps aux
sudo renice 9 <PID>
# (list open files by process id 1)
sudo lsof -p 1 > /home/bob/files.txt 
# journalctl to show systemd logs for shh and latest 20 lines with no pages all in one
sudo journalctl --unit=ssh.service -n 20 --no-pager 
pgrep -a rpcbind | cut -f1 -d' ' > /home/bob/pid.txt
systemctl status ssh.service
sudo kill -SIGHUP 1399
sudo grep -r --text 'reboot' /var/log/ > reboot.log
sudo journalctl -p err > /home/bob/.priority/priority.log
# https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs
sudo journalctl -p info -g '^c' > .priority/boot.log 
# | grep '^c' didn't work for above
ps u 1 > /home/bob/resources.txt
sleep 3000 &

```

</p>
</details>

### Summary
* 
```shell
```

## Section 4
<details><summary>show</summary>
<p>
  
```bash
0 16 1,15 * * echo Timesheets Due > /dev/console
# https://docs.oracle.com/cd/E19455-01/805-7229/sysrescron-62861/index.html
# Time Field -> Values 
# Minute  -> 0-59 
# Hour -> 0-23 
# Day of month -> 1-31 
# Month -> 1-12 
# Day of week -> 0-6 (0 = Sunday) 
sudo crontab -l
sudo anacron -n -f
at 10:00 PM (enter cmd prompt after finish ctrl + d)
atq > /home/bob/at_jobs.txt
atrm 1
30 21 * * * /usr/bin/touch test_passed
sudo nano /etc/anacrontab 
10      5       db_cleanup      /usr/bin/touch /root/anacron_created_this
# https://kifarunix.com/scheduling-tasks-using-anacron-in-linux-unix/
sudo at 15:30 Aug 20 2024
# https://www.baeldung.com/linux/at-command#:~:text=General%20Usage%20of%20the%20at,can%20use%20either%20of%20them.
0 0 1 * * /usr/bin/touch monthly
0 11 * * 0 /usr/bin/touch weekly
0 6,23 * * 0 sudo systemctl restart nginx

```

</p>
</details>

### Summary
* 
```shell
```

## Section 5
<details><summary>show</summary>
<p>
  
```bash
sudo apt search "apache http server"
sudo apt update 
sudo apt install apache2
dpkg -S /bin/ls | cut -d: -f1 > package.txt
dpkg-query -L coreutils | grep -i "/bin" | cut -d/ -f4 | grep '^u' > name.txt
dpkg --listfiles coreutils | grep ^/bin | cut -d/ -f3 | grep '^u' > name.txt
sudo apt-get remove --auto-remove -y ziptool
sudo nano /etc/apt/sources.list
deb http://us.archive.ubuntu.com/ubuntu/ focal main
sudo apt update
# buiild and install application
cd tmux
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install
tmux

```

</p>
</details>

### Summary
* 
```shell
```

## Section 6
<details><summary>show</summary>
<p>
  
```bash
df /
du -sh /bin/
free --mega
uptime
lscpu
sudo xfs_repair -n /dev/vdb > /home/bob/fscheck 2>&1

```

</p>
</details>

### Summary
* 
```shell
```

## Section 7
<details><summary>show</summary>
<p>
  
```bash
# https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/sect-security-enhanced_linux-working_with_selinux-selinux_contexts_labeling_files#sect-Security-Enhanced_Linux-SELinux_Contexts_Labeling_Files-Temporary_Changes_chcon

ps auxZ | grep sshd
vi /home/bob/sshd
system_u:system_r:initrc_t:s0

sysctl -w kernel.modules_disabled=1

ls -Z /bin/sudo

sysctl -w net.ipv6.conf.lo.seg6_enabled=1

vi /etc/sysctl.conf
vm.swappiness=10
sysctl -p

chcon -t httpd_sys_content_t /var/index.html

# permissive
sudo setenforce 0

semanage user -l

sudo restorecon -R /var/log/
```

</p>
</details>

### Summary
* 
```shell
```

## Section 8
<details><summary>show</summary>
<p>
  
```bash
virsh destroy VM1
virsh autostart VM1
docker ps -a
docker run -d -p 1234:80 --name website docker.io/library/nginx:latest
docker rm website
docker pull img_name
docker images
docker ps -a
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
docker rmi $IMAGE_ID
docker rmi $IMAGE_ID -f
docker rm -f $(docker ps -a -q)
docker run -d -p 9080:80 --restart always --name webinstance1 httpd
virsh list --all
virsh start VM1
virsh destroy VM1
virsh undefine VM1
 
virsh define /opt/testmachine2.xml
virsh list --all
virsh start VM2
 
virsh setmaxmem VM2 80M --config
virsh setmem VM2 80M --config
virsh shutdown VM2
 
virsh destroy VM2
virsh start VM2
 
virt-install --name kk-ubuntu --memory=1024 --vcpu=1 --graphics=none --disk path=/var/lib/libvirt/images/ubuntu-22.04-minimal-cloudimg-amd64.img --os-variant=ubuntu22.04 --network network=default --import
 
virt-install \
    --name kk-ubuntu \
    --memory 1024 \
    --vcpus 1 \
    --disk path=/var/lib/libvirt/images/ubuntu-22.04-minimal-cloudimg-amd64.img\
    --import \
    --os-variant ubuntu22.04 \
    --graphics none \
    --network network=default


```

</p>
</details>
