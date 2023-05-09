#!/bin/bash

directory=$1
if [ -z $1 ]
        then
                echo Param is empty
                exit
fi

cd $directory 2>> err.log
test=$?

if [ $test == '0' ]
        then
                echo Path is Ok. Finding files for del
                ls -a | grep -P "\.bak" | cat >listfordel
                ls -a | grep -P "\.tmp" | cat >>listfordel
                ls -a | grep -P "\.backup" | cat >>listfordel
                echo Следующие файлы будут удалены
                listfile=$(cat listfordel)
                echo $listfile
                for h in $listfile
                do
                        rm $h
                done
                rm listfordel
        else
                echo Bad Path
                exit
fi
