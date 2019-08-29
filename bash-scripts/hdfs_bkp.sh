#!/bin/bash

source /usr/etc/conf/$1/$1_config

# Get day, month and year
day=`date +%x | cut -c4-5`
month=`date +%x | cut -c1-2`
year=`date +%x | cut -c7-10`
hour=`date +%x_%H:%M:%S:%N | cut -c12-13`
minute=`date +%x_%H:%M:%S:%N | cut -c15-16`
second=`date +%x_%H:%M:%S:%N | cut -c18-19`

# Concatenate day,month, year into ts variable
ts=$day$month$year$hour$minute$second

# Get datasoruce_timestamp
datasource_ts=${datasource}_${ts}

# timestamped directory
ts_dir=/backup/$datasource/$datasource_ts

# Source directory
source_dir=/raw/$datasource

# Create timestamped directory 
sudo -u hdfs hadoop fs -mkdir $ts_dir

# Copy files to timestamped directory
sudo -u hdfs hadoop fs -cp $source_dir $ts_dir
