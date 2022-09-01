#!/bin/bash

cd $HOME || exit 1
if [ -f "$PREFIX/bin/zex" ]; then
    rm $PREFIX/bin/zex
fi
folderPath="$HOME/.ElaXan/AnimeGamePatch"
if [ -d "$folderPath" ]; then
    rm -rf "$folderPath"
fi
if [ ! -d "ElaXan" ]; then
    mkdir .ElaXan
fi
if ! command -v git &> /dev/null; then
    sudo apt install git -y
fi
clear
echo "Download Script..."
sleep 1s
if [ -d "$HOME/AnimeGamePatch" ]; then
    rm -rf $HOME/AnimeGamePatch
fi
git clone https://github.com/ElaXan/AnimeGamePatch.git
if [[ $? != 0 ]]; then
    echo "Install Failed!"
    exit 1
fi
clear
cd $folderName
ln -sv $folderPath/zex.sh $PREFIX/bin/zex
chmod +x $PREFIX/bin/zex
sleep 1s
rm -rf AnimeGamePatch
if [ -f "$PREFIX/bin/zex" ]; then
    echo "Install Success!!"
    echo "now enter command : zex"
    exit
else
    echo "Install Failed!"
    exit
fi
