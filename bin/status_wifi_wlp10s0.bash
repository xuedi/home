#!/usr/bin/bash

echo -n ' ' ; cat /proc/net/wireless | sed 1,2d | awk '{print $3}' | tr -d '\n.' ; echo -n '% ' ; iwgetid -r | tr -d '\n' ; echo -n '  ' ; iwconfig $(iwgetid | awk '{print $1}') | sed -n 3p | awk '{print $2, $3}' | tr -d 'BitRae=\n'
