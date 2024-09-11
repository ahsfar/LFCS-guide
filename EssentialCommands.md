# EssentialCommands.md
20% of Exam

- Basic Git Operations
- Create, configure, and troubleshoot services
- Monitor and troubleshoot system performance and services
- Determine application and service specific constraints
- Troubleshoot diskspace issues
- Work with SSL certificates

# Section 1
<details><summary>show</summary>
<p>
  
```bash
man ssh | grep -i version
hostnamectl set-hostname new_hostname
mandb
ssh -v alex@ubunut
man man
apropos ssh (run sudo mandb if error -> ssh: nothing appropriate.)
apropos NFS mount configuration | grep -i 'NFS mount' | grep -i Configuration | cut -d" " -f1 | cat >> /home/bob/nfs
```

</p>
</details>

### Summary

* Checking SSH Version:
```shell
man ssh | grep -i version
```
  * Search for the term "version" within the manual page of SSH. Useful for identifying SSH version-related details.

* Changing Hostname:
```shell
hostnamectl set-hostname new_hostname
```
  * Set a new hostname for the system using hostnamectl. Replace 'new_hostname' with the desired system hostname.

* Updating Manual Pages Database:
mandb
  * Rebuild the manual page index database. Useful when the man pages are outdated or missing.

* Verbose SSH Connection:
ssh -v alex@ubuntu
  * Start an SSH connection with detailed logging for troubleshooting. Replace 'alex' and 'ubuntu' with the appropriate username and hostname.

* Manual for man Command:
man man
  * Access the manual page for the 'man' command itself. Helpful for understanding how to use manual pages.

* Search for SSH in Manuals (with Error Handling):
apropos ssh
  * Search for SSH-related entries across man pages. If an error (e.g., "nothing appropriate") occurs, update the man database using 'sudo mandb' before retrying.

* Filtering NFS Mount Configuration:
```shell
apropos NFS mount configuration | grep -i 'NFS mount' | grep -i Configuration | cut -d" " -f1 | cat >> /home/bob/nfs
```
  * Search for NFS mount configuration details in the man pages, filter results, and append them to '/home/bob/nfs'. This is useful for gathering specific information on NFS configuration.


```shell
```

# Section 2

<details><summary>show</summary>
<p>
  
```bash
mkdir /home/bob/lfcs
touch /home/bob/lfcs/lfcs.txt
cp -r /tmp/Invoice/ /home/bob/
cp -p /home/bob/myfile.txt /home/bob/data/ -> (copy with attributes -p is to preserve attributes)
mv /home/bob/lfcs/* /home/bob/new-data/
ln -s /tmp /home/bob/link_to_tmp -> (soft link)
ln /tmp/hlink /home/bob/hlink -> (hard link)
mv /home/bob/new_file /home/bob/old_file (rename new to old)
mkdir -p /tmp/1/2/3/4/5/6/7/8/9
ls --full-time

```

</p>
</details>

### Summary
* 
```shell
```

# Section 3

<details><summary>show</summary>
<p>
  
```bash
find /dev/ -mmin -5
chmod g-w somefile
sudo find /var/log/ -perm -g=w ! -perm /o=rw > /home/bob/data.txt -> (file with certain permissions)
find /home/bob/ -perm 402 > /home/bob/secfile.txt
chmod u+s,g+s,o+t  /home/bob/datadir/
sudo find /usr/share/ | grep dogs.txt > /home/bob/dogs
find /home/bob/ -name cats.txt
sudo cp /home/bob/.etc/h/e/r/cats.txt /opt
sudo find /var/ -name pets > /home/bob/pets.txt
sudo find /var -type f -perm 0777 -print
sudo find /usr/ -type f -perm 0640 > /home/bob/.opt/permissions.txt
sudo find /usr -type f -mmin -120 | wc -l
sudo find /var -type f -size 20M
sudo find /usr -type f -size +5M -size -10M > /home/bob/size.txt
sudo chmod 0100 /home/bob/LFCS
chmod 0755 new_dir/ -> (rwxr-xr-x)

```

