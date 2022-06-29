#!/bin/bash

clear
whoMadeThis() {
echo -e "========================================\n
               ZEX HERE\n
----------------------------------------\n
Script was made by @ElashXander (Telegram)\n
----------------------------------------\n
Any support join Discord\n
https://discord.gg/GenshinPS\n
========================================"
}

runProgram() {
    sleep 2
    echo "Update and Upgrade PKG"
    sleep 1
    command pkg upgrade -y
    checkpkg=$?
    command cd
    echo "Install important program [PLEASE WAIT]"
    sleep 1
    command pkg install python wget rustc-dev nano apktool apksigner -y
    checkimpprog=$?
    sleep 1
    command cd
    command clear
    whoMadeThis
    echo "Update and Upgrade PKG"
    echo "Install important program"
    echo "Ensurepip"
    sleep 1
    command python3 -m ensurepip --upgrade &> /sdcard/zlog.txt
    checkensure=$?
    sleep 1
    command cd
    echo "Install pipx"
    sleep 1
    command python3 -m pip install --user pipx &> /sdcard/zlog.txt
    checkpypipx=$?
    sleep 1
    echo "ensure pipx"
    sleep 1
    command python3 -m pipx ensurepath &> /sdcard/zlog.txt
    checkensurepath=$?
    sleep 1
    if [[ $checkpkg != 0 ]]; then
        zcheckpkg="Failed Update (Error)"
    else
        zcheckpkg="Update Successfully"
    fi

    if [[ $checkimpprog != 0 ]]; then
        zcheckimpprog="Install Failed (Error)"
    else
        zcheckimpprog="Install Successfully"
    fi

    if [[ $checkensure != 0 ]]; then
        zcheckensure="Upgrade Failed (Error)"
    else
        zcheckensure="Upgrade Successfully"
    fi

    if [[ $checkpypipx != 0 ]]; then
        zcheckpypipx="Install Failed (Error)"
    else
        zcheckpypipx="Install Successfully"
    fi

    if [[ $checkensurepath != 0 ]]; then
        zcheckensurepath="Add path Failed (Error)"
    else
        zcheckensurepath="Add path Successfully"
    fi
}
pkgyfix() {
    command sed -i "s/.*/deb https:\/\/termux.astra.in.ua\/apt\/termux-main stable main/g" /data/user/0/com.termux/files/usr/etc/apt/sources.list
    if [[ $? != 0 ]]; then
        echo "Unknown Error"
        exit
    else
        runProgram
    fi
}

pkgerrfix() {
    echo -e "\nThere is ERROR\n"
    read -p "Want try to fix it? (y/n) : " pkgfixerr
    case $pkgfixerr in
        "y" ) pkgyfix
            ;;
        "n" ) echo "Okay!, try fix by yourself using termux-change-repo"
            ;;
        * ) echo "Please enter y/n !"; pkgerrfix
            ;;
    esac
}
whoMadeThis
runProgram
clear
whoMadeThis
sleep 1
if [[ $checkpkg != 0 ]] || [[ $checkimpprog != 0 ]] || [[ $checkensure != 0 ]] || [[ $checkpypipx != 0 ]] || [[ $checkensurepath != 0 ]]; then
    echo -e "Results :\nUpdate and Upgrade PKG = $zcheckpkg\n\nInstall important program = $zcheckimpprog\n\nEnsurepip = $zcheckensure\n\nInstall pipx = $zcheckpypipx\n\nensure pipx = $zcheckensurepath"
    sleep 2
    if [[ $checkpkg != 0 ]]; then
        pkgerrfix
    else
        echo -e "\nThere is ERROR! Join Discord Server for Help\nhttps://discord.gg/GenshinPS"
        exit
    fi
else
    echo -e "Results :\nUpdate and Upgrade PKG = $zcheckpkg\n\nInstall important program = $zcheckimpprog\n\nEnsurepip = $zcheckensure\n\nInstall pipx = $zcheckpypipx\n\nensure pipx = $zcheckensurepath"
    sleep 2
    echo -e "\nDone for now. Please exit the termux or make new session"
    echo "Exit : Exit then open it again enter the command bash /sdcard/Download/install2.sh"
    echo -e "\nSession : Make new session then enter the command bash /sdcard/Download/install2.sh"
    exit
fi

