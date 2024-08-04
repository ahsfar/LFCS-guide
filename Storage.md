# Storage.md
20% of Exam

- Configure and manage LVM storage
- Manage and configure the virtual file system
- Create, manage, and troubleshoot filesystems
- Use remote filesystems and network block devices
- Configure and manage swap space
- Configure filesystem automounters
- Monitor storage performance



lsblk
sudo mkswap /dev/sdb
df -TH 
swapon -h
swapon -s
10MB 21MB 15MB
sudo fdisk /dev/vdb
# m for menu
m
# n for new partition 
n
# enter defaults and +10M for size 
+10M
# w for writing the partition
w
mkswap /dev/vdb2
swapon /dev/vdb2
swapon -s
swapoff /dev/vdb2
cfdisk
