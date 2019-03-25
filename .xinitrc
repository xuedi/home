#!/bin/sh
# autostarted by bash_profile


### Double check for dbus (keyring)
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
   eval $(dbus-launch --sh-syntax --exit-with-session)
fi


### path settings
set PATH $PATH /home/xuedi/bin


### Keyring double check
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
export XDG_CURRENT_DESKTOP=GNOME


### Custom keys (.xbindkeysrc)
xbindkeys &


### notifications (yaourt -S notification-daemon)
/usr/lib/notification-daemon-1.0/notification-daemon &


### Input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx


### basic software
insync start


### SystemDefaults
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


### Start WM
exec i3
