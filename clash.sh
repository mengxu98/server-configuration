#!/bin/bash

################################################################
# Way 1

# clash
wget https://github.com/Dreamacro/clash/releases/download/v1.17.0/clash-linux-amd64-v1.17.0.gz
gunzip clash-linux-amd64-v1.17.0.gz
mkdir ~/clash
sudo mv clash-linux-amd64-v1.17.0 ~/clash/clash
sudo chmod +x ~/clash/clash
cd ~
./clash/clash

sudo service clash stop
# Then close clash and modify configuration file '.yaml'
# sudo vim ~/.config/clash/config.yaml
cat server-configuration/softwares/clash/test.yml > ~/.config/clash/config.yaml

sudo cp server-configuration/softwares/clash/clash.sh ~/
sudo chmod 777 ~/clash.sh
sudo cp server-configuration/softwares/clash/clash.sh /etc/init.d/
sudo chmod 777 /etc/init.d/clash.sh
sudo update-rc.d clash.sh defaults

# Auto
# 1) Write following test into a script name 'clash.sh':
    # echo "123123"|sudo -S modprobe gs_usb
    # # sudo iptables -F

    # netstat -tunllp
    # sudo netstat -anp|gerp "7890"
    # kill -9 7840

    # cd ~
    # ./clash/clash
    
# 2)
cd ~
sudo mv server-configuration/softwares/clash/clash.sh clash.sh
sudo chmod +x ./clash.sh

# Then set system proxy settings as figure in 'softwares/clash/clash**.png'
# Then use command: 'gnome-session-properties', set 'clash.sh' automatically


################################################################
# Way 2
# If you can use a visual desktop on linux-based system
# Please use the GUI application of clash, see: https://www.jianshu.com/p/02e3e8ccfe80

