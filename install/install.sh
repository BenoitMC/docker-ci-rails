#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

# Common utilities & dependencies
apt-get install -y nano apt-utils apt-transport-https gnupg-agent software-properties-common

# NodeJS
apt-get install -y nodejs npm
npm install -global yarn

# ImageMagick
apt-get install -y imagemagick ghostscript
rm /etc/ImageMagick-6/policy.xml

# Google Chrome
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt-get install -y google-chrome-stable

# PostgreSQL
apt-get install -y postgresql postgis

# Docker Image configuration & utilities
cp -rf /install/rootfs/* /
chmod -R 700 ~/.ssh

# Delete install files
rm -rf /install

# Print versions
source /root/.profile
date "+%F %T %z" > /docker-image-datetime
print-versions
