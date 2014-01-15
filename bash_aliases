# Put aliases here!
# set some to run in background automatically using &
alias ls='ls --color=auto'
alias ll='ls -AlhF'
alias la='ls -Ah'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ..='cd ..'
# Check to make sure I actully want to do it
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Send to a pastebin site with, $ cat [file] |sprunge
#alias sprunge='curl -F \'sprunge=<-\' http://sprunge.us'
alias dhcp-kill='sudo dhcpcd -k; sudo dhcpcd'
# What I type when I get angry
alias shutup='sudo !!'

# Stupid aliases that only exist because I'm too stupid to remember the actual command
alias unmount='umount'
alias ifconfig='ip addr'
alias firefox='iceweasel'

# BOFH
alias excuse='telnet towel.blinkenlights.nl 666'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    
	alias grep='grep --line-number --with-filename --color=auto'
    alias fgrep='fgrep --line-number --with-filename --color=auto'
    alias egrep='egrep --line-number --with-filename --color=auto'
fi

system-update() {
	# pacman based (Arch Linux, Parabola)
	if [ -x /usr/bin/pacman ]; then
		sudo pacman -Syu;
		return;
	fi
	# zypper based (openSUSE)
	if [ -x /usr/bin/zypper ]; then
		sudo zypper update;
		return;
	fi
	
	# yum based (Fedora, RHEL/CentOS)
	if [ -x /usr/bin/yum ]; then
		sudo yum update;
		return;
	fi

	# apt based (Debian, Ubuntu)
	if [ -x /usr/bin/apt-get ]; then
		sudo apt-get update && sudo apt-get upgrade;
		return;
	fi
	
	# opkg based (OpenWRT, LibreWRT)
	if [ -x /bin/opkg ]; then
		sudo opkg update; # not sure if this only refreshes repo, or if it updates as well. The packages don't seem to change much...
		return;
	fi

	# Apple
	if [  -x /usr/sbin/softwareupdate ]; then
		sudo softwareupdate -i -a
	fi
	# Windows or not on list
	echo "No package manager found";
}
