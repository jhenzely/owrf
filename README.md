### Automatic installation
Currently unavailable, because GitHub does not support http and wget in OpenWrt does not support https :-/ Curl with SSL support is too heavy for OpenWrt I think.
<br>Don't worry, I will deploy a web server soon :))

wget https://raw.githubusercontent.com/jhenzely/owrf/master/owrf.sh && ./owrf.sh

# owrf
OpenWRT Wireless Repeater Fix (OWRF): Is workaround for dropping wireless connection when repeated network is unavailable. And also this is my first repository :))

I was inspired by script on the end of page (Link), but I decided to make it more "light".
https://wiki.openwrt.org/doc/recipes/ap_sta

Main difference is, that my script is not copy-pasting (possibly) large configs which is wasting NOR Flash lifespan.

## More info

### The Issue
When using OpenWrt device as a repeater, repeated network set in 'sta' mode and repeater network set in 'ap' mode, then when connection with repeated network is terminated, the 'ap' network on OpenWrt device will mysteriously disappear.

### Why is it an Issue
Yes, of course if repeated network is simply unavailable, why to "see" my OpenWrt device ?
The answer is simple, imagine, that You are somewhere in hotel with tablet, or netbook without ethernet NIC.
This situation could be described in one word: Disaster <br>
OpenWrt device is simply not accessible and there is no possibility to switch to another repeated network.

### My simple script
To avoid this in the future, I wrote simple script. It works for me.

### This repo
I think it may be also useful also for someone else.

## To do

### Chk if repeated network is available again --Will be closed soon
Do it fast, on-the-fly, seamless, without reboot.
This feature will be implemented soon, testing and optimization is ongoing.
It will take me some time because I want also to measure amplitue (RSSI) so it will be connected to the repeated network only if measured signal is at least 75dBm for three times in 15 seconds.
#### Update
I decided to keep amplitude in -20 - 79dBm range. Lot of wireless cards are able to maintain quite stable connection on this level.

### Make script more "inteligent"
Checking wireless config, gathering current values, testing input values.

### Script optimization
Focus on minimizing script size and complexity.
But do not apply "KISS" principle !! It must be simple, but not stupid !!

### Avoid writing to NOR Flash
Focus on pre-longing lifespan, do not uci commit

### Add this script to official OpenWrt
There is a lot of work to do.
...maybe one day :))

### Issues
Please note, that this project is still in early beta stage. But if You see some serious bugs in code for a long time, feel free to report it ASAP.
