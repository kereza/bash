#!/bin/bash
 if [ "$1" == "root" ]
   then
 echo " ";
 echo -e "\033Cannot kill root queries.";
 echo -e "\033If you really need to do it, proced manually. Use mysqladmin kill queryID";
  elif  [ "$1" == "" ]
   then
 echo -e "\033Usage is mqkill cpauser or mqkill cpuser_db"
 echo -e "\033Try again with an argument this time"
   else
 for i in `mysqladmin processlist |grep $1 | awk {'print $2'}`; do `mysqladmin kill $i`; done

  echo -e "\033All queries for $1 are dead.";
fi
