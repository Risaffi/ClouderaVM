#!/bin/bash

# Usage:
# <datasource> <overwrite?>

# Get config files
source /usr/etc/conf/$1/$1_config

# Put in HDFS

if [ "$2" = "overwrite" ]; then
	sudo -u hdfs hadoop fs -put -f $sourcedir/$objects_name $hdfs_path
else
	sudo -u hdfs hadoop fs -put $sourcedir/$objects_name $hdfs_path
fi
