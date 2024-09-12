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

* Checking SSH Version: `man ssh | grep -i version`
  * Search for the term "version" within the manual page of SSH. Useful for identifying SSH version-related details.

* Changing Hostname: `hostnamectl set-hostname new_hostname`  
  * Set a new hostname for the system using hostnamectl. Replace 'new_hostname' with the desired system hostname.

* Updating Manual Pages Database: `mandb`
  * Rebuild the manual page index database. Useful when the man pages are outdated or missing.

* Verbose SSH Connection: `ssh -v alex@ubuntu`
  * Start an SSH connection with detailed logging for troubleshooting. Replace 'alex' and 'ubuntu' with the appropriate username and hostname.

* Manual for man Command: `man man`
  * Access the manual page for the 'man' command itself. Helpful for understanding how to use manual pages.

* Search for SSH in Manuals (with Error Handling): `apropos ssh`
  * Search for SSH-related entries across man pages. If an error (e.g., "nothing appropriate") occurs, update the man database using 'sudo mandb' before retrying.

* Filtering NFS Mount Configuration: `apropos NFS mount configuration | grep -i 'NFS mount' | grep -i Configuration | cut -d" " -f1 | cat >> /home/bob/nfs`
  * Search for NFS mount configuration details in the man pages, filter results, and append them to '/home/bob/nfs'. This is useful for gathering specific information on NFS configuration.




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

* Create Directory
   `mkdir /home/bob/lfcs`
   * Create a new directory `/home/bob/lfcs`.

* Create an Empty File
   `touch /home/bob/lfcs/lfcs.txt`
   * Create an empty file `lfcs.txt` in the `/home/bob/lfcs` directory.

* Copy Directory Recursively
   `cp -r /tmp/Invoice/ /home/bob/`
   * Copy the entire `/tmp/Invoice` directory recursively to `/home/bob/`.

* Copy File with Attributes
   `cp -p /home/bob/myfile.txt /home/bob/data/`
   * Copy `myfile.txt` to the `/home/bob/data/` directory, preserving file attributes (like ownership, timestamps, etc.).

* Move Files
   `mv /home/bob/lfcs/* /home/bob/new-data/`
   * Move all files from the `/home/bob/lfcs/` directory to `/home/bob/new-data/`.

* Create Soft Link
   `ln -s /tmp /home/bob/link_to_tmp`
   * Create a symbolic (soft) link from `/tmp` to `/home/bob/link_to_tmp`.

* Create Hard Link
   `ln /tmp/hlink /home/bob/hlink`
   * Create a hard link for the `/tmp/hlink` file in `/home/bob/`.

* Rename File
   `mv /home/bob/new_file /home/bob/old_file`
   * Rename `new_file` to `old_file` in the `/home/bob/` directory.

* Create Nested Directories
   `mkdir -p /tmp/1/2/3/4/5/6/7/8/9`
   * Create nested directories up to `/tmp/1/2/3/4/5/6/7/8/9` in a single command.

* List Files with Full Time
   `ls --full-time`
   * List files in the directory showing full time information, including timestamps.


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

* Find files modified in the last 5 minutes
   `find /dev/ -mmin -5`
   * Search for files in `/dev/` directory modified in the last 5 minutes.

* Remove group write permission
   `chmod g-w somefile`
   * Remove write permission for the group from the `somefile`.

* Find files with group write permission but not world read/write
   `sudo find /var/log/ -perm -g=w ! -perm /o=rw > /home/bob/data.txt`
   * Search for files in `/var/log/` with group write permission but without world read/write permission, and save the output to `/home/bob/data.txt`.

* Find files with specific permission code
   `find /home/bob/ -perm 402 > /home/bob/secfile.txt`
   * Search for files in `/home/bob/` with the permission code `402` and save the output to `/home/bob/secfile.txt`.

* Set special permissions on a directory
   `chmod u+s,g+s,o+t /home/bob/datadir/`
   * Set the SUID, SGID, and sticky bit on the directory `/home/bob/datadir/`.

* Find file by name and redirect result to file
   `sudo find /usr/share/ | grep dogs.txt > /home/bob/dogs`
   * Search for `dogs.txt` in `/usr/share/` and save the result to `/home/bob/dogs`.

* Find file by name
   `find /home/bob/ -name cats.txt`
   * Search for a file named `cats.txt` in `/home/bob/`.

* Copy file to another location
   `sudo cp /home/bob/.etc/h/e/r/cats.txt /opt`
   * Copy the `cats.txt` file from `/home/bob/.etc/h/e/r/` to `/opt`.

