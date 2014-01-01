# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR=vim
set -o vi

export TZ="America/New_York"

# Mac colors
export CLICOLOR=1

# chris@arch:~$ |
PS1='\u@\h:\w$ '
PS2='> '
PS3='> '
PS4='+ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable gpg-agent
if [ -f "${HOME}/.gnupg/gpg-agent.env" ]; then
	. ${HOME}/.gnupg/gpg-agent.env
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
fi

GPG_TTY=$(tty)
export GPG_TTY

# Don't remember the tool or the right flags to extract an archive? Look no further.
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1 && cd $(echo $1 | sed 's/.tar.bz2//')    ;;
			*.tar.gz)    tar xvzf $1 && cd $(echo $1 | sed 's/.tar.gz//')    ;;
			*.bz2)       bunzip2 $1 && cd $(echo $1 | sed 's/.bz2//')    ;;
			*.rar)       unrar x $1 && cd $(echo $1 | sed 's/.rar//')    ;;
			*.gz)        gunzip $1 && cd $(echo $1 | sed 's/.gz//')    ;;
			*.tar)       tar xvf $1 && cd $(echo $1 | sed 's/.tar//')    ;;
			*.tbz2)      tar xvjf $1 && cd $(echo $1 | sed 's/.tbz2//')    ;;
			*.tgz)       tar xvzf $1 && cd $(echo $1 | sed 's/.tgz//')    ;;
			*.zip)       unzip $1 && cd $(echo $1 | sed 's/.zip//')    ;;
			*.Z)         uncompress $1 && cd $(echo $1 | sed 's/.Z//')    ;;
			*.7z)        7z x $1 && cd $(echo $1 | sed 's/.7z//')    ;;
			*)           echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
	}
