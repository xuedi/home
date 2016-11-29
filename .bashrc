
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
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


#---xuedi---
alias ll='ls -l'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'
alias netstat='sudo netstat -tulpn'
alias 雪地='ponysay 雪地很厉害'
alias steam='STEAM_RUNTIME=0 steam'
