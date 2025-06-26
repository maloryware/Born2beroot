# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

clear; echo "Run 'remindme' to see relevant alias";

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'

alias bat=batcat
alias ufw="sudo ufw"
alias rld="source ~/.bashrc"
alias bs="nano ~/.bashrc"
alias sm="switch-monitoring"
alias smm="sm; echo; mon; echo"
alias run="bash"
alias edit="nano"
alias update-usr="sudo cp -ru /root/.bashrc /home/malpache/.bashrc"
alias update-root="sudo cp -ru /home/malpache/.bashrc /root/.bashrc"
alias bak="backup"
alias bak-usr="bak /home/malpache/.bashrc /home/malpache/"
alias bak-root="bak /root/.bashrc /root/"
alias mon="sudo bash /bin/mon/._pretty"
alias mon-fuckit="sudo bash /bin/mon/monitoring.sh"

backup()
{
	if [ -z $1 ] | [ "$1" == "." ]; then echo "err: please select a file to backup"; return; fi
	if [ -z $2 ]; then LOCATION="."; else LOCATION=$2; fi
	TIMESTAMP=$(date +%s)
	FIRST=$(basename $1 | grep -o . | head -1)
	if [ "$FIRST" == "." ]; then NAME="$1-$TIMESTAMP"; else NAME=".$1-$TIMESTAMP"; fi
	echo Generating temp file: $NAME
	cp -rf $1 $NAME

}

switch-monitoring()
{
	CURR=$(cat /bin/mon/monitoring.sh | sed "2q;d" | cut -d'#' -f2)
	if [ "$CURR" != "mp" ] && [ "$CURR" != "md" ]; then
		echo err: Defaulting to Pretty
		sudo cat /bin/mon/._pretty > /bin/mon/monitoring.sh
		return ;
	fi
	if [ "$CURR" == "mp" ]; then
		LAST="Pretty"
		NEW="Disgusting"
		sudo cat /bin/mon/._disgusting > /bin/mon/monitoring.sh

	fi
	if [ "$CURR" == "md" ]; then
		NEW="Pretty"
		LAST="Disgusting"
		sudo cat /bin/mon/._pretty > /bin/mon/monitoring.sh
	fi
	echo Last was $LAST, switching to $NEW
	return ;
}
remindme()
{
	echo; echo;
	echo "switch-monitoring | sm: switches monitoring.sh from pretty to disgusting and vice-versa;"
	echo "rld: reloads the bash instance (executes 'source ~/.bashrc');"
	echo "bs: opens .bashrc for editing (executes 'nano ~/.bashrc');"
	echo "run: executes program with bash;"
	echo "edit: opens file on nano;"
	echo "backup | bak: backs up selected file by creating a local copy w/ unix timestamp"
	echo; echo;
}


#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
