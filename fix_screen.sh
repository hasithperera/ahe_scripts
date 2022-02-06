name_cnt=$(hostname | grep "Thinkp"|wc -m)
one=1

if [ $name_cnt -gt $one ];
then
	echo "Correct screen tearing in a thinkpad"
	sudo mkdir -p /etc/X11/xorg.conf.d
	cp ./20-intel.conf /etc/X11/xorg.conf.d

fi
