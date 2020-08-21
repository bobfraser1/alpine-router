# alpine-router

alpine linux based router using iptables and dnsmasq

## Why?

There are many solutions for NAT routers but `dnsmasq` allows you to set up your
own private network with DNS and DHCP. This can be very useful for modeling
arbitrary domains, providing fully qualified host names, and testing things like
SSL certificates or service discovery.

## Vagrant Setup

[VirtualBox](https://www.virtualbox.org) is required for [Vagrant](https://vagrantup.com) setup.

### VirtualBox configuration

In VirtualBox create a [private network](https://www.virtualbox.org/manual/ch06.html#network_hostonly) and set the IP address. Do not enable DHCP.

### Vagrant configuration

Edit the `Vagrantfile`. Update the private network with the VirtualBox network name and the static IP address for the router. Example:

     config.vm.network "private_network", ip: "192.168.1.2", name: "vboxnet1"

Update the shell provisioners to set the following environment variables:

    PUBLIC_NET - external or public network
    PRIVATE_NET - internal or private network
    INTERFACE - interface to listen for DHCP and DNS requests
    DOMAIN - domain for the private network
    DHCP_RANGE - lower bound, upper bound, lease timeout

### Deployment

    vagrant up

will provision an Alpine Linux VM configured to be a NAT router with DHCP and DNS.

### DNS configuration

The easiest way to provide fully qualified host names is to add entries in
`/etc/hosts`. Only shortnames need to be provided, they will be expanded by
dnsmasq.

## Shell Script Setup

If you don't want to use Vagrant or Alpine Linux, you can use any Linux machine or virtual machine and follow the [Shell Script Setup](scripts/README.md) guide.
