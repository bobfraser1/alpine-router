#!/bin/sh

apk add dnsmasq
rc-update add dnsmasq

# INTERFACE - interface to listen for DHCP and DNS requests
# DOMAIN - domain for the private network
# DHCP_RANGE - lower bound, upper bound, lease timeout

# INTERFACE=eth1
# DOMAIN=example.com
# DHCP_RANGE="192.168.1.100,192.168.1.254,12h"

sed -i \
"s/^#\?\(interface=\).*/\1$INTERFACE/; \
 s/^#\(listen-address\)=.*/\1=127.0.0.1/; \
 s/^#\(expand-hosts\)/\1/; \
 s/^#\?\(domain=\)[^,]*$/\1$DOMAIN/; \
 s/^#\?\(dhcp-range=\)\d\{1,3\}.\d\{1,3\}.\d\{1,3\}.\d\{1,3\},\d\{1,3\}.\d\{1,3\}.\d\{1,3\}.\d\{1,3\},[^,]*$/\1$DHCP_RANGE/" \
/etc/dnsmasq.conf

#/sbin/reboot
