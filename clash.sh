################################################################
# Way 1

#!/bin/bash
# clash
wget https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2023.04.16.gz
gunzip clash-linux-amd64-2023.04.16.gz
mkdir ~/clash
sudo mv clash-linux-amd64-2023.04.16 ~/clash/clash
sudo chmod +x ~/clash/clash
cd ~
./clash/clash

sudo service clash stop
# Then close clash and modify configuration file '.yaml'
# sudo vim ~/.config/clash/config.yaml
cat server-configuration/softwares/clash/test.yml > ~/.config/clash/config.yaml

# export http_proxy="http://127.0.0.1:7890"
# export https_proxy="https://127.0.0.1:7890"
# export http_proxy=http://127.0.0.1:7890
# export https_proxy=http://127.0.0.1:7890
# export ftp_proxy="https://127.0.0.1:7890"
# unset http_proxy
# unset https_proxy

sudo cp server-configuration/softwares/clash/clash.sh ~/
sudo chmod 777 ~/clash.sh
sudo cp server-configuration/softwares/clash/clash.sh /etc/init.d/
sudo chmod 777 /etc/init.d/clash.sh
sudo update-rc.d clash.sh defaults

# Auto
# And write following test into a script file 'clash.sh':
    # echo "123123"|sudo -S modprobe gs_usb
    # # sudo iptables -F

    # netstat -tunllp
    # sudo netstat -anp|gerp "7890"
    # kill -9 7840

    # cd ~
    # ./clash/clash
#sudo chmod +x ./clash.sh

# Then set system proxy settings as figure in 'softwares/clash/clash**.png'
# Then use command: 'gnome-session-properties', set 'clash.sh' automatically


################################################################
# Way 2
# If you can use a visual desktop on linux-based system
# Please use the GUI application of clash, see: https://www.jianshu.com/p/02e3e8ccfe80