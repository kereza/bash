#! /bin/bash

"
This is a simple function which create a random database and assign random user with full privileges with random password.
The script is for a cPanel based server. It is a lot easier to run the function than to create databases from within cPanel

"

function newdb ()
{
	
			
	end=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)
	pass=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
	db=$1\_$end
	mysql -e "create database $db; GRANT ALL PRIVILEGES ON $db.* TO $db@localhost IDENTIFIED BY '$pass';FLUSH PRIVILEGES;"
	/usr/local/cpanel/bin/dbmaptool  $1 --type mysql --dbusers "$db" --dbs "$db"
			
	echo "------------------------------------------"
	echo " Database has been created successfully "
	echo "------------------------------------------"
	echo " DB Info: "
	echo ""
	echo " DB Name: $db"
	echo " DB User: $db"
	echo " DB Pass: $pass"
	echo ""
	echo "------------------------------------------"
			
}
