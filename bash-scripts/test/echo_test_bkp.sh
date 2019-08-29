#!/bin/bash

# Usage:
# <datasource> <overwrite>

# Get datasource name
datasource=$1

# Get file location
confdir=/usr/etc/conf/$datasource

objects_path=$confdir/${datasource}_objects
objects_name=$(cat $objects_path)

sourcedir=/home/cloudera/Downloads/$datasource

# Get HDFS Path
hdfs_path=/raw/$datasource

# Put in HDFS

if [ "$2" = "overwrite" ]; then
	sudo -u hdfs hadoop fs -put -f $sourcedir/$objects_name $hdfs_path
else
	sudo -u hdfs hadoop fs -put $sourcedir/$objects_name $hdfs_path
fi
