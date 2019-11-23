#!/bin/bash
echo "bashsync"
#здесь поменять шоб одно из переменных указывало на usb
from=$1
to=$2
#проверка на пустоту строк
if [ -z $from ] || [ -z $to ]
then 
	echo "You should specify directories first"
	exit 2
#проверка на существование каталогов
elif [ ! -d $from ] || [ ! -d $to ]
then
	echo "There's no such directory"
	exit 3
else
	echo "You are going to sync your stuff"
	echo "between $from"
	echo "and $to"
	read -p "Proceed? (Y/N): " answer
	#ниже лучше поменять на регулярку в [[]] ибо как аут написал
	if [[ $answer==[yY] ]]
	then
		echo "Starting syncing job..."
	else 
		echo "Finished"
		exit 1
	fi
fi
echo "Copying from $from"
cp -i -R $from/* $to
echo "Copying from $to"
cp -i -R -n $to/* $from




