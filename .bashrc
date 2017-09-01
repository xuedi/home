
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

### bugfix ###
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

### history ###
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

###
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export HISTSIZE=2000
export HISTFILESIZE=2000
export GREP_OPTIONS='--color=auto'

### Dateformat
export TIME_STYLE=long-iso

### keymap
sudo loadkeys de-latin1

### some alias
alias ll='exa -bghHliS --git'
alias du='du -kh'
alias df='df -kTh'
alias netstat='sudo netstat -tulpn'
alias 雪地='ponysay 雪地很厉害'
alias steam='STEAM_RUNTIME=0 steam'

### fixex complaining grep
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

export PATH="${PATH}:/home/xuedi/bin"

#exec fish
