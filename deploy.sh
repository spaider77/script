#general
apt-get install conky-manager flameshot plank python python-pip python3 python3-pip python-dev python3-dev python-setuptools python3-setuptools zsh git curl redsocks libncursesw5-dev libgeoip-dev libtokyocabinet-dev libssl-dev -y
#for parrot-security-kde
#apt-get install parrot-package-manager parrot-devel-extra linux-headers-5.2.0-2parrot1-all-amd64 linux-image-5.2.0-2parrot1-amd64

#intel GPI drivers
cd /opt && mkdir neo
cd neo
wget https://github.com/intel/compute-runtime/releases/download/19.39.14278/intel-gmmlib_19.3.2_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/19.39.14278/intel-igc-core_1.0.2597_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/19.39.14278/intel-igc-opencl_1.0.2597_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/19.39.14278/intel-opencl_19.39.14278_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/19.39.14278/intel-ocloc_19.39.14278_amd64.deb
dpkg -i *

#rtl8812au and rtl8188eus wifi firmware with nextmon ability
apt-get install dkms
git clone https://github.com/aircrack-ng/rtl8812au.git && cd rtl8812au && ./dkms-install.sh && cd .. && rm -r rtl8812au
git clone https://github.com/aircrack-ng/rtl8188eus.git && cd rtl8188eus && ./dkms-install.sh && cd .. && rm -r rtl8188eus
#vncserver
sudo apt install xfce4 xfce4-goodies tightvncserver
vncserver
vncserver -kill :1
mv /root/.vnc/xstartup /root/.vnc/xstartup.bak
echo '#!/bin/bash'>/root/.vnc/xstartup
echo 'xrdb /root/.Xresources'>>/root/.vnc/xstartup
echo 'startxfce4 &'>>/root/.vnc/xstartup
sudo chmod +x /root/.vnc/xstartup
vncserver
echo "[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target
[Service]
Type=forking
User=root
Group=root
WorkingDirectory=/root
PIDFile=/root/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i
[Install]
WantedBy=multi-user.target">/etc/systemd/system/vncserver@.service
sudo systemctl daemon-reload
sudo systemctl enable vncserver@1.service
vncserver -kill :1
sudo systemctl start vncserver@1
sudo systemctl status vncserver@1


#balena-etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install balena-etcher-electron

#Bash-snippets.. 
git clone https://github.com/alexanderepstein/Bash-Snippets.git && cd Bash* && chmod +x install.sh && ./install.sh

#bat = cat(!) with great wings :) #other https://github.com/sharkdp/bat/releases/
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat_0.12.1_amd64.deb

#node 10
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get install nodejs

#go and gopath
cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz && sudo tar xfz go1.13.1.linux-amd64.tar.gz && rm go1.13.1.linux-amd64.tar.gz && cd
#cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-arm64.tar.gz && sudo tar xfz go1.13.1.linux-arm64.tar.gz && rm go1.13.1.linux-arm64.tar.gz && cd
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.zshrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc

#zsh with many futures
sudo apt-get install zsh
git clone https://github.com/black7375/BlaCk-Void-Zsh.git ~/.zsh && cd ~/.zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
echo "source ~/.zsh/BlaCk-Void.zshrc" >> ~/.zshrc
sudo chsh -s /usr/bin/zsh

#dircolors & zsh-syntax-highlight
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dircolors
echo 'eval $(dircolors -b ~/.dircolors)' >> ~/.zshrc 
. ~/.zshrc 
echo 'eval $(dircolors -b ~/.dircolors)' >> ~/.profile
. ~/.profile
sudo wget -P /opt/ https://github.com/trapd00r/zsh-syntax-highlighting-filetypes/raw/master/zsh-syntax-highlighting-filetypes.zsh
echo 'source /opt/zsh-syntax-highlighting-filetypes.zsh'>>~/.zshrc

