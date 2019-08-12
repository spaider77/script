#!/bin/sh

echo 	'nameserver 1.1.1.1'>/etc/resolv.conf
echo 	'nameserver 1.1.1.1'>/var/run/dnsmasq/resolv.conf
echo 	'interface=lo,uap0
		bind-interfaces
		server=1.1.1.1
		dhcp-range=192.168.50.50,192.168.50.150,12h'>/etc/dnsmasq.conf

echo 	'forward-zone:
        name: "."
        forward-addr: 1.1.1.1'>/var/cache/unbound/resolvconf_resolvers.conf

sshuttle -l 0.0.0.0 --dns -Nr $1@$2:$3 -x $2 0/0
