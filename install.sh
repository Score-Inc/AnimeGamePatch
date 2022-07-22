#!/bin/bash

command cd
ZPATH=/data/data/com.termux/files/usr/bin/zex
pkg install git -y
if ! command -v git &> /dev/null; then
    echo "failed!"
    exit
fi
if [[ -d $HOME/AnimeGamePatch ]]; then
    rm -rf $HOME/AnimeGamePatch
fi
git clone https://github.com/ElaXan/AnimeGamePatch.git
cd AnimeGamePatch
mv zex.sh $ZPATH
chmod +x $ZPATH
command cd
rm -rf AnimeGamePatch
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
