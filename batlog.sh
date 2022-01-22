#! /bin/bash

echo "Battery logging"
bat_file=$(upower -e | grep battery)
cap=$(upower -i $bat_file | grep "energy-full:"| sed 's/ //g'| cut -b 13-)
echo $(date +%s%3N),$cap >> /opt/data_log/battery.log

