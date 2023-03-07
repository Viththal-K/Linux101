#!/bin/bash

#Defining variables
BASE=~/Desktop/Basic
DEPTH=1
RUN=0

#Check if directory exists or not
if [ ! -d $BASE ]
then
	echo "Directory doesn't exist: $BASE"
	exit 1
fi

#Creating archive folder if it does not exist
if [ ! -d $BASE ]
then
	mkdir $BASE/archive
fi

#Finding files larger than 20MB
for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do
	if [ $RUN -eq 0 ]
	then
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done
