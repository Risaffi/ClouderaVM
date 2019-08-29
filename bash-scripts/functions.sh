get_ts () {

# Get day, month, year, hour, minute, second

	day=`date +%x | cut -c4-5`
	month=`date +%x | cut -c1-2`
	year=`date +%x | cut -c7-10`
	hour=`date +%x_%H:%M:%S:%N | cut -c12-13`
	minute=`date +%x_%H:%M:%S:%N | cut -c15-16`
	second=`date +%x_%H:%M:%S:%N | cut -c18-19`

# Concatenate day,month, year into ts variable

	echo $day$month$year$hour$minute$second
}

get_dir_ts () {
	
	ts=$(get_ts)
	dir_name_ts=$1
	echo $1_$ts
}

create_dir_ts () {
	ts=$(get_ts)

# Get timestamped directory name
	dir_name_ts=$1_$ts

# Create timestamped directory
	sudo -u hdfs hadoop fs -mkdir /raw/$1/$dir_name_ts
}
