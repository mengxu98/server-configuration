# *server-configuration*
This repository contains the scripts for installing and configuring the server environment.

## Usage

``` bash
git clone https://github.com/mengxu98/server-configuration.git
cd server-configuration
```

### If you want to only install and intallize the R and RStudio server for server

``` bash
sudo bash r-environment_requirements.sh
```

### If you want to install/remove the clash

``` bash
# install clash
sudo bash clash_step01_installation.sh
sudo bash clash_step02_setting.sh
# remove clash
sudo bash clash_step03_remove.sh
```

### If you want to download data from the GEO database

``` bash
bash GEO_data_download.sh GEO_ID # such as: bash GEO_data_download.sh GEO123456
```
