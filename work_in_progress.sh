## Untested

#!/bin/sh
stas=$(uci show wireless | grep "sta" | grep -o \\[[0-9]\])

kill_stas ()
{
  i=0
  for i in $stas ; do
  uci set wireless.@wifi-iface[$i].disabled=1
done
}

while true ; do
  if [ $(iwinfo | grep -c "ESSID: unknown") -ge 1 ]; then
  kill_stas; wifi; exit; fi
  sleep 3
done
