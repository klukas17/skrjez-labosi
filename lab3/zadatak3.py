#!/usr/bin/env python3

# pokretanje: ./zadatak3.py zad3_files

from sys import argv
from os import listdir

def check_args():
    if len(argv) != 2:
        print("Krivi broj argumenata!")
        exit(1)

def main(folder):
    students = {}
    with open(f'{folder}/studenti.txt', 'r') as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]
        for line in lines:
            line = line.split()
            students[line[0]] = {}
            students[line[0]][0] = f'{line[1]}, {line[2]}'

    max_lab = 0
    
    for file in listdir(folder):
        if file[:3] == "Lab":
            file_name = file
            file = file.split("_")
            lab = int(file[1])
            if lab > max_lab:
                max_lab = lab
            group = int(file[2].split(".")[0][1:])
            
            with open(f'{folder}/{file_name}', 'r') as g:
                l = g.readlines()
                l = [x.strip() for x in l]
                for el in l:
                    key, value = el.split()
                    if key in students and lab in students[key]:
                        print(f"Greška. Student {key} zabilježen više puta na labosu {lab}!")
                    else:
                        students[key][lab] = value

    print(f'{"%-15s" % "JMBAG"}{"%-30s" % "Prezime, Ime"}', end='')
    for i in range(1, max_lab+1):
        print(f'{"%-10s" % ("L" + str(i))}', end='')
    print()

    for key in students:
        student = students[key]
        print(f'{"%-15s" % key}{"%-30s" % student[0]}', end='')
        for i in range(1, max_lab + 1):
            if i in student:
                print(f'{"%-10s" % student[i]}', end='')
            else:
                print(f'{"%-10s" % "-"}', end='')
        print()

if __name__ == "__main__":
    check_args()
    main(argv[1])