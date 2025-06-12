#!/bin/bash
#md

# GO THROUGH THE DOCUMENT FIRST; DO NOT COPY-PASTE THIS. YOU WILL REGRET IT





# You wanted to one-line it? Here you go. Here's your disgusting, shitty excuse of a monitoring script. 
# I hope you know you're literally bash Hitler for willingly choosing to use this.

# 				 wall <<-EOF
nl=$'\n';t=$'\t';cat <<-EOF
	$t#$t Architecture: $(uname -srm)$nl$t#$t CPU Physical : $(cat /proc/cpuinfo | grep "physical id" | uniq | wc -l)$nl$t#$t vCPU : $(cat /proc/cpuinfo | grep "processor" | uniq | wc -l)$nl$t#$t Memory Usage: $(free -m | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free -m | grep "Mem" | xargs echo | cut -d' ' -f2)MB ($(awk "BEGIN {printf \"%.2f\",$(free | grep "Mem" | xargs echo | cut -d' ' -f3)/$(free | grep "Mem" | xargs echo | cut -d' ' -f2)*100}")%)$nl$t#$t Disk Usage: $(df -Bg | grep "^/dev" | grep -v "/boot$" | awk '{used += $3} END {print used}')/$(df -Bg | grep "^/dev" | grep -v "/boot$" | awk '{total += $2} END {print total}')GB ($(df -Bm | grep "^/dev" | grep -v "/boot$" | awk '{used += $3} {total += $2} END {printf("%d"), used / total * 100}')%)$nl$t#$t CPU load: $(top -bn1 | grep Cpu | xargs echo | cut -d' ' -f2 | cut -d'%' -f1)%$nl$t#$t Last boot: $(who -b | xargs echo | cut -d' ' -f3-)$nl$t#$t LVM use: $(lsblk | grep lvm > /dev/null && echo yes || echo no)$nl$t#$t Connections TCP : $(cat /proc/net/sockstat | grep "TCP" | cut -d' ' -f3)$nl$t#$t User log: $(who | wc -l)$nl$t#$t Network: IP $(hostname -I | xargs echo) ($(ip link show | grep ether | xargs echo | cut -d' ' -f2))$nl$t#$t Sudo: $(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l) commands$nl$t#$t Note: I drink the blood of newborns for fun.$nl
	EOF