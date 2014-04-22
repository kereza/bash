#monitoring tool
#! /bin/bash
echo -n `hostname`
echo -n " "
echo -n `cat /proc/loadavg | gawk -F" " '{print $1}'`
echo -n " "
if [ `ps auxf | grep named | grep -v grep | head -n1 |  gawk -F" " '{print $1}'` ]; then echo -n "named.pid"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep httpd | head -n 2 | grep -v grep | head -n1 | gawk -F" " '{print $1}'` ]; then echo -n "httpd.pid"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep mysql | grep mysqld_safe | grep bin | head -n1 | gawk -F" " '{print $1}'` ]; then echo -n "root"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep /usr/sbin/exim | grep mailnull | head -n 1 | gawk -F" " '{print $1}'` ]; then echo -n "mailnull"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep imap | head -n2 | grep -v grep | grep dovenull | head -n1 | gawk -F" " '{print $1}'` ]; then echo -n "master.pid"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep crond | grep -v grep | grep root | head -n1 | gawk -F" " '{print $1}'` ]; then echo -n "crond.pid"; else echo -n "no"; fi;
echo -n " "
if [ `ps auxf | grep pure-ftpd | grep SERVER | grep root | head -n1 | gawk -F" " '{print $1}'` ]; then echo -n "root"; else echo -n "no"; fi;
echo -n " "
echo -n `df -h | grep home | gawk -F" " '{print $5}'`
echo -n " "
echo -n `df -h | grep backup | gawk -F" " '{print $5}'`
echo -n " "

#monitoring TCP/IP server script
#!/bin/zsh
# zsh TCP server script
zmodload zsh/net/tcp
ztcp -l 5150 -t
fd=$REPLY
echo "Waiting for a client..."
while [ 1 ]
do
ztcp -a $fd -t 30
clientfd=$REPLY
echo "client connected" &> /dev/null
/usr/local/sbin/monitor >& $clientfd
ztcp -c $clientfd
done

#monitoring TCP/IP client script
#!/bin/zsh
# zsh TCP server script
zmodload zsh/net/tcp
##node01.tmddedicated210.com 
if [ `nc -z -w3 69.175.105.170 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.105.170 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting110.eu 
if [ `nc -z -w3 198.20.103.90 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 198.20.103.90 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting115.com 
if [ `nc -z -w3 184.154.152.74 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 184.154.152.74 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting116.com
if [ `nc -z -w3 96.127.146.10 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 96.127.146.10 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting117.com
if [ `nc -z -w3 69.175.97.146 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.97.146 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting118.com 
if [ `nc -z -w3 173.236.19.82 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 173.236.19.82 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting210.com
if [ `nc -z -w3 69.175.41.2 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.41.2 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting310.com 69.175.41.51
if [ `nc -z -w3 69.175.41.51 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.41.51 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting410.com 
if [ `nc -z -w3 69.175.41.102 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.41.102 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting510.com 
if [ `nc -z -w3 69.175.41.153 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.41.153 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting610.com 
if [ `nc -z -w3 69.175.41.204 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.41.204 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting710.com 
if [ `nc -z -w3 69.175.69.250 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.69.250 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting810.com 
if [ `nc -z -w3 69.175.60.114 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.60.114 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting910.com 
if [ `nc -z -w3 69.175.84.194 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 184.154.152.98 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting920.com 
if [ `nc -z -w3 69.175.107.130 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 69.175.107.130 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting930.com 
if [ `nc -z -w3 173.236.33.170 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 173.236.33.170 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting940.com 
if [ `nc -z -w3 184.154.49.74 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 184.154.49.74 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting950.com 
if [ `nc -z -w3 184.154.167.98 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 184.154.167.98 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting960.com 
if [ `nc -z -w3 96.127.149.146 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 96.127.149.146 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
#node01.tmdhosting970.com
if [ `nc -z -w3 184.154.152.98 5150 | gawk -F" " '{print $1}'` = "Connection" 2> /dev/null ]
then
ztcp -t 184.154.152.98 5150
hostfd=$REPLY
read line <& $hostfd
echo $line
ztcp -c $hostfd
else
echo "no no no no no no no no no no no"
fi
