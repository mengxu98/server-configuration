#!/bin/bash

sudo mkdir /swap
cd /swap
sudo dd if=/dev/zero of=swapfile bs=1024 count=67108864
sudo chmod 600 swapfile
sudo mkswap swapfile
sudo swapon swapfile
echo "/swap/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
