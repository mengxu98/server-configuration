#!/bin/bash

echo "Going to home directory."
cd ~

echo "Creating and going to 'swap' directory."
sudo mkdir /swap
cd /swap

echo "Setting size of swap memory to 6553600."
sudo dd if=/dev/zero of=swapfile bs=1024 count=65536000
sudo chmod 600 swapfile
sudo mkswap swapfile
sudo swapon swapfile
echo "/swap/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab

echo "Setting swap memory completed"
