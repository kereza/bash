#! /bin/bash

" 
A simple script for backing up all the /home folders and all the databases on a cPanel based server 
if the size of the folders and databases is not too big)
The script can be optimized further, but it works quite good even now!
"
# Assigning the current date to a variable
today=`date +%y%m%d`     

# Checking if the backup folders already exist
if [ -e /backups/backup_$today ]                  
then
	break
else
	mkdir /backups/backup_$today
fi

if [ -e /backups/mysqlbackup_$today ]
then
	break
else
	mkdir /backups/mysqlbackup_$today
fi

# Listing all the account in the home folder in the file accounts.txt
ls -A1 /home > /home/accounts.txt

# iterating through all of the account from the accounts.txt while skipping the slahs "/" and skipping other unnecessary files  and folder 
for i in `gawk -F\/ '{print $1}' /home/accounts.txt | grep -v backup | grep -v cpeasyapache | grep -v cpmove | grep -v .cp | grep -v error | grep -v lost | grep -v .txt | grep -v MySQL | grep -v virtfs | grep -v 0_ | grep -v latest | grep -v installd`

do
		#For each user list all his databases
		ls -A1 /var/lib/mysql/  | grep $i > /var/lib/mysql/dbuser.txt
		for b in `gawk -F\/ '{print $1}' /var/lib/mysql/dbuser.txt | grep -v .pid | grep -v .err | grep -v .txt | grep -v mysql | grep -v leech`
		do
				du -s /var/lib/mysql/$b > /var/lib/mysql/dbsize.txt
				var3=`gawk '{print $1}' /var/lib/mysql/dbsize.txt`
				#Check if the database size is above 250MB. If it is not create backup, if it is than do not create backup and list the larger databases
				if [ $var3 -lt 256000 ]
				then		#create a backup of the databases with CPU watch and ionice so the server does not get overloaded if busy
						/usr/local/cpanel/bin/cpuwatch 10 ionice -c2 -n7 mysqldump $b > /backups/mysqlbackup_$today/$b.sql
				else
						echo $b >> /home/largedb.txt
				fi
		done		
		
		#For each user list his home folder
        du -s /home/$i/public_html > /home/$i/public_html/size.txt
        var1=`gawk '{print $1}' /home/$i/public_html/size.txt`
				#Check if the home folder size is above 1.5Gb. If it is not create backup, if it is than do not create backup and list the larger account
                if [ $var1 -lt 1552928 ]
                then	#archive the home folder with CPU watch and ionice so the server does not get overloaded if busy
                        /usr/local/cpanel/bin/cpuwatch 10 ionice -c2 -n7 tar -czPf /home/$i/backup_$i.tar /home/$i/public_html
                        mv /home/$i/backup_$i.tar /backups/backup_$today
				else	
						echo $i >> /home/largeacc.txt
                fi
done

#send me an email with the large databases and account list which were NOT backed up.
mail -s "large databases" kereza85@gmail.com < /home/largedb.txt
mail -s "large accounts" kereza85@gmail.com < /home/largeacc.txt

#Delete temporary files 
rm -rf /home/accounts.txt /var/lib/mysql/dbuser.txt /var/lib/mysql/dbsize.txt /home/largedb.txt /home/largeacc.txt
