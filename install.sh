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
    echo "Install Failed!"
    exit
else
    echo "Install Success!"
    echo "Now you can enter command zex ins"
fi
