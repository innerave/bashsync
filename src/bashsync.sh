#!/bin/bash
while read -r line
do
	arr=( $line )
	if [ ${arr[0]} == 1 ] && [[ ${arr[1]} == sd[a-Z][0-9] ]]
	then
		from=${arr[2]}
	fi
done <<< $( lsblk -n -l -o HOTPLUG,NAME,MOUNTPOINT )
to=$1
#проверка на пустоту строк
if  [ -z $to ]
then 
<<<<<<< HEAD
	echo "You should specify directory first"
=======
	echo "You should specify directories first"
>>>>>>> 7e5dd976a63b3232c49badef5309f7be58ef2904
	exit 2
elif [ -z $from ] 
then
    echo "Check if usb is mounted"
    exit 3
#проверка на существование каталогов
elif [ ! -d $from ] || [ ! -d $to ]
then
	echo "There's no such directory"
<<<<<<< HEAD
	exit 4
=======
	exit 3
>>>>>>> 7e5dd976a63b3232c49badef5309f7be58ef2904
else
	echo "You are going to sync your stuff"
	echo "between $from"
	echo "and $to"
	read -p "Proceed? (Y/N): " answer
<<<<<<< HEAD
	echo $answer
	if [[ $answer == [yY] ]]
=======
	#ниже лучше поменять на регулярку в [[]] ибо как аут написал
	if [[ $answer==[yY] ]]
>>>>>>> 7e5dd976a63b3232c49badef5309f7be58ef2904
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
<<<<<<< HEAD
=======




>>>>>>> 7e5dd976a63b3232c49badef5309f7be58ef2904
