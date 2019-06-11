#!/bin/sh
    sync; echo 3 > /proc/sys/vm/drop_caches
        swapoff -a && swapon -a
        sleep 1

  killall -q chrome dropbox iceweasel leafpad psi_plus skype icedove thunderbir$
sleep 1
  bleachbit -c telegram-desktop leafpad psi_plus adobe_reader.cache chromium.ca$
sleep 1

sudo dd if=/home/urandom of=test.txt bs=21 count=1 conv=notrunc
sudo rm -r /home
su x -c 'notify-send "Клянусь Олегом, всЯму пизда!"'

shutdown

