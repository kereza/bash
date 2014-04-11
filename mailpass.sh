#! /bin/bash


"
Changing the passwords on all email accounts on a cPanel based server
"


genpasswd() {

        tr -dc A-Za-z0-9_ < /dev/urandom | head -c 12 | xargs

}

cat /dev/null > /root/mailaccounts.txt

CP_ACCOUNTS=`ls -1A /var/cpanel/users/`

for CP_USER in `echo -n $CP_ACCOUNTS`

do

    USER_DOMAIN=`grep -i ^dns /var/cpanel/users/$CP_USER |cut -d= -f2`

    for DOMAIN in `echo -n "$USER_DOMAIN"`

    do

        SHADOW_FILE="/home/$CP_USER/etc/$DOMAIN/shadow"

        if [ -f $SHADOW_FILE ] && [ -s $SHADOW_FILE ]

        then

            cat /dev/null > "/home/$CP_USER/etc/$DOMAIN/shadow.tmp"

            for shadow in `cat $SHADOW_FILE`

            do

                NEW_PASS=$(genpasswd)

                MD5_PASS=$(openssl passwd -1 $NEW_PASS)

                user=$(echo $shadow | cut -d":" -f1)

                rest=$(echo $shadow | cut -d":" -f3-)

                echo -e "$NEW_PASS\t$user@$DOMAIN" >> "/root/mailaccounts.txt"

                echo "$user:$MD5_PASS:$rest" >> "/home/$CP_USER/etc/$DOMAIN/shadow.tmp"

               

            done

            mv "/home/$CP_USER/etc/$DOMAIN/shadow" "/home/$CP_USER/etc/$DOMAIN/shadow.$(date +%s)"

            mv "/home/$CP_USER/etc/$DOMAIN/shadow.tmp" "/home/$CP_USER/etc/$DOMAIN/shadow"

            chmod 640 "/home/$CP_USER/etc/$DOMAIN/shadow"

            chown $CP_USER:$CP_USER "/home/$CP_USER/etc/$DOMAIN/shadow"        

        fi

    done

done
