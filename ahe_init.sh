#! /bin/bash

# add git brach and alices 
cp .bash_aliases ~/
cat .ahe_bashrc >> ~/.bashrc
chmod 755 ~/.bash_aliases

#install festival and xsel
apt update
apt install festival xsel vim -y


#custom key binds for tab switching
dconf load / < ./key_binds.conf
mkdir ~/in
mkdir ~/Projects

# copy vimrc for the current user
cp .vimrc ~/.vimrc

# add battery logging script to crontab

loc=$(pwd)
(crontab - u $(whoami) -l; echo "@reboot $loc/batlog.sh #ahe" ) | crontab -u $(whoami) -


#Add customizations for thinkpads

lap_model=$(sudo lshw | grep "ThinkPad"|wc -l)

if [[ $lap_model -gt 0 ]];
then
	echo "Add think pad battery controls"
	echo 40 | sudo tee /sys/class/power_supply/BAT1/charge_start_threshold
	echo 80 | sudo tee /sys/class/power_supply/BAT1/charge_stop_threshold
else
	echo "Not a Thinkpad"
fi


sudo mkdir /opt/data_log/
sudo chown $(whoami) /opt/data_log

black='\e[0;30m'
white='\e[0;37m'
yellow='\e[0;33m'
echo -e "${yellow} "; crontab -l
echo -e "${white}"

## configure GIT global settings 
git config --global user.name "Hasith Perera"
git config --global user.email "12579141+hasithperera@users.noreply.github.com"



echo "End of script"
