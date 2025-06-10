#!/bin/bash
#md

# GO THROUGH THE DOCUMENT FIRST; DO NOT COPY-PASTE THIS. YOU WILL REGRET IT





# You wanted to one-line it? Here you go. Here's your disgusting, shitty excuse of a monitoring script. 
# I hope you know you're literally bash Hitler for willingly choosing to use this.

# wall << EOF
cat << EOF
	#	Architecture: $(uname -srm)
	#	CPU Physical : $(cat /proc/cpuinfo | grep "physical id" | uniq | wc -l)
	#	vCPU : $(cat /proc/cpuinfo | grep "processor" | uniq | wc -l)
	#	Memory Usage: $(free -m | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free -m | grep "Mem" | xargs echo | cut -d' ' -f2)MB ($(awk "BEGIN {printf \"%.2f\",$(free | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free | grep "Mem" | xargs echo | cut -d' ' -f2)*100}")%)
	#	Disk Usage: $(df -Bg | grep "^/dev" | grep -v "/boot$" | awk '{used += $3} END {print used}')/$(df -Bg | grep "^/dev" | grep -v "/boot$" | awk '{total += $2} END {print total}')GB ($(df -Bm | grep "^/dev" | grep -v "/boot$" | awk '{used += $3} {total += $2} END {printf("%d"), used / total * 100}')%)
	#	CPU load: $(top -bn1 | grep Cpu | xargs echo | cut -d' ' -f2 | cut -d'%' -f1)%
	#	Last boot: $(who -b | xargs echo | cut -d' ' -f3-)
	#	LVM use: $(lsblk | grep lvm > /dev/null && echo yes || echo no)
	#	Connections TCP : $(cat /proc/net/sockstat | grep "TCP" | cut -d' ' -f3)
	#	User log: $(who | wc -l)
	#	Network: IP $(hostname -I | xargs echo) ($(ip link show | grep ether | xargs echo | cut -d' ' -f2))
	#	Sudo: $(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l) commands
	#	Note: I drink the blood of newborns for fun.
EOF