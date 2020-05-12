#!/bin/sh

ulimit -n 8192

if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
   eval $(dbus-launch --sh-syntax --exit-with-session)
fi

set PATH $PATH /home/xuedi/bin

### Keyring double check
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
export XDG_CURRENT_DESKTOP=GNOME


if ! pgrep -x "xbindkeys" > /dev/null # check if already running
then
    xbindkeys &
fi



### Input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx


sudo hdparm -S 1 /dev/sda # spin down backup hard-drisk
export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland


### Start WM
sway
