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

* Create Directory:
   `mkdir /home/bob/lfcs`
   * Create a new directory `/home/bob/lfcs`.

* Create an Empty File:
   `touch /home/bob/lfcs/lfcs.txt`
   * Create an empty file `lfcs.txt` in the `/home/bob/lfcs` directory.

* Copy Directory Recursively:
   `cp -r /tmp/Invoice/ /home/bob/`
   * Copy the entire `/tmp/Invoice` directory recursively to `/home/bob/`.

* Copy File with Attributes:
   `cp -p /home/bob/myfile.txt /home/bob/data/`
   * Copy `myfile.txt` to the `/home/bob/data/` directory, preserving file attributes (like ownership, timestamps, etc.).

* Move Files:
   `mv /home/bob/lfcs/* /home/bob/new-data/`
   * Move all files from the `/home/bob/lfcs/` directory to `/home/bob/new-data/`.

* Create Soft Link:
   `ln -s /tmp /home/bob/link_to_tmp`
   * Create a symbolic (soft) link from `/tmp` to `/home/bob/link_to_tmp`.

* Create Hard Link:
   `ln /tmp/hlink /home/bob/hlink`
   * Create a hard link for the `/tmp/hlink` file in `/home/bob/`.

* Rename File:
   `mv /home/bob/new_file /home/bob/old_file`
   * Rename `new_file` to `old_file` in the `/home/bob/` directory.

* Create Nested Directories:
   `mkdir -p /tmp/1/2/3/4/5/6/7/8/9`
   * Create nested directories up to `/tmp/1/2/3/4/5/6/7/8/9` in a single command.

* List Files with Full Time:
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

* Find files modified in the last 5 minutes:
   `find /dev/ -mmin -5`
   * Search for files in `/dev/` directory modified in the last 5 minutes.

* Remove group write permission:
   `chmod g-w somefile`
   * Remove write permission for the group from the `somefile`.

* Find files with group write permission but not world read/write
   `sudo find /var/log/ -perm -g=w ! -perm /o=rw > /home/bob/data.txt`
   * Search for files in `/var/log/` with group write permission but without world read/write permission, and save the output to `/home/bob/data.txt`.

* Find files with specific permission code:
   `find /home/bob/ -perm 402 > /home/bob/secfile.txt`
   * Search for files in `/home/bob/` with the permission code `402` and save the output to `/home/bob/secfile.txt`.

* Set special permissions on a directory
   `chmod u+s,g+s,o+t /home/bob/datadir/`
   * Set the SUID, SGID, and sticky bit on the directory `/home/bob/datadir/`.

* Find file by name and redirect result to file:
   `sudo find /usr/share/ | grep dogs.txt > /home/bob/dogs`
   * Search for `dogs.txt` in `/usr/share/` and save the result to `/home/bob/dogs`.

* Find file by name:
   `find /home/bob/ -name cats.txt`
   * Search for a file named `cats.txt` in `/home/bob/`.

* Copy file to another location:
   `sudo cp /home/bob/.etc/h/e/r/cats.txt /opt`
   * Copy the `cats.txt` file from `/home/bob/.etc/h/e/r/` to `/opt`.

* Find files by name and save result to file:
   `sudo find /var/ -name pets > /home/bob/pets.txt`
   * Search for files named `pets` in `/var/` and save the result to `/home/bob/pets.txt`.

* Find files with world-readable, writable, and executable permissions:
   `sudo find /var -type f -perm 0777 -print`
   * Search for files in `/var/` with permission `0777` (read, write, and execute for everyone).

* Find files with specific permissions and save to file:
   `sudo find /usr/ -type f -perm 0640 > /home/bob/.opt/permissions.txt`
   * Search for files in `/usr/` with the permission code `0640` and save the result to `/home/bob/.opt/permissions.txt`.

* Count files modified in the last 120 minutes:
   `sudo find /usr -type f -mmin -120 | wc -l`
   * Find the number of files modified in the last 120 minutes in `/usr/`.

* Find files larger than 20M in size:
   `sudo find /var -type f -size 20M`
   * Search for files in `/var/` that are exactly 20MB in size.

* Find files in a specific size range and save result to file:
   `sudo find /usr -type f -size +5M -size -10M > /home/bob/size.txt`
   * Search for files in `/usr/` between 5MB and 10MB in size and save the result to `/home/bob/size.txt`.

