#!/bin/bash

command cd
folderInstall="zexIns"
ZPATH=/data/data/com.termux/files/usr/bin/zex
pkg install wget -y
if ! command -v wget &> /dev/null; then
    echo "failed!"
    exit
fi
mkdir $folderInstall
cd $folderInstall
wget https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/zex.sh
mv zex.sh $ZPATH
chmod +x $ZPATH
command cd
rm -rf $folderInstall
if ! command -v zex &> /dev/null; then
    clear
    echo "Install Failed!"
    exit
else
    clear
    echo "Install Success!"
    sleep 1s
    echo "Please type command zex"
fi
