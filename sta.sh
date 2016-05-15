#!/bin/sh

sleep 7

stas=""
stas=$(uci show wireless | grep "sta" | grep -o \[0-9])
uci set wireless.@wifi-iface[$stas].disabled=0; wifi
stas 5

kill_stas ()
{
 for i in $stas ; do
   uci set wireless.@wifi-iface[$i].disabled=1
   wifi
 done
}

while true ; do
 if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
   kill_stas ; wifi; exit 0
   fi
   sleep 3 
done
