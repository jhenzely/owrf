#!/bin/sh
sleep 7
uci set wireless.@wifi-iface[0].disabled=0
sleep 7

while true ; do
	if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
	uci set wireless.@wifi-iface[0].disabled=1; wifi; exit 0
	fi
	sleep 3
done
