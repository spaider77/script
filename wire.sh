#!/bin/bash

ssh -t root@breguet.pw 'wget https://raw.githubusercontent.com/l-n-s/wireguard-install/master/wireguard-install.sh -O wireguard-install.sh
bash wireguard-install.sh'

scp root@breguet.pw:/root/*-wg0.conf  ./storage/
