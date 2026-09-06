#!/bin/bash

# Part 1.1 to 1.4
pwd
ls -la
mkdir practice_cli
cd practice_cli

# Part 1.5 to 1.8
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt

# Part 2.9 to 2.11
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs

# Part 3.12 to 3.14
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt

# Part 4.16 to 4.19
whoami
date
ps aux
pgrep bash

# Part 5.20
cd ..
rm -rf practice_cli