# UsersAndGroups.md
10% of Exam

- Create and manage local user and group accounts
- Manage personal and system-wide environment profiles
- Configure user resource limits
- Configure and manage ACLs
- Configure the system to use LDAP user and group accounts


## Summary of Key Commands: Create and manage local user and group accounts
* Creating Users:
`useradd [options] username`
* Modifying Users:
`usermod [options] username`
* Deleting Users:
`userdel [options] username`
* Creating Groups:
`groupadd [options] groupname`
* Modifying Groups:
`groupmod [options] groupname`
* Deleting Groups:
`groupdel groupname`

<details><summary>Commands: Create and manage local user and group accounts</summary>
<p>
  
```bash
# https://www.redhat.com/sysadmin/linux-groups

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
```

</p>
</details>


<details><summary>show</summary>
<p>
  
```bash
echo $variable

$HOME

/etc/environment

env > /home/bob/env


vi ~/.bashrc
export MYVAR=TRUE
source ~/.bashrc

env | grep GLOBALENV > /home/bob/globalenv

sudo cp /etc/skel/.bash* /home/bob/default_data/

sudo vi /etc/environment
GLOBALOPTION=ON
source /etc/environment

sudo vi /etc/profile.d/welcome.sh
echo "Welcome to our server!"

sudo touch /etc/skel/README

sudo vi /etc/environment
LFCS=Welcome to the KodeKloud LFCS Labs!
sudo su - bob

vi /home/bob/.bashrc
PATH="$HOME/.local/bin:$HOME/bin:$HOME/.config/bin:$PATH"
source ~/.bashrc

```

</p>
</details>


<details><summary>show</summary>
<p>
  
```bash
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

```

</p>
</details>


## Summary

Show Number of Processing Units:
nproc

Edit Security Limits Configuration:
sudo vi /etc/security/limits.conf

Set Max Processes for User Trinity:
trinity - nproc 30

Output Current Limits to File:
ulimit -a > /home/bob/limits

Edit Sudoers File for No Password Access:
sudo visudo /etc/sudoers
trinity ALL=(ALL) NOPASSWD: ALL

Edit Sudoers for Mount Command Access:
sudo visudo /etc/sudoers
trinity ALL=(ALL) /usr/bin/mount

Set Hard File Size Limit for Stephen:
sudo vi /etc/security/limits.conf
stephen hard fsize 4096

Set Soft Process Limit for Sales Team:
@salesteam soft nproc 20

Grant All Sudo Access to Sales Team Group:
sudo visudo /etc/sudoers
%salesteam ALL=(ALL) ALL

Grant All Sudo Access to User Trinity as User Sam:
sudo visudo /etc/sudoers
trinity ALL=(sam) ALL

Grant All Sudo Access to User Trinity:
trinity ALL=(ALL) ALL



