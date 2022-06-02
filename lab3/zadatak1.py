#!/usr/bin/env python3

# pokretanje: ./zadatak1.py files/matrice.txt files/matrice_rez.txt

from sys import argv

def check_args():
    if len(argv) != 3:
        print("Krivi broj argumenata!")
        exit(1)

def load_matrices(in_path):
    m1 = {}
    m2 = {}
    matrices = {1: m1, 2: m2}
    dimensions = {1: None, 2: None}
    with open(in_path, "r") as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]
        values = [line.split() for line in lines]
        mat = 0
        for index in range(len(values)):
            v = values[index]
            if len(v) == 0:
                pass
            elif len(v) == 2:
                mat += 1
                for i in range(int(v[0])):
                    for j in range(int(v[1])):
                        matrices[mat][(i, j)] = 0
                dimensions[mat] = (i, j)
            elif len(v) == 3:
                if mat in [1, 2]:
                    matrices[mat][(int(v[0]), int(v[1]))] = int(v[2])
                else:
                    print("Nešto je pošlo po krivu!")
                    exit(1)
            else:
                print("Krivi broj elemenata u datoteci!")
                exit(1)

        return m1, m2, dimensions[1], dimensions[2]

def store_matrix(m3, dimensions, out_path):
    with open(out_path, 'w') as f:
        f.write(f'{dimensions[0] + 1} {dimensions[1] + 1}\n')
        for key in m3:
            if m3[key] != 0:
                f.write(f'{key[0]} {key[1]} {m3[key]}\n')

def multiply_matrices(m1, m2, dim_m1, dim_m2):
    if dim_m1[1] != dim_m2[0]:
        print("Matrice nisu ulančane!")
        exit(1)
    m3 = {}
    for i in range(dim_m1[0] + 1):
        for j in range(dim_m2[1] + 1):
            m3[(i, j)] = 0

    n = dim_m1[1]
        
    for i in range(dim_m1[0] + 1):
        for j in range(dim_m2[1] + 1):
            for k in range(n + 1):
                if (i, k) in m1 and (k, j) in m2:
                    m3[(i, j)] += m1[(i, k)] * m2[(k, j)]
    
    return m3

def print_matrix(m, dimensions, label):
    print(f'{label}:')
    for i in range(dimensions[0] + 1):
        for j in range(dimensions[1] + 1):
            print("%8.2f" % m[(i, j)], end="")
        print()
    print()

if __name__ == "__main__":
    check_args()
    in_path = argv[1]
    out_path = argv[2]
    m1, m2, dim_m1, dim_m2 = load_matrices(in_path)
    m3 = multiply_matrices(m1, m2, dim_m1, dim_m2)
    dim_m3 = (dim_m1[0], dim_m2[1])
    print_matrix(m1, dim_m1, "A")
    print_matrix(m2, dim_m2, "B")
    print_matrix(m3, dim_m3, "A*B")
    store_matrix(m3, dim_m3, out_path)