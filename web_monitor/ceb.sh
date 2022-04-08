data=$(curl -s https://cebcare.ceb.lk/GenSum/GetEnergyData)
new_sha=$(echo $data | sha256sum| cut -d " " -f 1) 
if [ "$new_sha" == "$(cat ceb.sha)" ]; then
        exit
else

        echo "$(date -u ) updates"
        echo "$new_sha" > ceb.sha
fi


dt=$(echo $data | sed 's/,/\n/g' | grep "DateTime" | head -n 1 | sed 's/\\//g')
labels=$(echo $data|sed 's/,/\n/g' | grep "DisplayName"  | sed 's/\\//g' | cut -d ":" -f 2 | sed 's/ /_/g')
data=$(echo $data|sed 's/,/\n/g' | grep "EnergyGWh" | sed 's/:/\n/g' | grep "[0-9]")

num=1
json="{"
for lbl in $labels;
do
        val_i=$(echo $data | sed 's/ /\n/g' | head -n $num|tail -n 1)
        json="$json$lbl:$val_i,"
        ((num=num+1))
done
json="$json}"

mosquitto_pub -h ahep.ddns.net -p 3883 -t '/ahe/ceb' -m "$json"
