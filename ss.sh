



#!/bin/bash

git log --oneline --all > ssresult.txt

git pull >  ssresult.txt

git checkout javid

cat javid.txt

echo > javid.txt "file.txt"

git add .

git commit -m  " file.txt"

git checkout main

git merge javid


