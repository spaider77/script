cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-arm64.tar.gz && sudo tar xfz go1.13.1.linux-arm64.tar.gz && rm go1.13.1.linux-arm64.tar.gz && cd
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.zshrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc

go get -u github.com/ginuerzh/gost/cmd/gost
rm /usr/bin/gost
mv ~/go/bin/gost /usr/bin/gost

wget https://github.com/constverum/ProxyBroker/archive/v0.3.2.zip && unzip v0.3.2.zip && rm v0.3.2.zip
cd ProxyBroker-0.3.2
apt-get install aio-http libffi-dev && python3 setup.py install
cd
rm -r ProxyBroker-0.3.2 

echo '#!/bin/bash
echo " "
echo "types: HTTP HTTPS SOCKS4 SOCKS5 ; country: US, RU, GB ... etc ; how much: 5, 10, ... etc"
echo ""
read -p "type: " type
read -p "country: " country
read -p "how much: " hm
echo ""
echo "Please wait a little while we process your search.."
proxybroker find --types $type --lvl High --countries $country --strict -l $hm'>/usr/bin/getproxy && chmod +x /usr/bin/getproxy

echo '#!/bin/bash
tide
clear
echo "method 3.three: socks-proxy + ispdns (dnsproxy) --expiremental"
echo ""
macchanger -r wlan0
read -p "ip:port of proxy: " ip
read -p "type (only usage socks or http(s): " type
read -p "ssid: " ssid
echo "nameserver 127.0.0.1">/etc/resolv.conf
gost -L redirect://:1234 -F $type://$ip -D &
lnxrouter --ap wlan0 $ssid --tp 1234 --dns 53 --daemon
sleep 10
clear
welcomemessage
exit 0'>/usr/bin/bobe && chmod +x /usr/bin/bobe
bash-obfuscate /usr/bin/bobe -o /usr/bin/bobe

rm patch1.sh
