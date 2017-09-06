#!/bin/bash
rm -r /home/xuedi/.Trash/*
rm -r /home/xuedi/.local/share/Trash/info/*
rm -r /home/xuedi/.local/share/Trash/files/*
sudo rm /var/log/*.{1,2,3,4,5}
sudo pacman -Scc
