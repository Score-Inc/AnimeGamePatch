#!/bin/bash

clear

greenColorBack="$(printf '\033[4;42m')"
redColorBack="$(printf '\033[4;41m')"
yellowColorBack="$(printf '\033[4;43m')"
whiteColorBack="$(printf '\033[4;47m')"
blueColorBack="$(printf '\033[4;44m')"
purpleColorBack="$(printf '\033[4;45m')"
cyanColorBack="$(printf '\033[4;46m')"
blackColorBack="$(printf '\033[4;40m')"
greenColorBold="$(printf '\033[1;32m')"
redColorBold="$(printf '\033[1;31m')"
yellowColorBold="$(printf '\033[1;33m')"
whiteColorBold="$(printf '\033[1;37m')"
blueColorBold="$(printf '\033[1;34m')"
purpleColorBold="$(printf '\033[1;35m')"
cyanColorBold="$(printf '\033[1;36m')"
blackColor="$(printf '\033[0;30m')"
whiteColor="$(printf '\033[0;37m')"

whoMadeThis() {
echo -e "========================================\n
               ZEX HERE\n
----------------------------------------\n
Script was made by @ElashXander (Telegram)\n
----------------------------------------\n
========================================"
}

errpath=$HOME/.config/zex

logsavedcredit() {
  command echo "Code made by @ElashXander (Telegram)" > $errpath/$1
}
if [[ ! -d $HOME/.config ]]; then
  mkdir $HOME/.config
fi

if [[ -d $errpath ]]; then
  echo "Folder already created!"
  sleep 0.5
  command clear
else
  mkdir $errpath
fi
installsomeprogram() {
  echo "Install important program [PLEASE WAIT]"
  sleep 1
  command pkg install python wget rustc-dev nano -y
  checkimpprog=$?
  if [[ $? != 0 ]]; then
    command clear
    whoMadeThis
    echo "Install failed :("
    touch $errpath/inssomeprogerr
    logsavedcredit "inssomeprogerr"
  else
    command clear
    whoMadeThis
    echo "Install success"
    touch $errpath/inssomeprogsucc
    logsavedcredit "inssomeprogsucc"
    if [[ -f $errpath/inssomeprogerr ]]; then
      rm $errpath/inssomeprogerr
    fi
  fi
}

ensurepipup() {
  echo "Ensurepip"
  sleep 1
  command python3 -m ensurepip --upgrade &> /sdcard/zlog.txt
  checkensure=$?
  if [[ $? != 0 ]]; then
    echo "ensurepip failed :("
    touch $errpath/enpiperr &> /sdcard/zlog.txt
    logsavedcredit "enpiperr"
  else
    echo "Ensurepip success"
    touch $errpath/enpipsucc &> /sdcard/zlog.txt
    logsavedcredit "enpipsucc"
    if [[ -f $errpath/Ensurepip ]]; then
      rm $errpath/enpiperr
    fi
  fi
}

installpipx() {
  command cd
  echo "Install pipx"
  sleep 1
  command python3 -m pip install --user pipx &> /sdcard/zlog.txt
  checkpypipx=$?
  if [[ $? != 0 ]]; then
    echo "Install pipx Failed :("
    touch $errpath/inspipxerr
    logsavedcredit "inspipxerr"
  else
    echo "Install pipx success"
    touch $errpath/inspipxsucc
    logsavedcredit "inspipxsucc"
    if [[ -f $errpath/inspipxerr ]]; then
      rm $errpath/inspipxerr
    fi
  fi
}

pyensurepipx() {
  echo "ensurepath pipx"
  sleep 1
  command python3 -m pipx ensurepath &> /sdcard/zlog.txt
  checkensurepath=$?
  if [[ $? != 0 ]]; then
    echo "ensurepath pipx is failed :("
    touch $errpath/enspipxerr
    logsavedcredit "enspipxerr"
  else
    echo "ensurepath pipx is success"
    touch $errpath/enspipxsucc
    logsavedcredit "enspipxsucc"
    if [[ -f $errpath/enspipxerr ]]; then
      rm $errpath/enspipxerr
    fi
  fi
}

