#!/bin/bash

# Some R packages need the following packages
sudo apt-get install libcurl4-openssl-dev -y
sudo apt-get install libxml2-dev -y
sudo apt-get install libfontconfig1-dev -y
sudo apt-get install libharfbuzz-dev -y
sudo apt-get install libfribidi-dev -y
sudo apt-get install libfreetype6-dev -y
sudo apt-get install libpng-dev -y
sudo apt-get install libtiff5-dev -y
sudo apt-get install libjpeg-dev -y
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable -y
sudo apt-get install libgdal-dev libgeos-dev libproj-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libmpfr-dev -y
sudo apt-get install libclang-dev -y
sudo apt-get install cmake -y
sudo apt-get install libmagick++-dev -y

sudo apt --fix-broken install -y

# R
sudo apt-get update -y
sudo apt-get install r-base r-base-dev -y

# If error: Dependency is not satisfiable: libssl1.0.0|libssl1.0.2|libssl1.1
# wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb # Error
# sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb # Error
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb
sudo dpkg -i  libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

sudo apt --fix-broken install -y

# RStudio Server
sudo apt-get update
sudo apt-get install gdebi-core -y
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2023.03.0-386-amd64.deb
sudo gdebi rstudio-server-2023.03.0-386-amd64.deb -n
rstudio-server version
rstudio-server restart
rm rstudio-server-2023.03.0-386-amd64.deb
