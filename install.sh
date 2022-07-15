#!/bin/bash

clear
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
        zcheckpkg="Failed Update (Error)"
    else
        zcheckpkg="Update Successfully"
    fi

    if [[ $checkimpprog != 0 ]]; then
        if [[ $checkimpprog = 1 ]]; then
          zcheckimpprog="Program already installed"
        else
          zcheckimpprog="Install Failed (Error)"
        fi
    else
        zcheckimpprog="Install Successfully"
    fi

    if [[ $checkensure != 0 ]]; then
        if [[ $checkensure = 1 ]]; then
          zcheckensure="ensure already upgrade"
        else
          zcheckensure="Upgrade Failed (Error)"
        fi
    else
        zcheckensure="Upgrade Successfully"
    fi

    if [[ $checkpypipx != 0 ]]; then
        if [[ $checkpypipx = 1 ]]; then
          zcheckpypipx="pipx already installed"
        else
          zcheckpypipx="Install Failed (Error)"
        fi
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
        echo -e "\nThere is ERROR!\nTry exit the Termux and open it again. run command bash AnimeGamePatch/install.sh\n\nor Join Discord Server for Help\nhttps://discord.gg/GenshinPS"
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

