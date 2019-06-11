#!/bin/sh
    sync; echo 3 > /proc/sys/vm/drop_caches
        swapoff -a && swapon -a
        sleep 1

  killall -q chrome dropbox iceweasel leafpad psi_plus skype icedove thunderbird firefox-esr firefox chromium xchat transmission kvirc pidgin hexchat telegram-desktop # feel free to add your own internet connected app
sleep 1
  bleachbit -c telegram-desktop leafpad psi_plus adobe_reader.cache chromium.cache chromium.current_session chromium.history elinks.history emesene.cache epiphany.cache firefox.url_history flash.cache flash.cookies google_ch$
sleep 1

sudo dd if=/home/urandom

su x -c 'notify-send "Клянусь Олегом, всЯму пизда!"'

shutdown
