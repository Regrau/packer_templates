#!/bin/bash
#This script will set the Salt-Master IP to static

echo -e "BOOTPRO='static'\n\
IPADDR='192.168.122.2'\n\
NAME=''\n\
NETMASK='255.255.255.0'\n\
STARTMODE='auto'\n\
USERCONTROL='no'" > /etc/sysconfig/network/ifcfg-eth0

echo "default 192.168.122.1" > /etc/sysconfig/network/routes
echo "nameserver 192.168.122.1" >> /etc/resolv.conf
