#!/bin/sh
sleep 5
stas=""
stas=$(uci show wireless | grep "sta" | grep -o \[0-9])
uci set wireless.@wifi-iface[$stas].disabled=0; wifi
sleep 5

kill_stas ()
{
 for i in $stas ; do
   uci set wireless.@wifi-iface[$i].disabled=1; wifi
 done
}

while true ; do
 if [ $(iwinfo | grep -c "ESSID: unknown") -ge 0 ]; then
   kill_stas ; wifi; exit 0
 fi
 sleep 3 
done
