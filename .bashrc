
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

### history ###
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

### Dateformat
export TIME_STYLE=long-iso

### some alias
alias ll='exa -bghHliS --git --time-style=long-iso'
alias du='du -kh'
alias df='df -kTh'
alias netstat='sudo netstat -tulpn'
alias 雪地='ponysay 雪地很厉害'
alias steam='STEAM_RUNTIME=0 steam'

### after all nice settings, fuck bash, use fish is present :-P
exec fish
