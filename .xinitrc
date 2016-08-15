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



### Wallpaper
feh --bg-scale ~/.config/awesome/themes/bg.jpg


### Custom keys (.xbindkeysrc)
xbindkeys &


### Common Stuff
wicd-gtk --tray &
pcmanfm -d &
volti &
fcitx &
conky &
owncloud &


### SystemDefaults
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


### Start WM
exec awesome
