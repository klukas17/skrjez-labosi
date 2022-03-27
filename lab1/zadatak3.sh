#!/bin/bash

# pokretanje: ./zadatak3.sh logs

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

for f in $(ls ${1}/*[0-9][0-9][0-9][0-9]-02-*)
do
    echo $f | sed -r  "s/.*([0-9]{4})-([0-9]{2})-([0-9]{2}).*/datum: \3-\2-\1/"
    echo "--------------------------------------------------"
    cat $f | cut -d '"' -f 2 | sort | uniq -c | sort -n -r | sed -r "s/\s+([0-9]+)\s+(.*)/    \1 : \2/"
    echo ""
done