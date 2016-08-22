#!/bin/sh
# autostarted by bash_profile


### Double check for dbus (keyring)
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
   eval $(dbus-launch --sh-syntax --exit-with-session)
fi


### Keyring double check
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
export XDG_CURRENT_DESKTOP=GNOME


### Fix mouse speed for G402
if [ -f ~/bin/mouse.sh ]; then
    bash ~/bin/mouse.sh
fi


### Custom keys (.xbindkeysrc)
xbindkeys &
setxkbmap de


### Input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx


### Common Stuff
pnmixer &
pcmanfm -d &
#owncloud &
if [ "$HOSTNAME" = snowfield ]; then
    wicd-gtk --tray &
fi


### SystemDefaults
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


### Start WM
exec awesome
#exec i3
