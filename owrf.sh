#!/bin/sh
#Script by Jaroslav Henzely
#jaroslav.henzely@gmail.com

sleep 10
stas=""
stas=$(uci show wireless | grep "mode=sta" | grep -o \[0-9])
sleep 5
sta_off=0

kill_stas () {
 for i in $stas ; do
   uci set wireless.@wifi-iface[$i].disabled=1; wifi
 done
}

check_stas () {
if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
   kill_stas ; sta_off=1 ; wifi
fi
sleep 4
}

save_ssids ()
{
 for i in $stas ; do
   names=$names""$(uci show wireless | egrep "\.ssid" | grep -i "\[$i\]" | cut -d '=' -f 2)"|"
 done
}

save_ssids
fail_back () {
scan=$(iwinfo phy0 scan)
i_see=$(echo "$scan" | grep -E -o "$names" )
network=$(echo "$scan" | grep -E "ESSID:|Signal: -[2-7][0-9]" | grep -o "$i_see" | cut -d "|" -f 1)
sta_id=$(uci show wireless | grep "$network" | grep -E -o "\[([0-9])\]" | grep -o "[[:digit:]]")

if [ $(echo $sta_id | grep -E -c "\w?") -eq 1 ] ; then
 uci set wireless.@wifi-iface[$sta_id].disabled=0 && sta_off=0 ; wifi ; fi
sleep 25 
}

while true ; do
   if [ $sta_off -eq 0 ] ; then
   check_stas ; elif [ $sta_off -eq 1 ] ; then
   fail_back ; fi
done
exit 0
