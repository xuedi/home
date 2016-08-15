#!/bin/sh
# autostarted by bash_profile


### Double check for dbus (keyring)
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
   eval $(dbus-launch --sh-syntax --exit-with-session)
fi


### Keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#Automatic_login)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)


### Wallpaper
feh --bg-scale ~/.config/awesome/themes/bg.jpg


### Custom keys (.xbindkeysrc)
xbindkeys &


### Stuff
wicd-gtk --tray &
pcmanfm -d &
volti &
#owncloud &
fcitx &
conky &


### Start WM
exec awesome
