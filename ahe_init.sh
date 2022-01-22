#! /bin/bash

# add git brach and alices 
cp .bash_aliases ~/
cat .ahe_bashrc >> ~/.bashrc


# add battery logging script to crontab

loc=$(pwd)
(crontab -u $(whoami) -l; echo "@reboot $loc/batlog.sh #ahe" ) | crontab -u $(whoami) -

sudo mkdir /opt/data_log/

black='\e[0;30m'
white='\e[0;37m'
yellow='\e[0;33m'


echo -e "${yellow} "; crontab -l
echo -e "${white}"
echo "End of script"
