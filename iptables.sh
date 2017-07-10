#!/bin/sh
apk add iptables
rc-update add iptables

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

# eth0 should be assigned to the external or public network
# eth1 should be assigned to the internal or private network

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT
/etc/init.d/iptables save

#/sbin/reboot