</p>
</details>

### Summary
* 
```shell
```

# Section 4

<details><summary>show</summary>
<p>
  
```bash
sed -i 's/enabled/disabled/g' /home/bob/values.conf
sed -i 's/disabled/enabled/gI' /home/bob/values.conf
awk 'NR>=500 && NR<=2000' /home/bob/values.conf
awk 'NR>=500 && NR<=2000' /home/bob/values.conf | sed -i 's/enabled/disabled/g' /home/bob/values.conf 
sed -i 's@#%$2jh//238720//31223@$2//23872031223@g' /home/bob/data.txt
egrep -o '\b[A-Z][a-z]{2,}\b' /etc/nsswitch.conf > /home/bob/filtered1
vi -> :set number (to see file with numbers), :1049 , y (to copy), d (to cut), :5 , P (to paste) , :wq
:1,1000d (delete first 1k lines in vim)
diff /home/bob/file1 /home/bob/file2 >> /home/bob/file3
egrep '[0-9]{5}' textfile > /home/bob/number
egrep '^2[0-9]*' /home/bob/textfile | wc -l > /home/bob/count
egrep -i ^Section /home/bob/testfile | wc -l > /home/bob/count_lines
grep -w man testfile > /home/bob/man_filtered
tail -500 /home/bob/textfile  > /home/bob/last

```

</p>
</details>

### Summary
* 
```shell
```

# Section 5


<details><summary>show</summary>
<p>
  
```bash
# https://training.linuxfoundation.org/blog/how-to-create-and-manage-archive-files-in-linux/#:~:text=To%20create%20an%20archive%20with,tar%27.
man tar
tar -cvf project.tar project
cd /home/bob
sudo tar cfP logs.tar /var/log/
tar -zcvf project.tar.gz project
cd /home/bob
sudo tar czfP logs.tar.gz /var/log/
cat /home/bob/logs.tar  > /home/bob/tar_data.txt
tar tfP /home/bob/logs.tar > /home/bob/tar_data.txt
tar --help
tar --extract --file /home/bob/archive.tar.gz --directory /tmp/
# or
tar xf /home/bob/archive.tar.gz -C /tmp
bash /home/bob/script.sh >&1 | tee /home/bob/output_stdout.txt
# https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file
sudo ./script.sh > /home/bob/output_stdout.txt
bash /home/bob/script.sh 2>&1 | tee /home/bob/output.txt
# or
sudo ./script.sh > /home/bob/output.txt 2>&1
sudo ./script.sh 2> /home/bob/output_errors.txt
man bzip2
bzip2 --keep /home/bob/file.txt
tar --help
sudo tar xf /home/bob/archive.tar.gz -C /opt
cat /home/bob/file.txt >> /home/bob/destination.txt
cd  /home/bob
tar --create --file file.tar  file
gzip --help
gzip games.txt
unxz --help
unxz lfcs.txt.xz
sort --help
sort -du /home/bob/values.conf > /home/bob/values.sort
sort -duf /home/bob/values.conf > /home/bob/values.sorted


```

</p>
</details>

### Summary
* 
```shell
```

# Section 6

<details><summary>show</summary>
<p>
  
```bash

openssl req -newkey rsa:4096 -keyout priv.key -out cert.csr
# enter password and enter for deafault options
# https://www.geeksforgeeks.org/practical-uses-of-openssl-command-in-linux/
openssl req -x509 -noenc -days 365 -keyout priv.key -out kodekloud.crt
# or
openssl req -newkey rsa:4096 -x509 -days 365 -nodes -keyout priv.key -out kodekloud.crt
openssl x509 -noout -subject -in my.crt
git branch --delete testing
git log --raw
git merge documentation

```

</p>
</details>

### Summary
* 
```shell
```
