# UsersAndGroups.md
10% of Exam

- Create and manage local user and group accounts
- Manage personal and system-wide environment profiles
- Configure user resource limits
- Configure and manage ACLs
- Configure the system to use LDAP user and group accounts


https://www.redhat.com/sysadmin/linux-groups

sudo usermod -e 2030-03-01 jane

sudo useradd --system apachedev


sudo usermod -e "" jane

sudo useradd -s /bin/csh -m jack


sudo userdel -r jack

sudo change -d 0 jane
sudo chage --lastday 0 jane

sudo usermod -a -G developers jane


sudo groupadd -g 9875 cricket

sudo groupmod -n soccer cricket


sudo useradd -u 5322 -G soccer sam
# or
sudo useradd -G soccer sam  —uid 5322

sudo usermod -g rugby sam

sudo groupdel appdevs

sudo chage -W 2 jane

-------



nproc 

sudo vi /etc/security/limits.conf

trinity - nproc 30

ulimit -a > /home/bob/limits

sudo visudo /etc/sudoers
trinity    ALL=(ALL)   NOPASSWD: ALL

sudo visudo /etc/sudoers
trinity ALL=(ALL) /usr/bin/mount

sudo vi /etc/security/limits.conf
stephen hard fsize 4096

@salesteam     soft    nproc     20

sudo visudo /etc/sudoers
%salesteam     ALL=(ALL)     ALL

sudo visudo /etc/sudoers
trinity   ALL=(sam)   ALL

trinity ALL=(ALL) ALL
