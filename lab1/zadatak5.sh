#!/bin/bash

# pokretanje: ./zadatak5.sh . '*.xpcfc'

echo "Provided arguments: $@"

if [ ! $# -eq 2 ]
then
    echo "Two arguments are required!"
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "Directory not found!"
    exit 1
fi

l=0

for f in $(find $1 -name "$2")
do
    # -l broji pojavljivanje newline, pa treba +1 da bi se ispravno izbrojao broj redaka
    l=$((l+$(cat $f | wc -l)+1))
done

echo $l