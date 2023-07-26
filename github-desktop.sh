#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install wget apt-transport-https gnupg2 software-properties-common

# https://github.com/shiftkey/desktop
wget https://github.com/shiftkey/desktop/releases/download/release-3.2.5-linux1/GitHubDesktop-linux-3.1.7-linux1.deb
sudo apt install -f ./GitHubDesktop-linux-3.2.5-linux1.deb
