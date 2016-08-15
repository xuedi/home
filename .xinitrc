#!/bin/sh
# autostarted by bash_profile


### Keyring (https://wiki.archlinux.org/index.php/GNOME/Keyring#Automatic_login)
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
#export SSH_AUTH_SOCK

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
