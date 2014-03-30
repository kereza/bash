#! /bin/bash

"
This is a simple function which cleans the log tables from a Magento databases which quite often takes a lot of space, without really needed.
For the easiet use it is best to copy the content of the file and place it at the bottom of /etc/bashrc. After that simply relog in a new console
and type
mageto database_name
"
function magento ()
{
        echo "DB is $1"
		cd /var/lib/mysql/$1
		find | grep log_visitor_info.ibd > test.txt
		gawk -F\/ '{print $2}' test.txt > test2.txt
		var1=`gawk -F. '{print $1}' test2.txt`
		
		mysql $1 -e "TRUNCATE TABLE $var1"
        mysql $1 -e "OPTIMIZE TABLE $var1"
		
		find | grep log_url_info.ibd > test3.txt
		gawk -F\/ '{print $2}' test3.txt > test4.txt
		var2=`gawk -F. '{print $1}' test4.txt`
		
		mysql $1 -e "TRUNCATE TABLE $var2"
        mysql $1 -e "OPTIMIZE TABLE $var2"
		
		find | grep log_visitor.ibd > test5.txt
		gawk -F\/ '{print $2}' test5.txt > test6.txt
		var3=`gawk -F. '{print $1}' test6.txt`
		
		mysql $1 -e "TRUNCATE TABLE $var3"
        mysql $1 -e "OPTIMIZE TABLE $var3"
		
		find | grep log_url.ibd > test7.txt
		gawk -F\/ '{print $2}' test5.txt > test8.txt
		var4=`gawk -F. '{print $1}' test8.txt`
		
		mysql $1 -e "TRUNCATE TABLE $var4"
        mysql $1 -e "OPTIMIZE TABLE $var4"
		
		rm -rf *.txt
}
