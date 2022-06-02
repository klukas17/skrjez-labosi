#!/usr/bin/env python3

from sys import argv

if len(argv) != 2:
    print("Krivi broj argumenata! Potrebno je unijeti 1 argument!")
    exit(1)

print("<UL> ")

with open(argv[1], "r") as f:
    lines = f.readlines()
    lines = [line.strip() for line in lines]

    tag = ""
    author = ""
    publisher = ""
    title = ""
    year = ""

    for line in lines:

        if line == "":
            continue
        
        elif line[0] == "@":
            author = ""
            publisher = ""
            title = ""
            year = ""
            tag = line.split("{")[1][:-1]

        elif line[0] == "}":
            print(f'    <LI> {author}, <I>{title}</I>, {publisher}, {year} ({tag})</LI> ')
            
        else:
            parts = line.split("=")
            for part in parts:
                part = part.strip()

            head = parts[0].lower().strip()

            if parts[1][-1] == ",":
                parts[1] = parts[1][:-1]

            parts[1] = parts[1].strip()

            if parts[1][0] in ['"', "'"] and parts[1][-1] in ['"', "'"]:
                parts[1] = parts[1][1:-1]

            if head == "author":
                author = parts[1]
            elif head == "publisher":
                publisher = parts[1]
            elif head == "title":
                title = parts[1]
            elif head == "year":
                year = parts[1]

print("</UL>")