#KDE Akava theme + Kvantum + Breezed Glass
#Bree
sudo apt install git g++ extra-cmake-modules cmake gettext libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libfftw3-dev
git clone https://github.com/alex47/BreezeBlurred
cd BreezeBlurred
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
sudo make install
kwin_x11 --replace &
#Akava
cd /opt && git clone https://github.com/Akava-Design/Akava-Kv.git
#Kvantum
cd /opt && git clone https://github.com/tsujan/Kvantum.git && cd Kvantum && cd Kvantum
apt-get install g++ libx11-dev libxext-dev qtbase5-dev libqt5svg5-dev libqt5x11extras5-dev libkf5windowsystem-dev qttools5-dev-tools
mkdir build && cd build
cmake ..
make && make install

#DNS-server
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install dotnet-sdk-2.2
wget https://download.technitium.com/dns/DnsServerPortable.tar.gz
sudo mkdir -p /etc/dns/
sudo tar -zxf DnsServerPortable.tar.gz -C /etc/dns/
sudo cp /etc/dns/systemd.service /etc/systemd/system/dns.service
sudo systemctl enable dns.service
sudo systemctl start dns.service

#DNS-crypt-proxy. other releases: https://github.com/DNSCrypt/dnscrypt-proxy/releases
cd /opt && sudo git clone https://github.com/CNMan/dnscrypt-proxy-config.git && cd dnscrypt* && sudo ./dnscrypt-proxy-config.sh
wget https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.27/dnscrypt-proxy-linux_x86_64-2.0.27.tar.gz && sudo tar xfz dnscrypt-proxy-linux_x86_64-2.0.27.tar.gz && sudo mv ./linux*/dnscrypt-proxy dnscrypt-proxy
#wget https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.0.27/dnscrypt-proxy-linux_arm64-2.0.27.tar.gz && sudo tar xfz dnscrypt-proxy-linux_arm64-2.0.27.tar.gz && sudo mv ./linux*/dnscrypt-proxy dnscrypt-proxy
sudo ./dnscrypt-proxy -service install && sudo ./dnscrypt-proxy -service start
chattr -i /etc/resolv.conf && rm /etc/resolv.conf && echo 'nameserver 127.0.0.1'>/etc/resolv.conf && chattr +i /etc/resolv.conf

#startup-script
echo '#!/bin/bash -e
sync; echo 3 > /proc/sys/vm/drop_caches
swapoff -a && swapon -a
sleep 1
/sbin/sysctl -w net.ipv6.conf.all.disable_ipv6=1
/sbin/sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo killall -q chrome dropbox iceweasel skype icedove thunderbird firefox firefox-esr chromium xchat hexchat transmission steam firejail
bleachbit -c adobe_reader.cache chromium.cache chromium.current_session chromium.history elinks.history emesene.cache epiphany.cache firefox.url_history flash.cache flash.cookies google_chrome.cache google_chrome.history  links2.history opera.cache opera.search_history opera.url_history &> /dev/null'>/usr/bin/pifpaf && chmod +x /usr/bin/pifpaf

#macchanger + change-on-boot
apt-get install macchanger
#put this using crontab -e as sudo:
#@reboot macchanger -A wlan0
#@reboot macchanger -A wlan1
#@reboot macchanger -A eth0
#@reboot ( sleep 10 ; pifpaf )
echo "[connection]" >> /etc/NetworkManager/NetworkManager.conf
echo "ethernet.cloned-mac-address=preserve" >> /etc/NetworkManager/NetworkManager.conf
echo "wifi.cloned-mac-address=preserve" >> /etc/NetworkManager/NetworkManager.conf

#arm64 gost & lnxrouter
wget https://github.com/ginuerzh/gost/releases/download/v2.8.1/gost_2.8.1_armhf.deb && dpkg -i gost* && rm gost*
wget -P /usr/bin/ https://raw.githubusercontent.com/garywill/linux-router/master/lnxrouter && chmod +x /usr/bin/lnxrouter
wget https://raw.githubusercontent.com/Angristan/Local-DNS-resolver/master/unbound-install.sh && chmod +x unbound-install.sh && ./unbound-install.sh && rm unbound-install.sh



