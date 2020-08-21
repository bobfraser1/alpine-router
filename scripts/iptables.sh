#!/bin/bash

# PUBLIC_NET - external or public network
# PRIVATE_NET - internal or private network

set -eu

apk add iptables
rc-update add iptables

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl -p

iptables -t nat -A POSTROUTING -o $PUBLIC_NET -j MASQUERADE
iptables -A FORWARD -i $PRIVATE_NET -j ACCEPT
/etc/init.d/iptables save
/etc/init.d/iptables restart
