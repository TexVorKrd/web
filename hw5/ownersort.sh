#!/bin/bash

prefix=$(date +%Y-%m-%d_%H:%M:%S)

if [ -d rez ]
        then
                echo Dir [rez] is ready
        else
                mkdir rez
                echo Dir [rez] for copy files has been cgeated
fi

mypath="./rez/$prefix"
mkdir $mypath

ls -a | cat >"$mypath/filelist"

filelist=$(cat "$mypath/filelist")

for filename in $filelist
        do
                curobj="$mypath/$filename"
                curuser=$(stat -c%U $filename)
                #Проверяем что объект не директория
                if [ ! -d $filename ]
                        then
                                userfolder="$mypath/$curuser"
                                if [ ! -d $userfolder ]
                                        then
                                                mkdir $userfolder
                                fi
                        cp $filename "$userfolder"

                fi
        done
rm "$mypath/filelist"
echo Копирование успешно завершено
