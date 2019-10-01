#!/bin/bash

#launch many copies telegram-desktop
useradd -m -G sudo -s /bin/bash x1 
chown -hR x1 /home/x1/
useradd -m -G sudo -s /bin/bash x2 
chown -hR x2 /home/x2/
useradd -m -G sudo -s /bin/bash x3 
chown -hR x3 /home/x3/

echo 'gksu -u x$1 telegram-desktop &'>/usr/bin/tgk
chmod +x /usr/bin/tgk
