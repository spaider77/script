#!/bin/sh

opkg update && opkg install python-dev python3-dev python-pip iptables-mod-nat-extra iptables-mod-ipopt python-setuptools openssh-client openssh-server openssh-client-utils openssh-keygen
pip install sshuffle

echo -e 'name server 1.1.1.1' > /etc/resolf.conf 

echo -e 'alias haha ="sshuttle -l 0.0.0.0 --dns -r $1@$2 0/0"> /etc/profile

reboot
