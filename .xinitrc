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


### Fix mouse speed for G402 --- Apparently the mouse has a button for this ^_^ ... RTFM
#if [ -f ~/bin/mouse.sh ]; then
    #bash ~/bin/mouse.sh
#fi


### Custom keys (.xbindkeysrc)
xbindkeys &
setxkbmap de


### Input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx


### hugo extrernal screen
if [ "$HOSTNAME" = hugo ]; then
	xrandr --output eDP1 --primary --auto --output DP1 --above eDP1 --auto
	docker start mysql vgldev
fi

### snowfield
if [ "$HOSTNAME" = snowfield ]; then
	sudo rmmod btusb
	sudo modprobe btusb
	blueman-applet &
fi


### SystemDefaults
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


### Start WM
#exec awesome
exec i3