* Find files by name and save result to file
   `sudo find /var/ -name pets > /home/bob/pets.txt`
   * Search for files named `pets` in `/var/` and save the result to `/home/bob/pets.txt`.

* Find files with world-readable, writable, and executable permissions
   `sudo find /var -type f -perm 0777 -print`
   * Search for files in `/var/` with permission `0777` (read, write, and execute for everyone).

* Find files with specific permissions and save to file
   `sudo find /usr/ -type f -perm 0640 > /home/bob/.opt/permissions.txt`
   * Search for files in `/usr/` with the permission code `0640` and save the result to `/home/bob/.opt/permissions.txt`.

* Count files modified in the last 120 minutes
   `sudo find /usr -type f -mmin -120 | wc -l`
   * Find the number of files modified in the last 120 minutes in `/usr/`.

* Find files larger than 20M in size
   `sudo find /var -type f -size 20M`
   * Search for files in `/var/` that are exactly 20MB in size.

* Find files in a specific size range and save result to file
   `sudo find /usr -type f -size +5M -size -10M > /home/bob/size.txt`
   * Search for files in `/usr/` between 5MB and 10MB in size and save the result to `/home/bob/size.txt`.

* Change permissions on a directory
   `sudo chmod 0100 /home/bob/LFCS`
   * Change permissions on `/home/bob/LFCS` to `0100` (owner can execute only).

* Set directory permissions (rwxr-xr-x)
   `chmod 0755 new_dir/`
   * Set permissions on `new_dir/` to `rwxr-xr-x`.


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

* Replace 'enabled' with 'disabled'
   `sed -i 's/enabled/disabled/g' /home/bob/values.conf`
   * Replace all occurrences of 'enabled' with 'disabled' in `/home/bob/values.conf`.

* Replace 'disabled' with 'enabled' (case-insensitive)
   `sed -i 's/disabled/enabled/gI' /home/bob/values.conf`
   * Replace 'disabled' with 'enabled', ignoring case, in `/home/bob/values.conf`.

* Extract lines 500 to 2000
   `awk 'NR>=500 && NR<=2000' /home/bob/values.conf`
   * Extract lines 500 through 2000 from `/home/bob/values.conf`.

* Replace 'enabled' with 'disabled' in lines 500 to 2000
   `awk 'NR>=500 && NR<=2000' /home/bob/values.conf | sed -i 's/enabled/disabled/g' /home/bob/values.conf`
   * Search lines 500 to 2000 and replace 'enabled' with 'disabled'.

* Replace a complex string
   `sed -i 's@#%$2jh//238720//31223@$2//23872031223@g' /home/bob/data.txt`
   * Replace a complex string pattern in `/home/bob/data.txt`.

* Filter capitalized words with 2 or more lowercase letters
   `egrep -o '\b[A-Z][a-z]{2,}\b' /etc/nsswitch.conf > /home/bob/filtered1`
   * Extract words starting with a capital letter and followed by at least 2 lowercase letters from `/etc/nsswitch.conf`.

* Vim commands: view, copy, cut, paste, save
   `vi -> :set number, :1049, y, d, :5, P, :wq`
   * Enable line numbers, copy from line 1049, cut, paste at line 5, and save.

* Delete first 1000 lines in Vim
   `:1,1000d`
   * Delete the first 1000 lines in Vim.

* Compare two files and append the result
   `diff /home/bob/file1 /home/bob/file2 >> /home/bob/file3`
   * Compare `/home/bob/file1` with `/home/bob/file2` and append differences to `/home/bob/file3`.

* Search for 5-digit numbers
   `egrep '[0-9]{5}' textfile > /home/bob/number`
   * Search for 5-digit numbers in `textfile` and save the results to `/home/bob/number`.

* Count lines starting with the digit 2
   `egrep '^2[0-9]*' /home/bob/textfile | wc -l > /home/bob/count`
   * Count lines starting with '2' in `/home/bob/textfile`.

* Count lines starting with "Section" (case-insensitive)
   `egrep -i ^Section /home/bob/testfile | wc -l > /home/bob/count_lines`
   * Count lines starting with "Section", ignoring case, in `/home/bob/testfile`.

* Search for the word "man" and save results
   `grep -w man testfile > /home/bob/man_filtered`
   * Search for the exact word 'man' in `testfile` and save to `/home/bob/man_filtered`.

* Extract the last 500 lines
   `tail -500 /home/bob/textfile > /home/bob/last`
   * Save the last 500 lines of `/home/bob/textfile` to `/home/bob/last`.

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
