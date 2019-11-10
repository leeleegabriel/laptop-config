#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

set -e

F=$(pwd)

apt -y update && apt -y upgrade
cd ~ && rm -rf Music Pictures Public Templates Videos

### git ###

apt -y install git

#### python ####

apt install -y python3 python3-dev python3-pip
pip3 install pipenv requests bs4
pip install urllib3

### SDR ###

apt install -y gnuradio inspectrum gr-fosphor gr-iio gr-osmosdr gr-gsm hackrf

#### terminal emulator #### 

apt install -y terminator 

####  shell #### 

#zsh
apt install -y zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

#fonts
apt install fonts-powerline
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
git clone https://github.com/powerline/fonts.git ~/oh-my-zsh/fonts || true
git clone https://github.com/bhilburn/powerlevel9k.git ~/oh-my-zsh/powerlevel9k || true
cd ~/fonts && ./install.sh



#dot file
cp $F/configs/.zshrc ~/.zshrc

#plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true

#### editor #### 

sudo apt install -y vim

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt update -y
apt install sublime-text
#python -c """import urllib3.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)"""
#git apenglow C0 


#### SSH ####

apt install -y ssh
cp $F/configs/sshd_config /etc/ssh/
systemctl enable ssh
systemctl start ssh

#### desktop ####

add-apt-repository ppa:kubuntu-ppa/backports
apt -y update && apt -y full-upgrade
apt install -y kubuntu-desktop


## MISC. ###

chown -R lee:lee ~/.local/share
chown -R lee:lee ~/.oh-my-zsh/
