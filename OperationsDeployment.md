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
<details><summary>show commands</summary>
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
<details><summary>show commands</summary>
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

* Create a compressed tar archive:
   `tar acf archive.tar.gz dir1`
   * Archive and compress `dir1` into `archive.tar.gz`.

* Check the status of the SSH service and search for the PID:
   `systemctl status sshd.service | grep -i pid`
   * Display the status of `sshd.service` and search for the process ID (PID).

* Check if SSH service is enabled:
   `systemctl is-enabled sshd.service`
   * Check whether the SSH service is enabled at boot.

* Change directory permissions to execute-only for owner:
   `chmod 0100 /home/bob/dir8`
   * Set permissions on `/home/bob/dir8` to execute-only for the owner.

* Save SSH service status to a file:
   `systemctl status sshd.service > /home/bob/service.txt`
   * Write the status of `sshd.service` to `service.txt`.

* View systemctl help:
   `systemctl --help`
   * Display help options for the `systemctl` command.

* Mask the Apache2 service:
   `sudo systemctl mask apache2`
   * Mask the Apache2 service, preventing it from being started manually or automatically.

* Unmask the Apache2 service:
   `sudo systemctl unmask apache2`
   * Unmask the Apache2 service, allowing it to be started again.

* Service Configuration:

  ```shell
  [Unit] Description=KodeKloud Service After=sshd.service
  
  [Service] ExecStart=/usr/local/bin/kkloud ExecStop=/usr/local/bin/kkloud --savedata KillMode=process Restart=always Type=simple
  
  [Install] WantedBy=multi-user.target
  ```
  * Configuration file for `kkloud.service` with details for starting, stopping, and managing the service in a multi-user environment.


## Section 3

<details><summary>show commands</summary>
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

* Display detailed process information (BSD style):
   `ps lax`
   * Show detailed information about all processes with extended options.

* Display detailed process information (GNU style):
   `ps aux`
   * Show all running processes with their user and resource usage.

* Change the priority of a process:
   `sudo renice 9 <PID>`
   * Change the nice value of a process to 9 for the given PID.

* List open files by process ID:
   `sudo lsof -p 1 > /home/bob/files.txt`
   * List all open files for process ID 1 and save the output to `files.txt`.

* Show the last 20 SSH service logs without pagination:
   `sudo journalctl --unit=ssh.service -n 20 --no-pager`
   * Display the last 20 lines of logs for the SSH service without paging.

* Find the PID of `rpcbind` and save to a file:
   `pgrep -a rpcbind | cut -f1 -d' ' > /home/bob/pid.txt`
   * Find the PID of `rpcbind` and save it to `pid.txt`.

* Check the status of the SSH service:
   `systemctl status ssh.service`
   * Display the current status of the SSH service.

* Send a SIGHUP signal to a process:
   `sudo kill -SIGHUP 1399`
   * Send the SIGHUP signal to process with PID 1399.

* Search for 'reboot' in system logs:
   `sudo grep -r --text 'reboot' /var/log/ > reboot.log`
   * Recursively search for the word 'reboot' in `/var/log/` and save results to `reboot.log`.

* Show all systemd logs with error priority:
   `sudo journalctl -p err > /home/bob/.priority/priority.log`
   * Display logs with error priority and save them to `priority.log`.

* Show systemd logs with info priority and filter by '^c':
   `sudo journalctl -p info -g '^c' > .priority/boot.log`
   * Display logs with info priority, filtered by lines starting with 'c', and save to `boot.log`.

* Show resource usage for process ID 1:
   `ps u 1 > /home/bob/resources.txt`
   * Display resource usage for process 1 and save to `resources.txt`.

* Run a process in the background for 3000 seconds:
   `sleep 3000 &`
   * Run the `sleep` command for 3000 seconds in the background.


## Section 4
<details><summary>show commands</summary>
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
* Summary

* Schedule a cron job to display a message at 4:00 PM on the 1st and 15th of each month:
   `0 16 1,15 * * echo Timesheets Due > /dev/console`
   * Schedule a cron job to output "Timesheets Due" to the console at 4:00 PM on the 1st and 15th of every month.

* List current user's cron jobs:
   `sudo crontab -l`
   * Display all cron jobs for the current user.

* Run anacron jobs immediately:
   `sudo anacron -n -f`
   * Run all anacron jobs immediately, ignoring the normal delay.

* Schedule a task at 10:00 PM:
   `at 10:00 PM`
   * Schedule a command to run at 10:00 PM using the `at` command. Press `Ctrl+D` to finish.

* List all scheduled `at` jobs:
   `atq > /home/bob/at_jobs.txt`
   * List all scheduled `at` jobs and save the output to `at_jobs.txt`.

* Remove an `at` job:
   `atrm 1`
   * Remove the first job from the `at` queue.

