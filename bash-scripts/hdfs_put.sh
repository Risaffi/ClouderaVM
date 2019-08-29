#!/bin/bash

# Usage:
# <datasource> <overwrite?>

# Get config files
source /usr/etc/conf/$1/$1_config
source /usr/lib/bash-scripts/functions.sh

# Put in HDFS

# create directory
#create_dir_ts $1
#dirts=$(create_dir_ts $1)


if [ "$2" = "overwrite" ]; then
	sudo -u hdfs hadoop fs -put -f $sourcedir/$objects_name $hdfs_path
elif [ "$2" = "append" ]; then
	dir_ts=$(get_dir_ts "$1")
	sudo -u hdfs hadoop fs -mkdir /raw/$1/$dir_ts
	sudo -u hdfs hadoop fs -put -f $sourcedir/$objects_name /raw/$1/$dir_ts
else
	sudo -u hdfs hadoop fs -put $sourcedir/$objects_name $hdfs_path
fi
