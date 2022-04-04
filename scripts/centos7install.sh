#!/bin/bash

yum update
wget 
# Add centos7 endpoint x86_64 repo
yum install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm

# Update curl latest version using city-fan --> required for homebrew
rpm -Uvh http://www.city-fan.org/ftp/contrib/yum-repo/rhel8/x86_64/city-fan.org-release-2-2.rhel8.noarch.rpm
yum --enablerepo=city-fan.org -y update
yum install -y curl


# Install utilities
yum install -y tree git python3

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Create Alias for git .dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
mkdir .zah && touch $HOME/.zsh/aliases
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
