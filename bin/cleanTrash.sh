#!/bin/bash

####### moved to the cli tool
# rm -r /home/xuedi/data/.Trash-1000
# rm -r /home/xuedi/backup/.Trash-1000
# rm -r /home/xuedi/.local/share/Trash
trash-empty  # yay -S trash-cli

sudo rm /var/log/*.{1,2,3,4,5}
sudo pacman -Scc
yay -Sc
journalctl --vacuum-time=1week
