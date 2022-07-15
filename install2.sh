#!/data/user/0/com.termux/files/usr/bin/bash

command clear

whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\nScript was made by @ElashXander (Telegram)\n----------------------------------------\nAny support join Discord\nhttps://discord.gg/UfAC8dBD4p\n========================================"
}

certfile() {
    echo -e "Please download for android and save the certificate to /sdcard/Download\n"
    echo "Where the cert you download?"
    echo ""
    read -p "/sdcard/" whereisthecert
    if [[ $whereisthecert = "" ]]; then
      echo "Please enter the path!"
      command clear
      whoMadeThis
      certfile
    fi
    if [[ $whereisthecert = "Download" ]]; then
      echo "Are you kidding me?"
      command clear
      whoMadeThis
      certfile
    fi
}

zNextStep2() {
    command cd
    pathmynickname=/sdcard/Download/zexhere
    mkdir $pathmynickname
    clear
    whoMadeThis
    if [ -x "/data/data/com.termux/files/home/.local/bin/mitmdump" ]; then
        echo "file \"mitmdump\" is found!"
        sleep 2s
    else
        echo "Please exit termux, open, and enter the command"
        echo "bash AnimeGamePatch/install2.sh"
        exit
    fi
    if [[ -f "/sdcard/Download/mitmproxy-ca-cert.cer" ]]; then
        mv "/sdcard/Download/mitmproxy-ca-cert.cer" "/sdcard/Download/mitmproxy-ca-cert.cer.crt"
    fi
    sleep 1
    if [[ -f "/sdcard/Download/mitmproxy-ca-cert.cer.crt" ]]; then
        echo "Cool we found you download for Android!"
    else
        echo "We can't find for certificate in /sdcard/Download"
        exit
    fi
    sleep 2
    
    zRunProgram() {
        command cd
        mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
    }

    clear
    whoMadeThis
    sleep 1
    echo "        IMPORTANT"
    echo "When you install Genshin, Google Play Store Will Blocked to install reason Genshin Apk Unknown Developer. REASON WHY?? Because Genshin APK Sign by my Signature."
    echo ""
    echo "Just do allow for install"
    echo ""
    echo "No Virus, Already check with VirusTotal"
    echo "Here for the Link"
    echo "https://www.virustotal.com/gui/file/81aeb11b8e7ecadf218d90ac555310a8f2b21b478335834b31d62c89b03fa95e/detection"
    echo ""
    echo "It will be safe if you download files from Google Drive"
    echo "https://drive.google.com/file/d/184KGay4O9dWI_yjuyhTbAWtLlStOvfDo/view?usp=drivesdk"
    echo ""
    echo "  @ElashXander (Telegram)"
    echo "========================================"
    read -p "Enter for Continue"
    echo -e "You can install Genshin with name Genshin.apk in /sdcard/Download\nDon't close the Termux!"
    sleep 1
    echo "Cleaning [PLEASE WAIT!!]"
    rm -rf "$where_the_apk/zexhere"
    rm -rf "$where_the_apk/Genshin.apk.idsig"
    rm -rf "$where_the_apk/zex.apk"
    rm -rf "/sdcard/zlog.txt"
    rm -rf "/sdcard/zlog2.txt"
    echo "All Done!!!"
    sleep 1
    echo "Install Genshin Impact with name Genshin.apk in /sdcard/Download"
    echo "If already install and you open it."
    echo "Please Close it"
    echo "Need Hostname: 127.0.0.1 and Port : 8080 if not will not work"
    echo ""
    echo "if you want play again. Just run bash zex.sh"
    echo "Don't forget to settings your proxy and Port"
    pathtool=$HOME/AnimeGamePatch
    if [[ -f "$HOME/zex.sh" ]]; then
        echo "File already moved for zex.sh!"
    else
        if [[ -f "$pathtool/zex.sh" ]]; then
            mv $pathtool/zex.sh $HOME
            sleep 1
            echo "move zex.sh to Termux data (/data/data/com.termux)"
            sleep 2
        else
            echo "Please Download zex.sh!"
        fi
    fi

    if [[ -f "$HOME/zdom.sh" ]]; then
        echo "File already moved for zdom.sh!"
    else
        if [[ -f "$pathtool/zdom.sh" ]]; then
            mv $pathtool/zdom.sh $HOME
            sleep 1
            echo "move zdom.sh to Termux data (/data/data/com.termux)"
            sleep 2
        else
            echo "Please Download zdom.sh!"
        fi
    fi
    sleep 1
    echo "Open Genshin Now!!"
    sleep 2
    zRunProgram
}

