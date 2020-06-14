if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# golang
export GOPATH="/home/xuedi/go"
export GOBIN="/home/xuedi/bin/go"
export PATH="$PATH:$GOBIN/bin"

export PATH="$PATH:/opt/cuda/bin"

