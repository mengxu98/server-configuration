#!/bin/bash

# Ref: https://zhuanlan.zhihu.com/p/627482865?utm_id=0
# This script used to download GEO data
# usage:
#	bash GEO_data_download.sh GEO_ID
# example
#       bash GEO_data_download.sh GEO168408

# Check GEO_ID

if [ -z "$1" ]
then
        echo "Please provide a GSE number."
        exit 1
fi

# Make a new dir in current dir, named as GEO ID
mkdir $1

# Download file
wget -r -nH --cut-dirs=3 ftp://ftp.ncbi.nlm.nih.gov/geo/series/${1: 0:-3}nnn/$1/

# Output information if successed download
echo "The data: $1 successed download."
