# Put aliases here!
# set some to run in background automatically using &
alias ls='ls --color=auto'
alias ll='ls -AlhF'
alias la='ls -Ah'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ..='cd ..'
# Check to make sure I actully want to do it
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
# set up how i like to review directory structures
alias ca='ls -laGh"
# Send to a pastebin site with, $ cat [file] |sprunge
#alias sprunge='curl -F \'sprunge=<-\' http://sprunge.us'
alias dhcp-kill='sudo dhcpcd -k; sudo dhcpcd'
# What I type when I get angry
alias shutup='sudo !!'
alias fucking='sudo'

# Stupid aliases that only exist because I'm too stupid to remember the actual command
alias unmount='umount'

# rss
if [ -x /usr/bin/torify ]; then
	alias newsbeuter='torify newsbeuter -r 2>/dev/null'
	alias mutt="torify mutt 2>/dev/null"
else
	alias newsbeuter='newsbeuter -r'
fi

# stop keybase from leaking data
if [ -x /usr/local/bin/keybase ]; then
	alias keybase='keybase --tor'
fi

# BOFH
alias excuse='nc towel.blinkenlights.nl 666'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    
	alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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
