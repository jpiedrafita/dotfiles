#!/bin/bash

###################
###### Repos ######
###################

yum update
 
# Add centos7 endpoint x86_64 repo
yum install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm

# Install yum utilities
yum update && yum install -y tree git python3 neofetch dnf snapd
systemctl enable --now snapd.socket
#dnf -y install dnf-plugins-core

# Update curl latest version using city-fan --> required for homebrew
rpm -Uvh http://www.city-fan.org/ftp/contrib/yum-repo/rhel8/x86_64/city-fan.org-release-2-2.rhel8.noarch.rpm
yum --enablerepo=city-fan.org -y update
yum install -y curl

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

###################
#### Utilities ####
###################

# Install gh tools from homebrew
brew install gh

# Install gnome tweaks
yum install -y chrome-gnome-shell gnome-tweak-tool sassc intltool

# Enable gnome classic/modern

# Install conky
yum install conky conky-manager

# Terminal
# Gnome nord terminal
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
source nord-gnome-terminal/src/nord.sh
rm -rf nord-gnme-terminal

# Oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

########################
##### Applications #####
########################

# Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install -y ./google-chrome*
rm ./google-chrome*

# Install thunderbird
snap install thunderbird

##############################
######## git dotfiles ########
##############################

# Create alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' > .bashrc
# Exclude .dotfiles to avoid recursive problems
echo ".dotfiles" > .gitignore
# Clone the bare repo
git clone --bare https://github.com/jpiedrafita/dotfiles.git $HOME/.dotfiles
# Backup checkout conflict files
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no

#############################
##### Manual activities #####
#############################

# Login in github
# gh auth login

# Install firefox from: https://snapcraft.io/firefox
