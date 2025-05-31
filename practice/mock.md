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


#!/bin/bash
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

User and Group limits



