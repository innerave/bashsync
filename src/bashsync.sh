#!/bin/bash
#здесь поменять шоб одно из переменных указывало на usb
from=$1
to=$2
#проверка на пустоту строк
if [ -z $from ] || [ -z $to ]
then 
	echo "Empty string(s)"
	exit 2
#проверка на существование каталогов
elif [ ! -d $from ] || [ ! -d $to ]
then
	echo "Not a cataloge(s)"
	exit 3
else
	echo "Directory from = $from"
	echo "Directory to =$to"
	read -p "Continue? (Y/N): " answer
	#ниже лучше поменять на регулярку в [[]] ибо как аут написал
	if [ $answer = "y" ] || [ $answer = "Y" ]
	then
		echo "Start to find..."
	else 
		echo "Finish"
		exit 1
	fi
fi
echo "Copy from: $from"
for file in $( find $from -mindepth 1 -maxdepth 1)
do
	filename=$( basename  $file )
	cp -i $file $to/$filename
done
echo "Copy from: $to"
for file in $( find $to -mindepth 1 -maxdepth 1)
do
	filename=$( basename  $file )
	cp -i $file $from/$filename
done
#все это тупо ибо можно всю папку скопировать
#и будет типо: cp -i $from/* $to
#              cp -i &to/* $from
#а так как аутисты наложили 10 строк кода, мда.....