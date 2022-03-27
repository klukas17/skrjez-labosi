#!/bin/bash

# 1. točka
grep -i -E "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt
echo ""

# 2. točka
grep -i -v -E "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt
echo ""

# 3. točka
# promijeni projekti u ~/projekti
grep -E -r "[A-Z]{3}[0-9]{6}" ~/projekti
echo ""

# 4. točka
find . -ls -mtime +7 -mtime -14
echo ""

# 5. točka
for i in {1..15}; do echo -n "$i "; done; echo ""
for i in $(seq 15); do echo -n "$i "; done; echo ""
echo ""

# 6. točka
kraj=15
for ((i=1; i<=kraj; i++)); do echo -n "$i "; done; echo ""
for i in $(seq ${kraj}); do echo -n "$i "; done; echo ""
echo ""