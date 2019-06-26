apt update && apt upgrade -y
pkg install curl wget git micro openssl openssl-dev ncurses-utils -y
pkg install tsu

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


curl -LO https://raw.githubusercontent.com/Hax4us/Nethunter-In-Termux/master/kalinethunter
tsudo chmod +x kalinethunter
tsudo ./kalinethunter --insecure
tsudo startkali
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb
apt install ./kali-archive-keyring_2018.1_all.deb
apt-get update
apt-get install lxde-core lxde kali-defaults kali-root-login desktop-base
apt-get autoremove
apt-get clean
apt-get install tightvncserver
pkg install micro python python2 python-dev python3-dev python-pip
pip install bpython ipython

vncserver :1 -geometry 1420x720 -dpi 120
