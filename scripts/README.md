# Shell Script Setup

These shell scripts build a simple NAT router based on [Alpine
linux](http://www.alpinelinux.org) using `iptables` and
[dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html).

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

Set these environment variables or edit them in `iptables.sh`:

    PUBLIC_NET - external or public network
    PRIVATE_NET - internal or private network

Set these environment variables or edit them in `dnsmasq.sh`:

    INTERFACE - interface to listen for DHCP and DNS requests
    DOMAIN - domain for the private network
    DHCP_RANGE - lower bound, upper bound, lease timeout

**Note:** `dnsmasq.sh` uses `sed` to automate the editing of `dnsmasq.conf`'.
`Sed` solutions have the dual bonus of being brittle _and_ hard to read. :smile:
You would be wise to do a trial run and see that you get the results you expect.

Edit `dhcp-hosts.sh` and add static IP and hostname assignments by MAC address.
