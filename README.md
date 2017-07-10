# alpine-router
alpine linux based router using iptables and dnsmasq

These shell scripts build a simple NAT router based on [Alpine
linux](http://www.alpinelinux.org) using `iptables` and
[dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html).

## Why ?
There are many solutions for NAT routers but `dnsmasq` allows you to set up your
own private network with DNS and DHCP. This can be very useful for modeling
arbitrary domains, providing fully qualified host names, and testing things like
SSL certificates or SSO.

## Setup
These scripts must be run with root privilege. The scripts assume two network
interfaces. The first is assigned to the public network which provides default
routing and upstream DNS. The second is assigned to the private network. Dnsmasq
will provide DHCP and local DNS on this network.

Here are example `/etc/network/interfaces` entries:

    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
    address 192.168.1.2
    netmask 255.255.255.0

## Configuration
Edit the following variables in `dnsmasq.sh`:

    interface - interface to listen for DHCP and DNS requests (eg. eth1)
    domain - domain for the private network (eg. example.com)
    dhcp_range - lower bound, upper bound, lease timeout (eg. "192.168.1.100,192.168.1.254,12h")

**Note:** `dnsmasq.sh` uses `sed` to automate the editing of `dnsmasq.conf`'.
`Sed` solutions have the dual bonus of being brittle *and* hard to read. :smile:
You would be wise to do a trial run and see that you get the results you expect.

The easiest way to provide fully qualified host names is to add entries in
`/etc/hosts`. Only shortnames need to be provided, they will be expanded by
dnsmasq.
