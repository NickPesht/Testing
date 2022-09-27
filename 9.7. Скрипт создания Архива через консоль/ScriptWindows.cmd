SET archivator="C:\Program Files\7-Zip\7z.exe"

md Pesht
cd Pesht
echo "Hello!" > 1.txt
copy 1.txt 2.txt
cd ..

%archivator% a -tzip -mx3 -r0 Pesht

rd /s /q Pesht