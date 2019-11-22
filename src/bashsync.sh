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
	if [ $answer = "y" ] || [ $answer = "Y" ]
	then
		echo "Starting syncing job..."
	else 
		echo "Finished"
		exit 1
	fi
fi
echo "Copying from $from"
for file in $( find $from -mindepth 1 -maxdepth 1)
do
	filename=$( basename  $file )
	cp -i $file $to/$filename
done
echo "Copying from $to"
for file in $( find $to -mindepth 1 -maxdepth 1)
do
	filename=$( basename  $file )
	cp -i $file $from/$filename
done
#все это тупо ибо можно всю папку скопировать
#и будет типо: cp -i $from/* $to
#              cp -i &to/* $from
#а так как аутисты наложили 10 строк кода, мда.....