logsavedcredit() {
  command echo "Code made by @ElashXander (Telegram)" > $errpath/$1
}

# =========== Install =========== #



exportcargo() {
  echo "Export CARGO_BUILD_TARGET"
  sleep 1
  export CARGO_BUILD_TARGET=aarch64-linux-android &> /sdcard/zlog.txt
  checkexport=$?
  if [[ $? != 0 ]]; then
    echo "Failed to export :("
  else
    echo "Export done!"
  fi
}

installmitmproxy() {
  echo -e "Install mitmproxy with pipx (This may take long time)\n[Make Coffee For Waiting This Shit]"
  sleep 1
  command pipx install mitmproxy
  checkpipxmitm=$?
  if [[ $? != 0 ]]; then
    echo "Install failed :("
  else
    echo "Install success"
  fi
}

downloadproxypy() {
  echo "Download proxy.py"
  command cd
  command wget https://gist.githubusercontent.com/exzork/8bbf5975bb9efab0a9c8a03a01dadd5e/raw/c2574d6f66798e65f2ed4709a69b43c6cecf60be/proxy.py &> /sdcard/zlog2.txt
  checkwgetdownload=$?
  if [[ $? != 0 ]]; then
    echo "Download failed :("
  else
    echo "Download Success"
  fi
}

editproxypy() {
  sleep 1
  echo "Edit proxy.py"
  sleep 1
  command cd
  if [[ -f "proxy.py" ]]; then
    sed -i 's/genshin.exzork.me/hk.elashxander.my.id/g' proxy.py
  else
    echo "File not found!"
  fi
  checkeditfile=$?
  if [[ $? != 0 ]]; then
    echo "Edit failed :("
    touch $errpath/edproxpyerr &> /sdcard/zlog2.txt
    logsavedcredit "edproxpyerr"
  else
    echo "Edit success"
    touch $errpath/edproxpysucc &> /sdcard/zlog2.txt
    logsavedcredit "edproxpysucc"
    if [[ -f $errpath/edproxpyerr ]]; then
      rm $errpath/edproxpyerr
    fi
  fi
}

deleteProgramY() {
  read -p "Are you sure? (y/n) : " areYouSure
  case $areYouSure in
    "y" | "yes" | "Y" ) command pkg remove apktool rustc-dev apksigner -y; command apt autoremove -y; echo -e "\nProgram success removed!"; exit;;
    "n" | "no" | "N" ) echo "Okay!, program will not be deleted!"; exit;;
    * ) echo "Wrong input!"; exit;;
  esac
}

clear

clearOrWhat="$1"

if [[ $clearOrWhat = "clear" ]]; then
  echo -e "You want clear the some program?. This will delete\n- apktool\n- apksigner\n- rustc-dev (java)\n"
  echo -e "Enter Y for delete this program"
  read -p "or N for not delete this : " deleteProgram
  case $deleteProgram in
    "y" | "Y" | "yes" ) deleteProgramY;;
    "n" | "n" | "no" ) echo "Okay will not be delete the program"; exit;;
    * ) echo "Wrong input!"; exit;;
  esac
elif [[ $clearOrWhat = "" ]]; then
  command clear
  noClear=true
elif [[ noClear = true ]]; then
  command clear
else
  echo "Wrong input!"
  exit
fi

errpath=$HOME/.config/zex
if [[ -d $errpath ]]; then
  echo "Folder already created!"
  sleep 0.5
else
  command mkdir $errpath
fi
command clear

whoMadeThis
sleep 0.3 
if [[ -f $errpath/expcargesucc ]]; then
  echo "Already export cargo"
  checkexport=1
else
  exportcargo
