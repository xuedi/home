#!/bin/bash
terminator 

# open presplit terminals
links 100% htop
rechts 20% sudo iotop -o
rechts 20% sudo bwm-ng
rechts 60% sudo watch "netstat -tulpn"