* Change permissions on a directory:
   `sudo chmod 0100 /home/bob/LFCS`
   * Change permissions on `/home/bob/LFCS` to `0100` (owner can execute only).

* Set directory permissions (rwxr-xr-x):
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

* Replace 'enabled' with 'disabled':
   `sed -i 's/enabled/disabled/g' /home/bob/values.conf`
   * Replace all occurrences of 'enabled' with 'disabled' in `/home/bob/values.conf`.

* Replace 'disabled' with 'enabled' (case-insensitive):
   `sed -i 's/disabled/enabled/gI' /home/bob/values.conf`
   * Replace 'disabled' with 'enabled', ignoring case, in `/home/bob/values.conf`.

* Extract lines 500 to 2000:
   `awk 'NR>=500 && NR<=2000' /home/bob/values.conf`
   * Extract lines 500 through 2000 from `/home/bob/values.conf`.

* Replace 'enabled' with 'disabled' in lines 500 to 2000:
   `awk 'NR>=500 && NR<=2000' /home/bob/values.conf | sed -i 's/enabled/disabled/g' /home/bob/values.conf`
   * Search lines 500 to 2000 and replace 'enabled' with 'disabled'.

* Replace a complex string:
   `sed -i 's@#%$2jh//238720//31223@$2//23872031223@g' /home/bob/data.txt`
   * Replace a complex string pattern in `/home/bob/data.txt`.

* Filter capitalized words with 2 or more lowercase letters:
   `egrep -o '\b[A-Z][a-z]{2,}\b' /etc/nsswitch.conf > /home/bob/filtered1`
   * Extract words starting with a capital letter and followed by at least 2 lowercase letters from `/etc/nsswitch.conf`.

* Vim commands: view, copy, cut, paste, save:
   `vi -> :set number, :1049, y, d, :5, P, :wq`
   * Enable line numbers, copy from line 1049, cut, paste at line 5, and save.

* Delete first 1000 lines in Vim:
   `:1,1000d`
   * Delete the first 1000 lines in Vim.

* Compare two files and append the result:
   `diff /home/bob/file1 /home/bob/file2 >> /home/bob/file3`
   * Compare `/home/bob/file1` with `/home/bob/file2` and append differences to `/home/bob/file3`.

* Search for 5-digit numbers:
   `egrep '[0-9]{5}' textfile > /home/bob/number`
   * Search for 5-digit numbers in `textfile` and save the results to `/home/bob/number`.

* Count lines starting with the digit 2:
   `egrep '^2[0-9]*' /home/bob/textfile | wc -l > /home/bob/count`
   * Count lines starting with '2' in `/home/bob/textfile`.

* Count lines starting with "Section" (case-insensitive):
   `egrep -i ^Section /home/bob/testfile | wc -l > /home/bob/count_lines`
   * Count lines starting with "Section", ignoring case, in `/home/bob/testfile`.

* Search for the word "man" and save results:
   `grep -w man testfile > /home/bob/man_filtered`
   * Search for the exact word 'man' in `testfile` and save to `/home/bob/man_filtered`.

* Extract the last 500 lines:
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

* View the `tar` manual:
   `man tar`
   * Access the manual page for the `tar` command.

* Create a tar archive:
   `tar -cvf project.tar project`
   * Archive the `project` directory into `project.tar`.

* Change to the `/home/bob` directory:
   `cd /home/bob`
   * Navigate to the `/home/bob` directory.

* Create a tar archive with absolute paths:
   `sudo tar cfP logs.tar /var/log/`
   * Archive the `/var/log/` directory with absolute paths to `logs.tar`.

* Create a compressed tar.gz archive:
   `tar -zcvf project.tar.gz project`
   * Archive and compress the `project` directory into `project.tar.gz`.

* Create a compressed tar.gz archive with absolute paths:
   `sudo tar czfP logs.tar.gz /var/log/`
   * Archive and compress `/var/log/` with absolute paths to `logs.tar.gz`.

* Save a tar archive as plain text:
   `cat /home/bob/logs.tar > /home/bob/tar_data.txt`
   * Write the contents of `logs.tar` to `tar_data.txt`.

* List contents of a tar archive:
   `tar tfP /home/bob/logs.tar > /home/bob/tar_data.txt`
   * List contents of `logs.tar` and save them to `tar_data.txt`.

