#!/bin/bash

set -e

USER=$(whoami)
ZSH=/home/${USER}/.oh-my-zsh
ZSH_CUSTOM=/home/${USER}/.oh-my-zsh/custom

### Setup ~ ###

sudo apt -y update && sudo apt -y upgrade
cd ~ && rm -rf Music Pictures Public Templates Videos
mkdir -p ~/git

### git ###
sudo apt -y install git

#### python ####

sudo apt install -y python3 python3-dev python3-pip venv matplotlib numpy bs4 requests pandas

### SDR ###

sudo apt install -y gnuradio inspectrum gr-fosphor gr-iio gr-osmosdr hackrf gr-air-modes

#### terminal emulator #### 

sudo apt install -y terminator tmux

#### desktop ####

sudo add-apt-repository universe
sudo apt install -y cinnamon-desktop-environment lightdm

####  shell #### 

#zsh
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting fonts-powerline
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true
git clone https://github.com/romkatv/powerlevel10k.git
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
chsh -s $(which zsh)

#### editor #### 

sudo apt install -y vim

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo bash -c 'echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list'
sudo apt update -y
sudo apt install sublime-text


#### SSH ####

sudo apt install -y ssh

# sudo cat > /etc/ssh/sshd_config << 'EOF'
# Protocol 2
# Port 372
# AddressFamily any
# ListenAddress 0.0.0.0
# ListenAddress ::
# HostKey /etc/ssh/ssh_host_ed25519_key
# LogLevel VERBOSE
# LoginGraceTime 2m
# #PermitRootLogin prohibit-password
# #StrictModes yes
# MaxAuthTries 3
# MaxSessions 3
# UsePAM yes
# AllowTcpForwarding no
# GatewayPorts no
# X11Forwarding yes
# X11DisplayOffset 10
# X11UseLocalhost yes
# PrintMotd no
# TCPKeepAlive no
# PermitRootLogin no
# PermitUserEnvironment yes
# UseDNS no
# AcceptEnv LANG LC_*
# Subsystem	sftp	/usr/lib/openssh/sftp-server
# EOF

# sudo systemctl enable ssh
# sudo systemctl start ssh

### Dist. upgrade ###

sudo apt install update-manager-core -y

sudo do-release-upgrade -d || sudo do-release-upgrade 

### MISC. ###

sudo apt install ntp
sudo apt autoremove -y
source ~/.zshrc
