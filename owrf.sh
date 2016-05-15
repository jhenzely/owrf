## owrf automated installation

#!/bin/sh

echo "Hello, this script will install owrf"

opkg update > /dev/null 2>&1
echo "Updating package list"
opkg install iwinfo > /dev/null 2>&1
echo "Installing 'iwinfo'"
curl -o https://raw.githubusercontent.com/jhenzely/owrf/master/sta.sh /etc/config/sta.sh > /dev/null 2>&1
echo "Downloading sta.sh"
sed -i '/bin/sh /etc/config/sta.sh & > /dev/null 2>&1' /etc/rc.local
echo "Adding script to start after boot"

chmod 755 /etc/config/sta.sh && echo "sta.sh O.K" || echo "Adding sta.sh FAILED" ; exit 1
chmod 755 /etc/rc.local && printf "\n%s\n%s\n%s\n%s\n" "/etc/rc.local O.K" "Well done !" "Everything was successfully set-up, and owrf should work now !" "Jaroslav Henzely jaroslav.henzely@gmail.com" || echo "/etc/rc.local FAILED, script is not able to start on boot" ; exit 1

stas=$(uci show wireless | grep "sta" | grep -o \[0-9])
uci set wireless.@wifi-iface[$stas].disabled=0
uci commit wireless

rm -f owrf.sh