* Schedule a cron job to run at 9:30 PM every day:
   `30 21 * * * /usr/bin/touch test_passed`
   * Create a cron job to touch `test_passed` at 9:30 PM every day.

* Edit the anacrontab file:
   `sudo nano /etc/anacrontab`
   * Open the anacrontab file for editing.

* Add an anacron job to run a database cleanup:
   `10      5       db_cleanup      /usr/bin/touch /root/anacron_created_this`
   * Schedule a task named `db_cleanup` in anacron to run every 5 days with a 10-minute delay.

* Schedule a task using the `at` command for a future date:
   `sudo at 15:30 Aug 20 2024`
   * Schedule a task to run at 3:30 PM on August 20, 2024, using `at`.

* Schedule a monthly cron job:
   `0 0 1 * * /usr/bin/touch monthly`
   * Schedule a cron job to run at midnight on the 1st of each month and touch the `monthly` file.

* Schedule a weekly cron job:
   `0 11 * * 0 /usr/bin/touch weekly`
   * Schedule a cron job to run at 11:00 AM every Sunday and touch the `weekly` file.

* Restart nginx at 6:00 AM and 11:00 PM every Sunday:
   `0 6,23 * * 0 sudo systemctl restart nginx`
   * Schedule a cron job to restart the nginx service at 6:00 AM and 11:00 PM every Sunday.


## Section 5
<details><summary>show commands</summary>
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

* Search for Apache HTTP Server:
   `sudo apt search "apache http server"`
   * Search the package repository for Apache HTTP Server.

* Update package lists:
   `sudo apt update`
   * Refresh the package lists to get the latest versions.

* Install Apache2:
   `sudo apt install apache2`
   * Install the Apache2 web server.

* Find the package that provides `/bin/ls` and save it to a file:
   `dpkg -S /bin/ls | cut -d: -f1 > package.txt`
   * Find the package providing `/bin/ls` and save the package name to `package.txt`.

* List installed files of `coreutils` in `/bin` that start with 'u':
   `dpkg-query -L coreutils | grep -i "/bin" | cut -d/ -f4 | grep '^u' > name.txt`
   * List the files from `coreutils` in `/bin` starting with 'u' and save them to `name.txt`.

* List `coreutils` files in `/bin` and filter by names starting with 'u':
   `dpkg --listfiles coreutils | grep ^/bin | cut -d/ -f3 | grep '^u' > name.txt`
   * List all files installed by `coreutils` in `/bin` starting with 'u' and save to `name.txt`.

* Remove `ziptool` package and its dependencies:
   `sudo apt-get remove --auto-remove -y ziptool`
   * Uninstall `ziptool` along with any unused dependencies.

* Edit the APT sources list:
   `sudo nano /etc/apt/sources.list`
   * Open the APT sources list for editing.

* Add a new APT source:
   `deb http://us.archive.ubuntu.com/ubuntu/ focal main`
   * Add the Ubuntu focal main repository to your sources list.

* Update package lists again:
   `sudo apt update`
   * Refresh the package lists to reflect changes made in the sources.

* Build and install an application (tmux):
   ```bash
   cd tmux
   sudo ./autogen.sh
   sudo ./configure
   sudo make
   sudo make install
  ```


## Section 6
<details><summary>show commands</summary>
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

* Check disk usage of the root filesystem:
   `df /`
   * Display disk space usage for the root (`/`) filesystem.

* Check the size of the `/bin` directory:
   `du -sh /bin/`
   * Show the total size of the `/bin` directory in a human-readable format.

* Display free memory in megabytes:
   `free --mega`
   * Show the system's memory usage, with output in megabytes.

* Show system uptime:
   `uptime`
   * Display how long the system has been running, along with the number of logged-in users and the load averages.

* Display CPU architecture details:
   `lscpu`
   * Show information about the CPU architecture and processing units.

* Perform a read-only XFS filesystem check and save output:
   `sudo xfs_repair -n /dev/vdb > /home/bob/fscheck 2>&1`
   * Perform a read-only check of the XFS filesystem on `/dev/vdb` and save the output to `fscheck`.


## Section 7
<details><summary>show commands</summary>
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

* Check SELinux security context of processes using `ps`:
   `ps auxZ | grep sshd`
   * Display processes with their SELinux security context and filter for `sshd`.

* Open a file for editing with `vi`:
   `vi /home/bob/sshd`
   * Open `/home/bob/sshd` for editing with the `vi` editor.

* Example SELinux context:
   `system_u:system_r:initrc_t:s0`
   * Example of an SELinux security context.

* Disable kernel module loading:
   `sysctl -w kernel.modules_disabled=1`
   * Temporarily disable the ability to load kernel modules.

* List SELinux context for `/bin/sudo`:
   `ls -Z /bin/sudo`
   * Show the SELinux security context for `/bin/sudo`.

