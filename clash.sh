#!/bin/bash
# clash
wget https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2023.04.16.gz
gunzip clash-linux-amd64-2023.04.16.gz
mkdir /home/mengxu/clash
sudo mv clash-linux-amd64-2023.04.16 /home/mengxu/clash/clash
sudo chmod +x /home/mengxu/clash/clash
./clash/clash
# Then close clash and modify configuration file '.yaml'
# And write following test into a script file 'clash.sh':
    # echo "123123"|sudo -S modprobe gs_usb
    # # sudo iptables -F

    # netstat -tunllp
    # sudo netstat -anp|gerp "7890"
    # kill -9 7840

    # cd ~
    # cd clash
    # ./clash
#sudo chmod +x ./clash.sh

# Then use command: 'gnome-session-properties', set 'clash.sh' automatically
