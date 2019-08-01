
#!/bin/sh


sudo nano /etc/apt/sources.list
deb http://dl.google.com/linux/chrome/deb/ stable main
wget https://dl-ssl.google.com/linux/linux_signing_key.pub
sudo apt-key add linux_signing_key.pub
sudo apt-get update
sudo apt-get install google-chrome-stable
