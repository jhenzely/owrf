# owrf
OpenWRT Wireless Repeater Fix: Is workaround for dropping wireless connection when repeated network is unavailable. And also this is my first repository :))

OpenWRT Wireless Repeater Fix: Is workaround for dropping wireless connection when repeated network is unavailable. And also this is my first repository :))

I was inspired by script on the end of page (Link), but I decided to make it more "light".

https://wiki.openwrt.org/doc/recipes/ap_sta

#!/bin/sh
sleep 7 ## Wait for everything to load (increase if slow CPU)

uci set wireless.@wifi-iface[0].disabled=0 ## Enable repeated network at start (after boot)
uci commit wireless ## Write config (repeated wireless network enabled)

sleep 10            ## Wait for everything to load (increase if slow CPU)

while true ; do     ## Endless loop
	if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then   ## WHen "ESSID: unknown", then connection then connection with
	                                                          ## repeated network was terminated. Hurry !! It's time to act !
	uci set wireless.@wifi-iface[0].disabled=1; wifi; exit 0  ## "Disable" the repeated network, our work is done,
	                                                          ## end the script
	fi
	sleep 1 ## Checking interval (increase if slow CPU)
done
