cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-arm64.tar.gz && sudo tar xfz go1.13.1.linux-arm64.tar.gz && rm go1.13.1.linux-arm64.tar.gz && cd
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.zshrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc
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
rm patch1.sh
