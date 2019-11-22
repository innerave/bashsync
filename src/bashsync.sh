#!/bin/bash
from=$1
to=$2
if [ -z $from ] || [ -z $to ]
then 
	echo "Пустая строка"
	exit 2
else 
	echo "Starting to find..."
fi
for file in $( find "$from" -mindepth 1 -maxdepth 1)
do
	echo $file
done