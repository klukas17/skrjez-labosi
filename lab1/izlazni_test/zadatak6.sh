#!/bin/bash

if [ ! $# -eq 1 -a ! $# -eq 2 ]
then
    echo "Krivi broj argumenata!"
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "Direktorij nije pronađen!"
    exit 1
fi

broj=0

if [ $# -eq 2 ]
then
    broj=$2
else
    broj=6
fi

for f in $(find $1); do
    if [ -f $f ]; then
        brojac=0
        echo "Ime skripte: $f"
        echo "-----------------------------"
        while read l; do
            brojac=$((${brojac}+1))
            if [ $brojac -le $broj ]; then
                echo $l
            fi
        done < $f
        echo ""
    fi
done