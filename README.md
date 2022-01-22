# My Scripts for linux

Change permission of the `/opt` folder to allow access to all users
and run the `ahe_init.sh` to apply the changes to the current user

	sudo chmod 777 /opt
	./ahe_init.sh


## batlog.sh Battery logging 

This script finds the energy capacity and logs to a local file with the unix time. 

## ahe_init.sh

1. copy mods to .bashrc
2. add aliases file
3. add batlog to crontab file to be run at restart 

## TODO

- [x] local battery capacily logging
- [x] bash_rc scripts with git configs
- [x] init script to deploy 
- [ ] mqtt publisher script
- [ ] auto add shortcuts 
