#!/bin/bash


#####################################
## Device definition
eth0=`ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*'`



#####################################
## Flush the inicial config
sudo iptables --flush


#####################################
## MSN Bot
#iptables -A INPUT -s 65.55.0.0/24 -j DROP


#####################################
## INPUT

## localhost
sudo iptables -A INPUT -i lo -j ACCEPT

## Always allow Answers and running connection
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

## DENY THE REST
sudo iptables -A INPUT -d $eth0 -j REJECT




#####################################
## OUTPUT


## Always allow outgoing stuff
#iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

