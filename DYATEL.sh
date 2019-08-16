sudo apt-get install adb
sudo scp -r root@51.75.221.175:/home/TWRP /home/
sudo adb devices
sleep 2
sudo adb push /home/TWRP /sdcard/
