#!/bin/bash

# Define the path of the original repository file
ORIGINAL_REPO_FILE="/etc/yum.repos.d/CentOS-Base.repo"
BACKUP_REPO_FILE="/etc/yum.repos.d/CentOS-Base.repo.bak"

# Backup the original repository file
if [ -f "$ORIGINAL_REPO_FILE" ]; then
    echo "Backing up the original repository file to $BACKUP_REPO_FILE"
    sudo cp "$ORIGINAL_REPO_FILE" "$BACKUP_REPO_FILE"
else
    echo "Original repository file does not exist, skipping backup step"
fi

# Write the new repository configuration
echo "Writing new repository configuration to $ORIGINAL_REPO_FILE"
sudo tee "$ORIGINAL_REPO_FILE" > /dev/null << 'EOF'
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-7 - Base - mirrors.aliyun.com
failovermethod=priority
baseurl=http://mirrors.aliyun.com/centos/7/os/$basearch/
        http://mirrors.aliyuncs.com/centos/7/os/$basearch/
        http://mirrors.cloud.aliyuncs.com/centos/7/os/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7 - Updates - mirrors.aliyun.com
failovermethod=priority
baseurl=http://mirrors.aliyun.com/centos/7/updates/$basearch/
        http://mirrors.aliyuncs.com/centos/7/updates/$basearch/
        http://mirrors.cloud.aliyuncs.com/centos/7/updates/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-7 - Extras - mirrors.aliyun.com
failovermethod=priority
baseurl=http://mirrors.aliyun.com/centos/7/extras/$basearch/
        http://mirrors.aliyuncs.com/centos/7/extras/$basearch/
        http://mirrors.cloud.aliyuncs.com/centos/7/extras/$basearch/
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-7 - Plus - mirrors.aliyun.com
failovermethod=priority
baseurl=http://mirrors.aliyun.com/centos/7/centosplus/$basearch/
        http://mirrors.aliyuncs.com/centos/7/centosplus/$basearch/
        http://mirrors.cloud.aliyuncs.com/centos/7/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

#contrib - packages by Centos Users
[contrib]
name=CentOS-7 - Contrib - mirrors.aliyun.com
failovermethod=priority
baseurl=http://mirrors.aliyun.com/centos/7/contrib/$basearch/
        http://mirrors.aliyuncs.com/centos/7/contrib/$basearch/
        http://mirrors.cloud.aliyuncs.com/centos/7/contrib/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
EOF

# Update yum cache
echo "Updating yum cache"
sudo yum clean all
sudo yum makecache

echo "Repository setup completed"
