#!/bin/bash
sudo systemctl stop mysqld
sudo systemctl stop nginx
sudo systemctl stop php-fpm
killall conky
killall dropbox
killall fcitx
pulseaudio --kill
sudo systemctl stop polkit


sudo sync

sudo shutdown -h now
