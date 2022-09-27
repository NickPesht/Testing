#!/bin/bash

mkdir Pesht
cd Pesht
echo "Hello!" > 1.txt
cp 1.txt 2.txt
cd ..

zip -r -3 Pesht.zip Pesht

rm -r Pesht