#general
apt-get install python python-pip python3 python3-pip python-dev python3-dev python-setuptools python3-setuptools zsh git curl redsocks libncursesw5-dev libgeoip-dev libtokyocabinet-dev libssl-dev -y

#Bash-snippets.. 
git clone https://github.com/alexanderepstein/Bash-Snippets.git && cd Bash& && chmod +x install.sh && ./install.sh

#bat = cat(!) with great wings :) #other https://github.com/sharkdp/bat/releases/
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat&

#node 10
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && sudo bash nodesource_setup.sh && sudo apt-get install nodejs

#go and gopath
cd /usr/local/ && sudo wget https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz && sudo tar xfz go1.13.1* && cd
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.zshrc
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.profile
sudo echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc

#zsh with many futures
sudo apt-get install zsh
git clone https://github.com/black7375/BlaCk-Void-Zsh.git ~/.zsh && cd ~/.zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts && ./install.sh
cd ..
echo "source BlaCk-Void.zshrc" >> ~/.zshrc
sudo chsh -s /usr/bin/zsh
