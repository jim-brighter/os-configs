#!/bin/bash
set -ex

cd ~
curl -LO https://github.com/vinceliuice/matcha/archive/master.zip
unzip -q master.zip
rm master.zip
cd matcha-master
chmod +x Install
./Install

cd ~
curl -LO https://github.com/KaizIqbal/Bibata_Cursor/archive/master.zip
unzip -q master.zip
rm master.zip
cd Bibata_Cursor-master
chmod +x build.sh
./build.sh
chmod +x ./Installer_Bibata.sh
./Installer_Bibata.sh
