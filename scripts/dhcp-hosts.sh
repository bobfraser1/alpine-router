#!/bin/bash

#Assign static ip addresse by MAC address: dhcp-host=<MAC>,<HOSTNAME>,<IP>,<LEASE-TIMEOUT>

set -eu

sed -i '/^dhcp-host=/d' /etc/dnsmasq.conf
printf '#dhcp-host=08:00:27:00:00:10,alpine1,192.168.1.10,infinite\n' >> /etc/dnsmasq.conf
/etc/init.d/dnsmasq restart
