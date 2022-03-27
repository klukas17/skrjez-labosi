#!/bin/bash

# pokretanje: ./zadatak4.sh Testovi/Slike

if [ ! $# -eq 1 ]
then
    echo "One argument is required!"
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "Directory not found!"
    exit 1
fi

month=0
year=0
brojac=1
init=1

for photo in $(ls -1 "$1" | sort -n)
do
    photo_month=$(echo $photo | sed -r "s/[0-9]{4}([0-9]{2}).*/\1/")
    photo_year=$(echo $photo | sed -r "s/([0-9]{4})[0-9]{2}.*/\1/")
    if [ "$month" -ne "$photo_month" -o "$year" -ne "$photo_year" ]
    then
        month=$photo_month
        year=$photo_year
        if [ $init -eq 1 ]
        then
            init=0
        else
            echo "--- Ukupno: ${brojac} slika -----"
        fi
        echo ""
        echo "$month-$year :"
        echo "----------"
        brojac=1
    else
        brojac=$((${brojac}+1))
    fi
    echo "    ${brojac}. ${photo}"
done
echo "--- Ukupno: ${brojac} slika -----"