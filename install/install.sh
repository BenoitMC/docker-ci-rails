#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

# Common utilities & dependencies
apt-get install -y apt-utils apt-transport-https ca-certificates gnupg-agent software-properties-common
apt-get install -y nano wget curl unzip bzip2 xz-utils git
apt-get install -y zsh
apt-get install -y htop rcconf
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libxml2-dev libxslt-dev libsqlite3-dev

# NodeJS
apt-get install -y nodejs

# ImageMagick
apt-get install -y imagemagick ghostscript
rm /etc/ImageMagick-6/policy.xml

# Google Chrome
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable

# PostgreSQL
apt-get install -y postgresql postgresql-server-dev-all postgis

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/required/sufficient/g' /etc/pam.d/chsh
chsh -s /usr/bin/zsh

# Docker Image configuration & utilities
cp -rf /install/rootfs/* /

# Delete install files
rm -rf /install

# Print versions
source /root/.profile
print-versions
