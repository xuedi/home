#!/bin/bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

### Keyring ENV
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export GNOME_KEYRING_PID
export GNOME_KEYRING_CONTROL
