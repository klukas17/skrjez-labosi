#!/bin/bash

# pokretanje: ./zadatak6.sh Testovi/dir1 Testovi/dir2

if [ ! $# -eq 2 ]
then
    echo "Two arguments are required!"
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "First directory not found!"
    exit 1
fi

if [ ! -d "$2" ]
then
    echo "Second directory not found!"
    exit 1
fi

for f in $(ls $1)
do 
    if [ ! -e "$2/$f" -o "$1/$f" -nt "$2/$f" ]
    then
        echo "$1/${f} --> $2"
    fi
done

for f in $(ls $2)
do 
    if [ ! -e "$1/$f" -o "$2/$f" -nt "$1/$f" ]
    then
        echo "$2/${f} --> $1"
    fi
done