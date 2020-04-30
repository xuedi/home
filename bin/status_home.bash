#!/bin/sh

echo -n ' ' ; sudo df -h | grep nvme0n1p1 | awk '{print $4}' | tr -d '\n' ; echo -n ' @ '; sensors nvme-pci-0900 | awk 'NR==3 {print $2}' | tr -d '.9C\n'