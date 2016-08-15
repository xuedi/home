#!/bin/sh
# autostarted by bash_profile


### Double check for dbus (keyring)
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
   eval $(dbus-launch --sh-syntax --exit-with-session)
fi


### Keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#Automatic_login)
#export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)


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


### Keyring stuff, double check env
#export $(gnome-keyring-daemon -s)
#owncloud &


### Start WM
exec awesome
