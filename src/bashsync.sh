function copyfile {
arg1=$1
arg2=$2
if [ "${arg1: -1}" = "/" ]
then
echo "${arg1: -1}";
arg1=${arg1%?}
fi
if [ "${arg2: -1}" = "/" ]
then
echo "${arg2: -1}";
arg2=${arg2%?}
fi
fromlen="${#arg1}";
for line in $( find $arg1/* )
do
    file="${line:fromlen+1}";
    if [ -f "$arg2/$file" ]
    then
        arr1=$( ls -g "$line" );
        arr2=$( ls -g "$arg2/$file" );
        arr1=( $arr1 );
        arr2=( $arr2 );
        echo "$file changed:";
        echo "in $arg1";
        echo "at ${arr1[4]} ${arr1[5]} ${arr1[6]}";
        echo "in $arg2";
        echo "at ${arr2[4]} ${arr2[5]} ${arr2[6]}";
        read -p "Which to rewrite? (1/2/N): " answer
        if [ "$answer" == "1" ]
        then
            cp -R "$line" "$arg2/$file"  
            echo "Copied 1-st"
        elif [ "$answer" == "2" ]
        then
            cp -R "$arg2/$file" "$line"  
            echo "Copied 2-nd"
        else
        continue
        fi
        continue
    fi
    cp -i "$line" "$arg2/$file" 
done
}

from=$1
to=$2
#проверка на пустоту строк
if  [ -z $to ] || [ -z $from ]
then 
	echo "You should specify directories"
	exit 2
#проверка на существование каталогов
elif [ ! -d $from ] || [ ! -d $to ]
then
	echo "There's no such directory"
	exit 4
else
	echo "You are going to sync your stuff"
	echo "between $from"
	echo "and $to"
	read -p "Proceed? (Y/N): " answer
	echo $answer
	if [[ $answer == [yY] ]]
	then
		echo "Starting syncing job..."
	else 
		echo "Finished"
		exit 1
	fi
fi
copyfile $from $to;
cp -n -R $to/* $from
