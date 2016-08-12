#!/bin/sh
# autostarted by bash_profile


### fix problems
# java grey fix
#wmname LG3D
#_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING


### thunar deamon
#thunar --daemon &

### eye candy
conky &
#tilda &

### compositor
#xcompmgr -c & # -c = corners
#xcompmgr &

### panel
#bmpanel2 --theme=noir &
#tint2 &

### keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

### wallpaper
feh --bg-scale ~/private/media/pictures/wallpapers/1325613505520.jpg

### Bind custom keys like for screenshots
xbindkeys &

### start audio # should be in /etc/X11/xinit/xinitrc.d/
#start-pulseaudio-x11
#amixer sset Master unmute

### volume manager
#volti &
pasystray &

### do in script in awesome for ex
#dropbox &
#keepassx &
owncloud &

### Input manager
fcitx &

### Start window Manager
exec awesome
