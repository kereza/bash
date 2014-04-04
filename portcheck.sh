#! /bin/bash

"
A simple function which lists the IP's conntected to a specific port. Simple paste it in /etc/bashrc and type in your shell
portchk 80. 
"

function portchk ()

{

netstat -tn 2>/dev/null | grep :$1 | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n

}
