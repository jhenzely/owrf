# owrf
OpenWRT Wireless Repeater Fix (OWRF): Is workaround for dropping wireless connection when repeated network is unavailable. And also this is my first repository :))

I was inspired by script on the end of page (Link), but I decided to make it more "light".
https://wiki.openwrt.org/doc/recipes/ap_sta

Main difference is, that my script is not copy-pasting (possibly) large configs.

## More info

### The Issue
When using OpenWrt device as a repeater, repeated network set in 'sta' mode and repeater network set in 'ap' mode, then when connection with repeated network is terminated, the 'ap' network on OpenWrt device will mysteriously disappear.

### Why is it an Issue
Yes, of course if repeated network is simply unavailable, why to "see" my OpenWrt device ?
The answer is simple, imagine, that You are somewhere in hotel with tablet, or netbook without ethernet NIC.
This situation could be described in one word: Disaster
OpenWrt device is simply not accessible and there is no possibility to switch to another repeated network.

### My simple script
To avoid this in the future, I wrote simple script. It works for me.

### This repo
I think it may be also useful also for someone else.
