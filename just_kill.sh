## This script will ONLY disable repeated network
## You need to reboot device when You will be in covered area again

#!/bin/sh
sleep 10
stas=""
stas=$(uci show wireless | grep "mode=sta" | grep -o \[0-9])
sleep 5

kill_stas ()
{
 for i in $stas ; do
   uci set wireless.@wifi-iface[$i].disabled=1; wifi
 done
}

while true ; do
 if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
   kill_stas ; wifi; exit 0
 fi
 sleep 3
done
