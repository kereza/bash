#! /bin/bash

"
A simple script which check the size of databases and home folders and if there are accunt over 5GB and databases over 300MB - lists
them and send an email.
"

ls -A1 /home > /home/accounts.txt
for i in `gawk -F\/ '{print $1}' /home/accounts.txt | grep -v backup | grep -v cpeasyapache | grep -v cpmove | grep -v .cp | grep -v error | grep -v lost | grep -v .txt | grep -v MySQL | grep -v virtfs | grep -v 0_ | grep -v latest | grep -v installd`
do

	size=`du -s /home/$i` 
	echo $size >  /home/size.txt
	var1=`gawk -F\/ '{print $1}' /home/size.txt`
	if [ $var1 -gt 5120000 ]
	then
		echo $size >>  /home/last.txt
	fi
done

ls -A1 /var/lib/mysql/ > /var/lib/mysql/databases.txt
for b in `gawk -F\/ '{print $1}' /var/lib/mysql/databases.txt | grep -v .pid | grep -v .err | grep -v .txt | grep -v mysql | grep -v leech`
do
	size2=`du -s /var/lib/mysql/$b`
	echo $size2 >  /var/lib/mysql/size2.txt
	var2=`gawk -F\/ '{print $1}' /var/lib/mysql/size2.txt`
	if [ $var2 -gt 307200 ]
	then
		echo $size2 >>  /var/lib/mysql/last.txt
	fi
done

mail -s "large databases" kereza85@gmail.com < /var/lib/mysql/last.txt
mail -s "large accounts" kereza85@gmail.com < /home/last.txt

rm -rf /home/last.txt /home/accounts.txt /home/size.txt /var/lib/mysql/databases.txt /var/lib/mysql/size2.txt /var/lib/mysql/last.txt
