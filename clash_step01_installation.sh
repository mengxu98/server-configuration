#!/bin/bash

# Check if the system is Ubuntu
# Now, this script only runs on Ubuntu
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ "$ID" != "ubuntu" ]; then
        echo "This script is intended for Ubuntu systems."
        echo "Exiting..."
        exit 1
    fi
else
    echo "Unable to determine the distribution."
    echo "Exiting..."
    exit 1
fi

mkdir ../clash
sudo chmod 777 ../clash

if [ -f softwares/clash/clash-linux-amd64-v1.17.0.gz ]; then
    echo "'clash' exists."
    cp softwares/clash/clash-linux-amd64-v1.17.0.gz clash-linux-amd64-v1.17.0.gz
else
    echo "'clash' not exist. Downloading..."
    wget https://github.com/Dreamacro/clash/releases/download/v1.17.0/clash-linux-amd64-v1.17.0.gz
fi

gunzip clash-linux-amd64-v1.17.0.gz
sudo mv clash-linux-amd64-v1.17.0 ../clash/clash
sudo chmod 777 ../clash/clash

../clash/clash &
sleep 3
killall clash
