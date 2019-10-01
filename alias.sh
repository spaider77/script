#!/bin/bash

#launch many copies telegram-desktop
useradd -m -G sudo -s /bin/bash x1 && chown -hR x1 /home/x1/
useradd -m -G sudo -s /bin/bash x2 && chown -hR x2 /home/x2/
useradd -m -G sudo -s /bin/bash x3 && chown -hR x3 /home/x3/

cat << EOF > /usr/bin/tgk
#!/bin/bash
read -p 'number: ' number
gksu -u x$number telegram-desktop
EOF

chmod +x /usr/bin/tgk
