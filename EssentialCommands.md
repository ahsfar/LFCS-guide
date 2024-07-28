# EssentialCommands.md
20% of Exam

- Basic Git Operations
- Create, configure, and troubleshoot services
- Monitor and troubleshoot system performance and services
- Determine application and service specific constraints
- Troubleshoot diskspace issues
- Work with SSL certificates

<details><summary>show</summary>
<p>
  
```bash


```

</p>
</details>

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

<details><summary>show</summary>
<p>
  
```bash


```

</p>
</details>



<details><summary>show</summary>
<p>
  
```bash


```

</p>
</details>