* View tar help options:
   `tar --help`
   * Display help information for the `tar` command.

* Extract an archive to a specific directory:
   `tar --extract --file /home/bob/archive.tar.gz --directory /tmp/`
   * Extract `archive.tar.gz` into the `/tmp/` directory.

* Extract a tar archive (alternative syntax):
   `tar xf /home/bob/archive.tar.gz -C /tmp`
   * Extract `archive.tar.gz` into `/tmp` using shorter syntax.

* Run a script and save stdout output:
   `bash /home/bob/script.sh >&1 | tee /home/bob/output_stdout.txt`
   * Execute `script.sh` and save the standard output to `output_stdout.txt`.

* Redirect output of a script to a file:
   `sudo ./script.sh > /home/bob/output_stdout.txt`
   * Run `script.sh` and redirect its output to `output_stdout.txt`.

* Save both stdout and stderr to the same file:
   `bash /home/bob/script.sh 2>&1 | tee /home/bob/output.txt`
   * Run `script.sh` and save both stdout and stderr to `output.txt`.

* Redirect stdout and stderr (alternative syntax):
   `sudo ./script.sh > /home/bob/output.txt 2>&1`
   * Run `script.sh`, redirecting both stdout and stderr to `output.txt`.

* Redirect only stderr to a file:
   `sudo ./script.sh 2> /home/bob/output_errors.txt`
   * Run `script.sh` and save only stderr to `output_errors.txt`.

* View the `bzip2` manual:
   `man bzip2`
   * Access the manual page for the `bzip2` command.

* Compress a file but keep the original:
   `bzip2 --keep /home/bob/file.txt`
   * Compress `file.txt` with `bzip2` while keeping the original file.

* Extract a tar.gz archive to a directory:
   `sudo tar xf /home/bob/archive.tar.gz -C /opt`
   * Extract `archive.tar.gz` to `/opt`.

* Append contents of one file to another:
   `cat /home/bob/file.txt >> /home/bob/destination.txt`
   * Append the contents of `file.txt` to `destination.txt`.

* Archive a file:
   `tar --create --file file.tar file`
   * Create a tar archive `file.tar` from `file`.

* View gzip help options:
   `gzip --help`
   * Display help information for the `gzip` command.

* Compress a file with gzip:
   `gzip games.txt`
   * Compress `games.txt` using gzip.

* View unxz help options:
   `unxz --help`
   * Display help information for the `unxz` command.

* Decompress an xz file:
   `unxz lfcs.txt.xz`
   * Decompress `lfcs.txt.xz` to `lfcs.txt`.

* View sort help options:
   `sort --help`
   * Display help information for the `sort` command.

* Sort and remove duplicates from a file:
   `sort -du /home/bob/values.conf > /home/bob/values.sort`
   * Sort `values.conf` and remove duplicates, saving the output to `values.sort`.

* Sort case-insensitively and remove duplicates:
   `sort -duf /home/bob/values.conf > /home/bob/values.sorted`
   * Sort `values.conf` case-insensitively, remove duplicates, and save to `values.sorted`.


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

* Generate a new private key and CSR:
   `openssl req -newkey rsa:4096 -keyout priv.key -out cert.csr`
   * Create a new RSA 4096-bit private key and generate a certificate signing request (CSR). Enter a password and default options as prompted.

* Generate a self-signed certificate (option 1):
   `openssl req -x509 -noenc -days 365 -keyout priv.key -out kodekloud.crt`
   * Create a self-signed certificate (`kodekloud.crt`) valid for 365 days using the private key (`priv.key`).

* Generate a self-signed certificate (option 2):
   `openssl req -newkey rsa:4096 -x509 -days 365 -nodes -keyout priv.key -out kodekloud.crt`
   * Create a new RSA 4096-bit key and self-signed certificate valid for 365 days, without encryption on the private key.

* View certificate subject:
   `openssl x509 -noout -subject -in my.crt`
   * Display the subject information of `my.crt` without showing other details.

* Delete a Git branch:
   `git branch --delete testing`
   * Delete the local Git branch named `testing`.

* View Git commit logs with raw diff:
   `git log --raw`
   * Display the commit history with changes in raw format.

* Merge a branch into the current branch:
   `git merge documentation`
   * Merge the `documentation` branch into the current branch.

