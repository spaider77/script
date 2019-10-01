#!/bin/bash

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
touch /usr/bin/bomber
echo "ssh -t root@88.99.163.122 -p 50400 sudo /opt/infinite-bomber-reborn/builds/linux/Infinite-Bomber-x64/infinite-bomber">/usr/bin/bomber
chmod +x /usr/bin/bomber
