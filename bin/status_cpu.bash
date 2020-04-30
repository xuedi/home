#!/bin/sh

echo -n ' ' ; sensors | grep -oP 'CPU Temperature.*' | awk '{print $3+0}' | tr -d '\n' ; echo -n ' @ '; sensors asuswmisensors-isa-0000 | grep 'CPU Fan' | awk '{print $3}'  | tr -d '\n' ; echo -n ' RPM'