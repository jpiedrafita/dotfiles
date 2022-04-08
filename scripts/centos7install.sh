#!/bin/bash

yum update
 
# Add centos7 endpoint x86_64 repo
yum install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm

# Install yum utilities
yum update && yum install -y tree git python3 neofetch dnf
#dnf -y install dnf-plugins-core

# Update curl latest version using city-fan --> required for homebrew
rpm -Uvh http://www.city-fan.org/ftp/contrib/yum-repo/rhel8/x86_64/city-fan.org-release-2-2.rhel8.noarch.rpm
yum --enablerepo=city-fan.org -y update
yum install -y curl

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install brew stuff
brew install gh


###############################

# Create Alias for git .dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir .zah && touch $HOME/.zsh/aliases
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zsh/aliases

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
