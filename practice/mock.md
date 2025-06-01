#Mock temporary file

Useful commands or approaches i found during the practice and exam will be added here


Kernel and System Info

CronJobs

Time synchronisation Configuration

Environment Variables

Archives and Compression

User, Groups and Sudoers

Network Packet Filtering

Disk Management

Find files with properties and perform actions

SSHFS and NFS

Docker Management

Git Workflow

Runtime Security of processes

Output redirection

Build and install from source

LoadBalancer

OpenSSH Configuration

LVM Storage

Regex, filter out log lines

User and Group limits

```bash
# =====================================================================
# LFCS Exam Cheat Sheet - Comprehensive Command Reference
# =====================================================================

# ---------------------------------------------------------------------
# 1. Kernel and System Info
# ---------------------------------------------------------------------
uname -r                 # Show kernel version
lsb_release -a           # Display distribution info
cat /proc/meminfo        # View memory details
dmesg | tail -20         # Check last 20 kernel messages
lscpu                    # Display CPU architecture info

# ---------------------------------------------------------------------
# 2. CronJobs
# ---------------------------------------------------------------------
crontab -e               # Edit user's cron jobs
crontab -l               # List scheduled jobs
systemctl status cron    # Check cron service status
# Cron syntax: * * * * * command-to-execute

# ---------------------------------------------------------------------
# 3. Time Synchronization
# ---------------------------------------------------------------------
timedatectl              # Check time status
timedatectl set-ntp true # Enable NTP synchronization
chronyc sources -v       # Verify NTP sources (Chrony)

# ---------------------------------------------------------------------
# 4. Environment Variables
# ---------------------------------------------------------------------
printenv                 # Show all environment variables
export TEMP_VAR="value"  # Set temporary variable
source ~/.bashrc         # Reload bash configuration

# ---------------------------------------------------------------------
# 5. Archives and Compression
# ---------------------------------------------------------------------
tar -czvf archive.tar.gz /path/to/dir  # Create compressed tarball
tar -xzvf archive.tar.gz               # Extract tarball
zip -r project.zip directory/          # Create ZIP archive
unzip project.zip                      # Extract ZIP archive

# ---------------------------------------------------------------------
# 6. User, Groups and Sudoers
# ---------------------------------------------------------------------
useradd -m -s /bin/bash username  # Create user with home directory
usermod -aG groupname username    # Add user to group
passwd username                   # Set user password
visudo                            # Safely edit sudo privileges

# ---------------------------------------------------------------------
# 7. Network Packet Filtering
# ---------------------------------------------------------------------
iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # Allow SSH traffic
iptables -L -v -n                     # List all iptables rules
ufw allow 80/tcp                      # Allow HTTP (UFW method)

# ---------------------------------------------------------------------
# 8. Disk Management
# ---------------------------------------------------------------------
fdisk -l                              # List partitions
mkfs.ext4 /dev/sdb1                   # Format partition as ext4
mount /dev/sdb1 /mnt/data             # Temporary mount
echo "/dev/sdb1 /mnt/data ext4 defaults 0 0" >> /etc/fstab  # Permanent mount

# ---------------------------------------------------------------------
# 9. Find Files and Perform Actions
# ---------------------------------------------------------------------
find /var/log -name "*.log"           # Find files by name
find / -size +10M -exec ls -lh {} \;  # Find large files and list details
find /tmp -type f -mtime +30 -delete  # Delete files older than 30 days

# ---------------------------------------------------------------------
# 10. SSHFS and NFS
# ---------------------------------------------------------------------
sshfs user@remote:/path /local/mount   # Mount remote directory via SSH
mount -t nfs server:/share /mnt/nfs    # Mount NFS share
umount /local/mount                    # Unmount filesystem

# ---------------------------------------------------------------------
# 11. Docker Management
# ---------------------------------------------------------------------
docker run -d -p 80:80 --name webserver nginx  # Run container
docker ps -a                          # List all containers
docker exec -it webserver bash         # Enter running container

# ---------------------------------------------------------------------
# 12. Git Workflow
# ---------------------------------------------------------------------
git clone https://github.com/user/repo.git  # Clone repository
git add . && git commit -m "Message"       # Stage and commit changes
git push origin main                       # Push to remote repository

# ---------------------------------------------------------------------
# 13. Runtime Security
# ---------------------------------------------------------------------
ps aux | grep suspicious           # Find processes
lsof -i :80                       # Check what's listening on port 80
chroot /jail /bin/bash             # Create restricted environment

# ---------------------------------------------------------------------
# 14. Output Redirection
# ---------------------------------------------------------------------
command > output.txt        # Redirect stdout to file
command 2> error.log        # Redirect stderr to file
command >> log.txt          # Append to file
command | grep "pattern"    # Pipe output to grep

# ---------------------------------------------------------------------
# 15. Build from Source
# ---------------------------------------------------------------------
# Standard build process:
./configure
make
sudo make install

# ---------------------------------------------------------------------
# 16. LoadBalancer (HAProxy)
# ---------------------------------------------------------------------
# Edit /etc/haproxy/haproxy.cfg:
# frontend http-in
#   bind *:80
#   default_backend servers
# backend servers
#   balance roundrobin
#   server s1 192.168.1.10:80 check
#   server s2 192.168.1.11:80 check

# ---------------------------------------------------------------------
# 17. OpenSSH Configuration
# ---------------------------------------------------------------------
# Important settings in /etc/ssh/sshd_config:
# PermitRootLogin no
# PasswordAuthentication no
# AllowUsers user1 user2

# ---------------------------------------------------------------------
# 18. LVM Storage
# ---------------------------------------------------------------------
pvcreate /dev/sdb              # Initialize physical volume
vgcreate vg_data /dev/sdb      # Create volume group
lvcreate -n lvol1 -L 20G vg_data  # Create logical volume
mkfs.xfs /dev/vg_data/lvol1    # Format as XFS

# ---------------------------------------------------------------------
# 19. Regex for Log Filtering
# ---------------------------------------------------------------------
grep -E "error|fail" /var/log/syslog  # Find errors or failures
awk '/pattern/ {print $1}' logfile    # Extract specific fields

# ---------------------------------------------------------------------
# 20. User/Group Limits
# ---------------------------------------------------------------------
# Edit /etc/security/limits.conf:
# * soft nofile 4096
# * hard nofile 8192
# username hard nproc 200

# ---------------------------------------------------------------------
# EXAM TIPS
# ---------------------------------------------------------------------
# 1. Use 'man' and '--help' extensively
# 2. Practice with time constraints
# 3. Know key files: /etc/fstab, /etc/passwd, /etc/sudoers
# 4. Verify commands with test cases
# 5. Backup config files before editing
# =====================================================================
```

