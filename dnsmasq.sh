#!/bin/sh

apk add dnsmasq
rc-update add dnsmasq

# interface - interface to listen for DHCP and DNS requests
# domain - domain for the private network
# dhcp_range - lower bound, upper bound, lease timeout

interface=eth1
domain=example.com
dhcp_range="192.168.1.100,192.168.1.254,12h"

sed -i \
"s/^#\?\(interface=\).*/\1$interface/; \
 s/^#\(listen-address\)=.*/\1=127.0.0.1/; \
 s/^#\(expand-hosts\)/\1/; \
 s/^#\?\(domain=\)[^,]*$/\1$domain/; \
 s/^#\?\(dhcp-range=\)\d\{1,3\}.\d\{1,3\}.\d\{1,3\}.\d\{1,3\},\d\{1,3\}.\d\{1,3\}.\d\{1,3\}.\d\{1,3\},[^,]*$/\1$dhcp_range/" \
/etc/dnsmasq.conf

#/sbin/reboot
