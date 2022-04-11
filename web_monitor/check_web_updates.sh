line=$(cat links.txt)

#remove old update results
rm -fr new.vals

num=1
for i in $line
do
	#echo $num
	lnk=$(head links.txt -n $num|cut -d ',' -f 1 | tail -n 1)
	lnk_lim=$(head links.txt -n $num|cut -d ',' -f 2 | tail -n 1)
	lnk_tail=$(head links.txt -n $num|cut -d ',' -f 3 | tail -n 1)	
	#echo "$num: $lnk :: $lnk_lim"
	
	if [[ $lnk_lim -gt 0 ]];
	then
		if [[ $lnk_tail -gt 0 ]];
		then
			echo "h-t"
			curl -s $lnk| head -n $lnk_lim|tail -n $lnk_tail | sha256sum | cut -d ' ' -f 1 >> new.vals
		else
			echo "h"
			curl -s $lnk| head -n $lnk_lim | sha256sum | cut -d ' ' -f 1 >> new.vals
		#curl -s $lnk
		fi
	else
		echo "a"
		curl -s $lnk| sha256sum | cut -d ' ' -f 1 >> new.vals
	
	fi
	((num=num+1))
done

#get the lines with updates

updated_lines=$(diff old.vals new.vals --unchanged-line-format="" --new-line-format="%dn:" --old-line-format="" | sed 's/:/\n/g')
dt=$(date -u)
for l in $updated_lines;
do	
	#process links with differences

	##
	link=$(cut links.txt -d "," -f 1 | head -n $l|tail -n 1)
	echo "$dt $link"
	bash /opt/ahe_scripts/web_monitor/email.sh $link
done

#update checksums
mv new.vals old.vals