## Essential Linux Directories & Config Files for LFCS Exam

1. System Configuration & Boot
`/etc/fstab`

**Purpos**e: Persistent filesystem mounting
**Exam Use**: Add/verify entries for automatic mounting

bash
/dev/sdb1  /data  ext4  defaults  0 0
/etc/default/grub

Purpose: GRUB bootloader configuration

Exam Use: Modify kernel parameters, set default OS

bash
GRUB_TIMEOUT=5
GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200"
/boot/grub2/grub.cfg

Purpose: Actual GRUB config (don't edit directly!)

Exam Use: Verify settings after running sudo update-grub

2. User Management
/etc/passwd

Purpose: User account information

Exam Use: Verify UID/GID, shell, home directory

bash
alice:x:1001:1001:Alice User:/home/alice:/bin/bash
/etc/shadow

Purpose: Secure user password storage

Exam Use: Reset passwords (sudo passwd user), check expiration

/etc/group

Purpose: Group definitions

Exam Use: Add users to groups (sudo usermod -aG group user)

/etc/sudoers

Purpose: Sudo privileges configuration

Exam Use: Grant admin access (always use visudo!)

bash
%admin  ALL=(ALL) NOPASSWD: ALL
3. Networking
/etc/netplan/ (Ubuntu)

Purpose: Network configuration (YAML files)

Exam Use: Configure static IP

yaml
network:
  ethernets:
    eth0:
      addresses: [192.168.1.10/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8]
/etc/sysconfig/network-scripts/ (RHEL/CentOS)

Purpose: Network interface configs

Exam Use: Edit ifcfg-eth0 for static IP

/etc/hosts

Purpose: Local hostname resolution

Exam Use: Add hostname mappings

bash
192.168.1.20  server1.lab  server1
/etc/resolv.conf

Purpose: DNS resolver configuration

Exam Use: Set nameservers (often auto-generated)

bash
nameserver 1.1.1.1
4. Service Management
/etc/systemd/system/

Purpose: Custom service unit files

Exam Use: Create custom services

bash
[Unit]
Description=My Service
[Service]
ExecStart=/usr/bin/myscript.sh
[Install]
WantedBy=multi-user.target
/etc/ssh/sshd_config

Purpose: SSH server configuration

Exam Use: Disable root login, change port

bash
Port 2222
PermitRootLogin no
5. Logging
/var/log/

Purpose: System and application logs

Key Files:

syslog/messages: General system logs

auth.log/secure: Authentication logs

boot.log: System startup messages

Exam Use: Troubleshoot issues with journalctl or grep

6. Cron & Automation
/etc/crontab

Purpose: System-wide cron jobs

Exam Use: Schedule root-level tasks

bash
0 3 * * * root /backup.sh
/etc/cron.d/

Purpose: Additional cron job files

Exam Use: Create modular cron configurations

/var/spool/cron/

Purpose: User-specific crontabs (use crontab -e instead!)

7. Package Management
/etc/apt/sources.list (Debian/Ubuntu)

Purpose: Software repositories

Exam Use: Add/remove repositories

/etc/yum.repos.d/ (RHEL/CentOS)

Purpose: YUM/DNF repository configs

Exam Use: Create custom .repo files

8. Kernel & Hardware
/proc/ (Virtual Filesystem)

Key Files:

/proc/cpuinfo: CPU details

/proc/meminfo: Memory usage

/proc/mounts: Mounted filesystems

Exam Use: Check hardware info without external tools

/sys/ (Virtual Filesystem)

Purpose: Kernel device management

Exam Use: Configure devices at runtime

9. Temporary Files
/tmp/

Purpose: Temporary files (cleared on reboot)

Exam Use: Store transient data

/var/tmp/

Purpose: Persistent temporary files



