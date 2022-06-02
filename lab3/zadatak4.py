#!/usr/bin/env python3

# pokretanje: ./zadatak4.py https://www.fer.unizg.hr/predmet/skrjez_a

from sys import argv
import urllib.request
import re

if len(argv) != 2:
    print("Krivi broj argumenata!")
    exit(1)

link = argv[1]

stranica = urllib.request.urlopen(link)
mybytes = stranica.read()
page = mybytes.decode("utf8")
print(page)

print("-" * 100)

print("LINKOVI NA DRUGE STRANICE:")
hosts = {}
for match in re.findall(r'href="http.*?"', page):
    m = re.search(r'"https?://((www.)?(.*?)(/.*)?)"', match)
    url = m.group(1)
    host = m.group(3)
    hosts[host] = 1 if host not in hosts else hosts[host] + 1
    print(f'\t{url}')

print("-" * 100)

print("HOSTOVI:")
for host in hosts.keys():
    print(f'\t{host}: {hosts[host]}')

print("-" * 100)

print("MAILOVI:")
mails = set()
for match in re.findall(r'([a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9.-]+)', page):
    mails.add(match)

for mail in mails:
    print(f'\t{mail}')

print("-" * 100)

print("LINKOVI NA SLIKE:")

print(len(re.findall(r'<img.*?>', page)))

print("-" * 100)