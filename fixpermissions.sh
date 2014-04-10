#! /bin/bash


for i in `ls -A1 /home | gawk -F\/ '{print $1}' | grep -v backup | grep -v cpeasyapache | grep -v cpmove | grep -v .cp | grep -v error | grep -v lost | grep -v .txt | grep -v MySQL | grep -v virtfs | grep -v 0_`
do
	chmod 711 /home/$in
	chmod 750 /home/$i/public_html
	chown $i:nobody /home/$i/public_html
done
