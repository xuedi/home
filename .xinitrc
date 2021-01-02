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


### Custom keys (.xbindkeysrc)
if ! pgrep -x "xbindkeys" > /dev/null # check if already running
then
    xbindkeys &
fi


### notifications (yaourt -S notification-daemon)
/usr/lib/notification-daemon-1.0/notification-daemon &


### Input system
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx


### athena
if [ "$HOSTNAME" = athena ]; then
	export ELM_SCALE=2
	export GDK_SCALE=2
	export QT_AUTO_SCREEN_SCALE_FACTOR=2
	xrandr --output DP-2 --scale 1x1
	xset s off
fi

### edo 
if [ "$HOSTNAME" = edo ]; then
	sudo hdparm -S 1 /dev/sda # spin down backup hard-drisk
    export MOZ_ENABLE_WAYLAND=1
    export GDK_BACKEND=wayland
fi


### SystemDefaults
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


### Start WM
exec i3
