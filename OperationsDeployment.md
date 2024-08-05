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

<details><summary>show</summary>
<p>
  
```bash

```

</p>
</details>

<details><summary>show</summary>
<p>
  
```bash
docker run -d -p 1234:80 --name website docker.io/library/nginx:latest

Docker ps -a

Docker rm website

Docker pull img_name

docker images
docker ps -a
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
docker rmi $IMAGE_ID
docker rmi $IMAGE_ID -f

docker rm -f $(docker ps -a -q)

docker run -d -p 9080:80 --restart always --name webinstance1 httpd

```

</p>
</details>
