# *server-configuration*

A repo for server configuration tasks.
Note: some scripts now only could run on the Ubuntu systems.

## Usage

``` bash
git clone https://github.com/mengxu98/server-configuration.git
cd server-configuration
```

### If you want to only install and intallize the R and RStudio server for server

``` bash
sudo bash r-environment_requirements.sh
```

### If you want to install and intallize the clash

``` bash
sudo bash clash_step01_installation.sh
sudo bash clash_step02_setting.sh
```

### If you want to download data from the GEO database

``` bash
bash GEO_data_download.sh GEO_ID # such as: bash GEO_data_download.sh GEO123456
```

### If you want to use [*tabby*](https://github.com/eugeny/tabby) terminal instead of the default terminal

```bash
sudo bash tabby_installation.sh
```
