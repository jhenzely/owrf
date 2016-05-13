## Untested
## Get SSID from ID
uci show wireless | egrep "\.ssid" | grep -i "\[0\]" | cut -d '=' -f 2
##show SSIDs, should chk. for amplitude, min. -76 dBm
iwinfo phy0 scan | grep "ESSID:" | cut -d '"' -f 2

#!/bin/sh
stas=$(uci show wireless | grep "sta" | grep -o \\[[0-9]\])

kill_stas ()
{
  i=0
  for i in $stas ; do
  uci set wireless.@wifi-iface[$i].disabled=1
done
}

check_status ()
{
while true ; do
  if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
  kill_stas; wifi; exit; fi
  sleep 3
done
}

iwlist scan | grep
