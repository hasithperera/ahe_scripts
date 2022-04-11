## Web monitoring

### CEB monitoring script

- This will monitor a custom jason format from [ceb.lk](https://cebcare.ceb.lk/GenSum/GetEnergyData)
- make a file `touch ceb.sha` for installation in the home directory
- install `sudo apt install mosquitto-clients`
- **NOTE**: ahep.ddns.net has mqtt running on public **3883**. If using some other server change `ceb.sh`
- add to the crontab -e as

```
30 */2 * * * bash <file location>/ceb.sh >> ~/.ceb_log #ceb logging

```
