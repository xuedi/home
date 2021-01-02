

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


if [ -d "/opt/cuda/bin" ] ; then
    PATH="/opt/cuda/bin:$PATH"
fi


if [ -d "$HOME/.go/bin" ] ; then
    PATH="$HOME/.go/bin:$PATH"
fi


if [ -d "$HOME/.go" ] ; then
    GOPATH="$HOME/.go"
fi

# fish: ~/.config/fish/config.fish