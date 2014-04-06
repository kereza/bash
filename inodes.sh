#! /bin/bash

"
A simple script which check the inodes usage for each account on a cPanel based server
"

ls -A1 /home > /home/allinodes.txt
for i in `gawk -F\/ '{print $1}' /home/accounts.txt | grep -v backup | grep -v cpeasyapache | grep -v cpmove | grep -v .cp | grep -v error | grep -v lost | grep -v .txt | grep -v MySQL | grep -v virtfs | grep -v 0_ | grep -v latest | grep -v installd`
do
	cd /home/$i
	var1=`find . | wc -l`
	if [ $var1 -gt 25000 ]
	then
		echo -n $var1 >> /home/inodes.txt
		echo " $i" >> /home/inodes.txt
	fi
done

cat /home/inodes.txt | sort > /home/finalinodes.txt

mail -s "inodes" kereza85@gmail.com < /home/finalinodes.txt

rm -rf /home/allinodes.txt /home/inodes.txt /home/finalinodes.txt