fi
sleep 1
if [[ -f $errpath/insinsmitmsucc ]]; then
  echo "Mitmproxy already installed"
  checkpipxmitm=1
else
  installmitmproxy
fi
sleep 1
if [[ -f $errpath/downproxysucc ]] || [[ -f $HOME/proxy.py ]]; then
  echo "proxy.py already downloaded"
  checkwgetdownload=1
else
  downloadproxypy
fi
sleep 1
if [[ -f $errpath/edproxpysucc ]]; then
  echo -e "File already edited\nOr use bash zdom.sh for change domain"
  checkeditfile=1
  sleep 1
else
  editproxypy
fi
sleep 2
clear
if [[ $checkexport != 0 ]]; then
    if [[ $checkexport = 1 ]]; then
      zcheckexport="Already do Export (Success)"
    else
    zcheckexport="Export Failed (Error)"
    fi
else
    zcheckexport="Export Successfully"
fi

if [[ $checkpipxmitm != 0 ]]; then
    if [[ $checkpipxmitm = 1 ]]; then
      zcheckpipxmitm="mitmproxy already installed"
    else
      zcheckpipxmitm="Install mitmproxy Failed (Error)"
    fi
else
    zcheckpipxmitm="Install mitmproxy Successfully"
fi

if [[ $checkwgetdownload != 0 ]]; then
    if [[ $checkwgetdownload = 1 ]]; then
      zcheckwgetdownload="proxy.py already downloaded"
    else
      zcheckwgetdownload="Download Proxy Failed (Error)"
    fi
else
    zcheckwgetdownload="Download Proxy Successfully"
fi

if [[ $checkeditfile != 0 ]]; then
    if [[ $checkeditfile = 1 ]]; then
      zcheckeditfile="proxy.py already edited"
    else
      zcheckeditfile="Edit Proxy Failed (Error)"
    fi
else
    zcheckeditfile="Edit Proxy Successfully"
fi
resultsinstall() {
  echo "Please Setting your WiFi or mobile data to Proxy"
  echo "Hostname : 127.0.0.1"
  echo "Port : 8080"
  echo "Download for Android there"
  echo "You will be offline (No Internet). Don't panic!"
  echo "This because Proxy."
  echo -e "You can turn off it or delete Proxy on WiFi Settings\n"
  read -p "Press enter for continue"
  echo -e "Download to /sdcard/Download\nFor code detect that you download it\n"
  read -p "Press enter for continue"
  echo -e "After open please wait 1 or 2 seconds\nand refresh it the site/browser!!!\n\nDon't share your certificate or error"
  echo ""
  read -p "Press enter for open the site"
  echo "good luck!"
  sleep 2
  termux-open-url http://mitm.it
  echo "CTRL + C Key for Continue"
  mitmdump --ssl-insecure > /sdcard/zlog.txt
  if [[ $? != 0 ]]; then
    echo "Error, will trying to remove the save that you already download it?"
    read -p "Enter Y or N : " removeSaveFile
    case $removdSaveFile in
        "Y" | "y" ) cd; cd .config/zex; rm *;;
        "N" | "n" ) echo "Okay!"; exit;;
    esac
  zNextStep2
}

whoMadeThis
sleep 1
echo -e "Results:\nExport Cargo = $zcheckexport\n\nInstall mitmproxy with pipx = $zcheckpipxmitm\n\nDownload proxy.py = $zcheckwgetdownload\n\nEdit proxy.py = $zcheckeditfile\n\n"
sleep 1
if [[ $checkexport = 1 ]]; then
  checkexport=0
fi
if [[ $checkpipxmitm = 1 ]]; then
  checkpipxmitm=0
fi
if [[ $checkwgetdownload = 1 ]]; then
  checkwgetdownload=0
fi
if [[ $checkeditfile = 1 ]]; then
  checkeditfile=0
fi

if [[ $checkexport != 0 ]] || [[ $checkpipxmitm != 0 ]] || [[ $checkwgetdownload != 0 ]] || [[ $checkeditfile != 0 ]]; then
  echo -e "There is Error\nJoin Discord Server and tag @Helper for Help\nhttps://discord.gg/GenshinPS"
  exit
else
  resultsinstall
fi
