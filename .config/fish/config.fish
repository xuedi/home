
### history ###
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

alias ll='exa -bghHliS --git --time-style=long-iso'
alias du='du -kh'
alias df='df -kTh'
alias netstat='sudo netstat -tulpn'
alias 雪地='ponysay 雪地很厉害'
alias steam='STEAM_RUNTIME=0 steam'

set -gx PATH /home/xuedi/bin $PATH
set -gx PATH /home/xuedi/bin/go/bin/ $PATH

set -gx GOPATH /home/xuedi/go
set -gx GOBIN /home/xuedi/bin/go/bin/