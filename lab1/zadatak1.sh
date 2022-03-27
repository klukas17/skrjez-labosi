#!/bin/bash

# 1. točka
proba="Ovo je proba"
echo ""

# 2. točka
echo $proba
echo ""

# 3. točka
lista_datoteka=*
echo $lista_datoteka
echo ""

# 4. točka
proba3="${proba}. ${proba}. ${proba}."
echo $proba3
echo ""

# 5. točka
a=4
b=3
c=7
d=$(($((a+4))*$((b%c))))
echo "a=$a, b=$b, c=$c, d=$d"
echo ""

# 6. točka
broj_rijeci=$(wc -w *.txt | tail -n 1 | cut -d " " -f 2)
echo $broj_rijeci
echo ""

# 7. točka
echo $(ls ~)
echo ""