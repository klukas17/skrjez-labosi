#!/usr/bin/env python3

# pokretanje: ./zadatak2.py files/hipoteze.txt

from sys import argv

def check_args():
    if len(argv) != 2:
        print("Krivi broj argumenata!")
        exit(1)

def parse(file_path):
    print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
    with open(file_path, 'r') as f:
        lines = f.readlines()
        index = 0
        for line in lines:
            line = line.strip()
            line = line.split()
            values = []
            for el in line:
                values.append(float(el))
            values.sort()

            index += 1
            if index < 10:
                print(f'00{index}', end='')
            elif index < 100:
                print(f'0{index}', end='')
            else:
                print(f'{index}', end='')

            for i in range(1, 10):
                val = values[int(i / 10 * len(values)) - 1]
                print(f'#{"%.1f" % val}', end='')
            
            print()

if __name__ == "__main__":
    check_args()
    parse(argv[1])