#AFTER FIRST RUN TERMUX:
#pkg install tsu wget openssl
#wget https://github.com/l4ckyguy/script/raw/master/term.sh && chmod +x term.sh && ./term.sh

#system in /r/w
pkg install tsu
ln -s /system/bin/mount $PREFIX/bin/mount
tsudo mount -o remount,rw /system

#termux start goodies
apt update && apt upgrade -y
pkg install curl wget git nano openssl tmux ncurses-utils git ruby perl python python2 nodejs golang zsh php -y
pip install bpython ipython
git clone https://github.com/Hax4us/java
mv java/openjdk/java /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/home/java/openjdk/bin/java
pkg install tsu #if you r r00t
#pkg install fakeroot #if not
#fakeroot

#fix to get right rights
uid=$(id -u)
su -c chown -R $uid:$uid /data/data/com.termux/ && su -c restorecon -RF /data/data/com.termux

#Lazymux
cd
git clone https://github.com/Gameye98/Lazymux

#aliases
echo "alias p='python'">>~/.zshrc
echo "alias p2='python2'">>~/.zshrc
echo "alias l='python2 ~/Lazymux/lazymux.py'">>~/.zshrc

#termux customization
git clone https://github.com/jotyGill/quickz-sh.git
cd quickz-sh
tsudo chmod +x quickz.sh
./quickz.sh
git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

#Net-Hunter
#install chroot
cd
curl -LO https://raw.githubusercontent.com/Hax4us/Nethunter-In-Termux/master/kalinethunter
tsudo chmod +x kalinethunter
tsudo ./kalinethunter --insecure

echo 'now run nethunter with tsudo startkali and put some commands there:'
echo 'wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb'
echo 'apt install ./kali-archive-keyring_2018.1_all.deb'
echo 'apt-get update && apt-get full-upgrade -y'
echo 'apt-get install kali-linux-nethunter -y'

  