runProgram() {
    sleep 2
    echo "Update and Upgrade PKG"
    sleep 1
    command pkg upgrade -y
    checkpkg=$?
    command cd
    if [[ -f $errpath/inssomeprogsucc ]]; then
      command clear
      whoMadeThis
      echo "Program already installed"
      checkimpprog=1
    else
      installsomeprogram
    fi
    sleep 1
    if [[ $checkimpprog = 1 ]]; then
      command clear
      whoMadeThis
      echo "Update and Upgrade PKG"
      echo "Program already installed"
    else
      command clear
      whoMadeThis
      echo "Update and Upgrade PKG"
      echo "Install important program"
    fi
    sleep 1
    if [[ -f $errpath/enpipsucc ]]; then
      echo "ensurepip already upgrade"
      checkensure=1
    else
      ensurepipup
    fi
    sleep 1
    if [[ -f $errpath/inspipxsucc ]]; then
      echo "Already install pipx"
      checkpypipx=1
    else
      installpipx
    fi
    sleep 1
    if [[ -f $errpath/pyensurepipx ]]; then
      echo "Skip for ensurepipx"
    else
      pyensurepipx
    fi
    sleep 1
    if [[ $checkpkg != 0 ]]; then
        zcheckpkg="${redColorBold}Failed Update (Error)${whiteColor}"
    else
        zcheckpkg="${greenColorBold}Update Successfully${whiteColor}"
    fi

    if [[ $checkimpprog != 0 ]]; then
        if [[ $checkimpprog = 1 ]]; then
          zcheckimpprog="${greenColorBold}Program already installed${whiteColor}"
        else
          zcheckimpprog="${redColorBold}Install Failed (Error)${whiteColor}"
        fi
    else
        zcheckimpprog="${greenColorBold}Install Successfully${whiteColor}"
    fi

    if [[ $checkensure != 0 ]]; then
        if [[ $checkensure = 1 ]]; then
          zcheckensure="${greenColorBold}ensure already upgrade${whiteColor}"
        else
          zcheckensure="${redColorBold}Upgrade Failed (Error)${whiteColor}"
        fi
    else
        zcheckensure="${greenColorBold}Upgrade Successfully${whiteColor}"
    fi

    if [[ $checkpypipx != 0 ]]; then
        if [[ $checkpypipx = 1 ]]; then
          zcheckpypipx="${greenColorBold}already installed${whiteColor}"
        else
          zcheckpypipx="${redColorBold}Install Failed (Error)${whiteColor}"
        fi
    else
        zcheckpypipx="${greenColorBold}Install Successfully${whiteColor}"
    fi

    if [[ $checkensurepath != 0 ]]; then
        zcheckensurepath="${redColorBold}Add path Failed (Error)${whiteColor}"
    else
        zcheckensurepath="${greenColorBold}Add path Successfully${whiteColor}"
    fi
}
pkgyfix() {
    command sed -i "s/.*/deb https:\/\/termux.astra.in.ua\/apt\/termux-main stable main/g" /data/user/0/com.termux/files/usr/etc/apt/sources.list
    if [[ $? != 0 ]]; then
        echo "Unknown Error"
        exit
    else
        pkgyfixlog="1"
        rm -rf $errpath/*
        runProgram
    fi
}

pkgerrfix() {
    if [[ $pkgyfixlog = "1" ]]; then
      echo "${redColorBold}Can't fix the error!${whiteColor}"
      exit
    else
      echo -e "\nThere is ERROR\n"
      read -p "Want try to fix it? (y/n) : " pkgfixerr
      case $pkgfixerr in
        "y" ) pkgyfix
            ;;
        "n" ) echo "Okay!, try fix by yourself using termux-change-repo"
            ;;
        * ) echo "wrongInput!"
            ;;
      esac
    fi
}
whoMadeThis
runProgram
clear
whoMadeThis
sleep 1
if [[ $checkimpprog = 1 ]]; then
  checkimpprog=0
fi

if [[ $checkensure = 1 ]]; then
  checkensure=0
fi

if [[ $checkpypipx = 1 ]]; then
  checkpypipx=0
fi

if [[ $checkpkg != 0 ]] || [[ $checkimpprog != 0 ]] || [[ $checkensure != 0 ]] || [[ $checkpypipx != 0 ]] || [[ $checkensurepath != 0 ]]; then
    echo -e "Results :\nUpdate and Upgrade PKG = $zcheckpkg\n\nInstall important program = $zcheckimpprog\n\nEnsurepip = $zcheckensure\n\nInstall pipx = $zcheckpypipx\n\nensure pipx = $zcheckensurepath"
    sleep 2
    if [[ $checkpkg != 0 ]]; then
        pkgerrfix
    else
        echo -e "\nThere is ERROR!\nTry exit the Termux and open it again.\n1. try run command manualy for python3 -m pip install --user pipx\nThen run command bash AnimeGamePatch/install.sh\n\nor Join Discord Server for Help\nhttps://discord.gg/GenshinPS"
        exit
    fi
else
    echo -e "Results :\nUpdate and Upgrade PKG = $zcheckpkg\n\nInstall important program = $zcheckimpprog\n\nEnsurepip = $zcheckensure\n\nInstall pipx = $zcheckpypipx\n\nensure pipx = $zcheckensurepath"
    sleep 2
    echo -e "\nDone for now. Please exit the termux or make new session"
    echo "Exit : Exit then open it again enter the command bash AnimeGamePatch/install2.sh"
    echo -e "\nSession : Make new session then enter the command bash AnimeGamePatch/install2.sh"
    exit
fi