* Enable Segment Routing on the loopback interface:
   `sysctl -w net.ipv6.conf.lo.seg6_enabled=1`
   * Temporarily enable Segment Routing (SRv6) on the loopback interface.

* Edit sysctl configuration:
   `vi /etc/sysctl.conf`
   * Open `/etc/sysctl.conf` to edit system parameters.

* Set the system swappiness value:
   `vm.swappiness=10`
   * Set the swappiness value to `10`, which controls how aggressively the system swaps memory.

* Apply sysctl settings:
   `sysctl -p`
   * Reload and apply settings from `/etc/sysctl.conf`.

* Change SELinux file context temporarily:
   `chcon -t httpd_sys_content_t /var/index.html`
   * Temporarily change the SELinux type of `/var/index.html` to `httpd_sys_content_t`.

* Set SELinux to permissive mode:
   `sudo setenforce 0`
   * Temporarily switch SELinux to permissive mode.

* List all SELinux users:
   `semanage user -l`
   * Display a list of all SELinux users.

* Restore default SELinux security contexts:
   `sudo restorecon -R /var/log/`
   * Restore the default SELinux context recursively for files in `/var/log/`.


## Section 8
<details><summary>show commands</summary>
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

### Summary

* Forcefully stop a virtual machine:
   `virsh destroy VM1`
   * Forcefully shut down the virtual machine `VM1`.

* Set a virtual machine to autostart:
   `virsh autostart VM1`
   * Enable the `VM1` virtual machine to start automatically on system boot.

* List all Docker containers (including stopped ones):
   `docker ps -a`
   * Display all Docker containers, both running and stopped.

* Run an NGINX container and map port 1234 to 80:
   `docker run -d -p 1234:80 --name website docker.io/library/nginx:latest`
   * Run an NGINX container in detached mode and map port 1234 to 80.

* Remove a Docker container:
   `docker rm website`
   * Remove the Docker container named `website`.

* Pull a Docker image:
   `docker pull img_name`
   * Pull the Docker image specified by `img_name`.

* List all Docker images:
   `docker images`
   * Display all downloaded Docker images.

* List all containers again (including stopped):
   `docker ps -a`
   * Show all containers, including stopped ones.

* Stop a running Docker container:
   `docker stop $CONTAINER_ID`
   * Stop the container with the specified `CONTAINER_ID`.

* Remove a stopped Docker container:
   `docker rm $CONTAINER_ID`
   * Remove the container with the given `CONTAINER_ID`.

* Remove a Docker image:
   `docker rmi $IMAGE_ID`
   * Remove the Docker image with the specified `IMAGE_ID`.

* Forcefully remove a Docker image:
   `docker rmi $IMAGE_ID -f`
   * Force remove the Docker image with the specified `IMAGE_ID`.

* Remove all Docker containers:
   `docker rm -f $(docker ps -a -q)`
   * Forcefully remove all Docker containers.

* Run an HTTPD container with always restart policy:
   `docker run -d -p 9080:80 --restart always --name webinstance1 httpd`
   * Run an HTTPD container on port 9080 with an always-restart policy.

* List all virtual machines:
   `virsh list --all`
   * Display all virtual machines, including those that are stopped.

* Start a virtual machine:
   `virsh start VM1`
   * Start the virtual machine `VM1`.

* Force stop a virtual machine:
   `virsh destroy VM1`
   * Forcefully shut down the virtual machine `VM1`.

* Undefine a virtual machine:
   `virsh undefine VM1`
   * Remove the virtual machine `VM1` from the configuration but keep the disk files.

* Define a new virtual machine:
   `virsh define /opt/testmachine2.xml`
   * Create a virtual machine from the XML configuration file `/opt/testmachine2.xml`.

* Start a virtual machine:
   `virsh start VM2`
   * Start the virtual machine `VM2`.

* Set the maximum memory for a virtual machine:
   `virsh setmaxmem VM2 80M --config`
   * Set the maximum memory for `VM2` to 80MB in its configuration.

* Set the memory for a running virtual machine:
   `virsh setmem VM2 80M --config`
   * Change the current memory of `VM2` to 80MB.

* Shut down a virtual machine gracefully:
   `virsh shutdown VM2`
   * Gracefully shut down the virtual machine `VM2`.

* Restart a virtual machine:
   `virsh destroy VM2 && virsh start VM2`
   * Force stop and then start `VM2` again.

* Install a virtual machine from a disk image:
   `virt-install --name kk-ubuntu --memory=1024 --vcpu=1 --graphics=none --disk path=/var/lib/libvirt/images/ubuntu-22.04-minimal-cloudimg-amd64.img --os-variant=ubuntu22.04 --network network=default --import`
   * Install a virtual machine named `kk-ubuntu` with 1GB of memory, 1 vCPU, and an imported disk image.

* Install a virtual machine with multi-line options:
   ```bash
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
    * Install a virtual machine named kk-ubuntu with specified options, using multi-line command syntax.

