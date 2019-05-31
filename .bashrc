
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

### history ###
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

### Dateformat
export TIME_STYLE=long-iso

### Color compiler
export CCACHE_PATH="/usr/bin"

### some alias
alias ll='exa -bghHliS --git --time-style=long-iso'
alias du='du -kh'
alias df='df -kTh'
alias netstat='sudo netstat -tulpn'
alias 雪地='ponysay 雪地很厉害'
alias steam='STEAM_RUNTIME=0 steam'

### path settings
export PATH="${PATH}:/home/xuedi/bin"
export PATH="${PATH}:/home/xuedi/bin/go/bin"
export GOPATH="/home/xuedi/go"
export GOBIN="/home/xuedi/bin/go/"
export PATH="/usr/lib/colorgcc/bin/:$PATH"    # As per usual colorgcc installation, leave unchanged (don't add ccache)

### yay -S pkgfile
source /usr/share/doc/pkgfile/command-not-found.bash

### spin down backup hard-drisk
if [ "$HOSTNAME" = edo ]; then
	sudo hdparm -S 1 /dev/sda
fi

### after all nice settings, fuck bash, use fish is present :-P
exec fish
