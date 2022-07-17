#!/data/data/com.termux/files/usr/bin/bash

# SCRIPT NOT ENCRYPTED FOR YOU CAN LEARN THE CODE BASH / SHELL SCRIPT.
# THIS CODE IS FREE
# CODE STILL DEVELOPMENT FOR FIX SOME CODE AND ADD CODE.


# THANKS TO @CharonCB21 (Telagram) for Helping me about this

userInput1=$1
nameScript=$(basename $0)


# ================== Install.sh START ================== #

install1() {

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
  echo "${cyanColorUnder}Install important program [PLEASE WAIT]${whiteColor}"
  sleep 1
  command pkg install python wget rustc-dev nano -y
  checkimpprog=$?
  if [[ $? != 0 ]]; then
    command clear
    whoMadeThis
    echo "${redColorBold}Install failed :(${whiteColor}"
  else
    command clear
    whoMadeThis
    echo "${greenColorBold}Install success :)${whiteColor}"
  fi
}

ensurepipup() {
  echo "${cyanColorUnder}Ensurepip${whiteColor}"
  sleep 1
  command python3 -m ensurepip --upgrade &> /sdcard/zlog.txt
  checkensure=$?
  if [[ $? != 0 ]]; then
    echo "${redColorBold}ensurepip Upgrade failed :(${whiteColor}"
  else
    echo "${greenColorBold}ensurepip Upgrade success :)${whiteColor}"
  fi
}

installpipx() {
  command cd
  echo "Install pipx"
  sleep 1
  command python3 -m pip install --user pipx &> /sdcard/zlog.txt
  checkpypipx=$?
  if [[ $? != 0 ]]; then
    echo "${redColorBold}Install pipx Failed :(${whiteColor}"
  else
    echo "${greenColorBold}Install pipx success :)${whiteColor}"
  fi
}

pyensurepipx() {
  echo "${cyanColorUnder}ensurepath pipx${whiteColor}"
  sleep 1
  command python3 -m pipx ensurepath &> /sdcard/zlog.txt
  checkensurepath=$?
  if [[ $? != 0 ]]; then
    echo "${redColorBold}ensurepath pipx is failed :(${whiteColor}"
  else
    echo "${greenColorBold}ensurepath pipx is success :)${whiteColor}"
  fi
}

runProgram() {
    sleep 2
    echo "${cyanColorUnder}Update and Upgrade PKG${whiteColor}"
    sleep 1
    command pkg upgrade -y
    checkpkg=$?
    command cd
    rustcdev=$(pkg list-installed 2> /dev/null | grep "^.*rustc-dev" | sed "s/.*/rustc-dev/g")
    if command -v python && command -v wget && command -v nano && [[ $rustcdev = "rustc-dev" ]]; then
      command clear
      whoMadeThis
      echo "${greenColorUnder}Program already installed${whiteColor}"
      checkimpprog=1
    else
      installsomeprogram
    fi
        
    sleep 1
    if [[ $checkimpprog = 1 ]]; then
      command clear
      whoMadeThis
      echo "${cyanColorUnder}Update and Upgrade PKG${whiteColor}"
      echo "${greenColorUnder}Program already installed${whiteColor}"
    else
      command clear
      whoMadeThis
      echo "${cyanColorUnder}Update and Upgrade PKG${whiteColor}"
      echo "${greenColorUnder}Install important program${whiteColor}"
    fi
    sleep 1
    if [[ -f $errpath/enpipsucc ]]; then
      echo "${greenColorUnder}ensurepip already upgrade${whiteColor}"
      checkensure=1
    else
      ensurepipup
    fi
    sleep 1
    if [[ -f $errpath/inspipxsucc ]]; then
      echo "${greenColorUnder}Already install pipx${whiteColor}"
      checkpypipx=1
    else
      installpipx
    fi
    sleep 1
    if [[ -f $errpath/pyensurepipx ]]; then
      echo "${greenColorUnder}Skip for ensurepipx${whiteColor}"
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
          zcheckimpprog="${greenColorBold}Already installed${whiteColor}"
        else
          zcheckimpprog="${redColorBold}Install Failed (Error)${whiteColor}"
        fi
    else
        zcheckimpprog="${greenColorBold}Install Successfully${whiteColor}"
    fi

    if [[ $checkensure != 0 ]]; then
        if [[ $checkensure = 1 ]]; then
          zcheckensure="${greenColorBold}Already upgrade${whiteColor}"
        else
          zcheckensure="${redColorBold}Upgrade Failed (Error)${whiteColor}"
        fi
    else
        zcheckensure="${greenColorBold}Upgrade Successfully${whiteColor}"
    fi

    if [[ $checkpypipx != 0 ]]; then
        if [[ $checkpypipx = 1 ]]; then
          zcheckpypipx="${greenColorBold}Already installed${whiteColor}"
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
      echo -e "${redColorBold}Can't fix the error!\nWait till update script. Send error to @ElashXander (Telegram) for fast fix this issue${whiteColor}"
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
        echo -e "\nThere is ERROR!\nTry exit the Termux and open it again.\n1. try run command manualy for python3 -m pip install --user pipx\nThen run command zex install"
        exit
    fi
else
    echo -e "Results :\nUpdate and Upgrade PKG = $zcheckpkg\n\nInstall important program = $zcheckimpprog\n\nEnsurepip = $zcheckensure\n\nInstall pipx = $zcheckpypipx\n\nensure pipx = $zcheckensurepath"
    sleep 2
    echo -e "\nDone for now. Please exit the termux or make new session"
    echo "Exit : Exit then open it again enter the command ${nameScript} ins2"
    echo -e "\nSession : Make new session then enter the command ${nameScript} ins2"
    exit
fi
}
# ================== install.sh END ================== #


































# ================== install2.sh ==================
install2() {

if ! command -v pipx &> /dev/null; then
    echo "pipx not found!"
    echo "Please enter ${nameScript} ins for install pipx!"
    exit
fi

command clear

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
        echo "${nameScript} ins2"
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
        exit
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
    echo "if you want play again. Just run ${nameScript} run"
    echo "Don't forget to settings your proxy and Port"
    pathtool=$HOME/AnimeGamePatch
    sleep 1
    read -p "Press enter for continue"
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
  if ! command -v pipx &> /dev/null; then
    echo -e "${redColorBold}command pipx not found!\n${yellowColorBold}Please use ${nameScript} ins for install pipx"
    exit
  fi
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
  else
    echo "Edit success"
    touch $errpath/edproxpysucc &> /sdcard/zlog2.txt
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
expchek=$(export | grep "CARGO_BUILD_TARGET=\"aarch64-linux-android\"" | sed "s/.*/aarch64-linux-android/g")
if [[ $expchek = "aarch64-linux-android" ]]; then
  echo "Already export cargo"
  checkexport=1
else
  exportcargo
fi
sleep 1
if command -v mitmproxy &> /dev/null ; then
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
  echo -e "File already edited\nOr use ${nameScript} dom for change domain"
  checkeditfile=1
  sleep 1
else
  editproxypy
fi
sleep 2
clear
if [[ $checkexport != 0 ]]; then
    if [[ $checkexport = 1 ]]; then
      zcheckexport="${greenColorBold}Already do Export (Success)${whiteColor}"
    else
    zcheckexport="${redColorBold}Export Failed (Error)${whiteColor}"
    fi
else
    zcheckexport="${greenColorBold}Export Successfully${whiteColor}"
fi

if [[ $checkpipxmitm != 0 ]]; then
    if [[ $checkpipxmitm = 1 ]]; then
      zcheckpipxmitm="${greenColorBold}Already installed${whiteColor}"
    else
      zcheckpipxmitm="${redColorBold}Install mitmproxy Failed (Error)${whiteColor}"
    fi
else
    zcheckpipxmitm="${greenColor}Install mitmproxy Successfully${whiteColor}"
fi

if [[ $checkwgetdownload != 0 ]]; then
    if [[ $checkwgetdownload = 1 ]]; then
      zcheckwgetdownload="${greenColorBold}proxy.py already downloaded${whiteColor}"
    else
      zcheckwgetdownload="${redColorBold}Download Proxy Failed (Error)${whiteColor}"
    fi
else
    zcheckwgetdownload="${greenColorBold}Download Proxy Successfully${whiteColor}"
fi

if [[ $checkeditfile != 0 ]]; then
    if [[ $checkeditfile = 1 ]]; then
      zcheckeditfile="${greenColorBold}proxy.py already edited${whiteColor}"
    else
      zcheckeditfile="${redColorBold}Edit Proxy Failed (Error)${whiteColor}"
    fi
else
    zcheckeditfile="${greenColorBold}Edit Proxy Successfully${whiteColor}"
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
    case $removeSaveFile in
        "Y" | "y" ) cd; cd .config/zex; rm *;;
        "N" | "n" ) echo "Okay!"; exit;;
    esac
  fi
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
} 
# ================== install2.sh END ================== #


































# ================== zdom.sh START ================== #
zdomsh() {
command clear
command cd

changeServer() {
    command clear
    whoMadeThis
    domainChange=$inpsrv
    if [[ $domainChange = "1" ]]; then
        domainChange="sg.game.yuuki.me"
    elif [[ $domainChange = "2" ]]; then
        domainChange="de.game.yuuki.me"
    elif [[ $domainChange = "3" ]]; then
        domainChange="hk.elashxander.my.id"
    fi
    if [[ $inpsrv = "1" ]]; then
        changeServerDOWN
    else
        changeServer2
    fi
    if [[ $inpsrv = "2" ]]; then
        changeServerDOWN
    else
        changeServer2
    fi
    if [[ $inpsrv = "3" ]]; then
        changeServerDOWN
    else
        changeServer2
    fi
}

changeServerDOWN() {
    echo -e "Server is down\n"
    read -p "Are you sure want change to $domainChange? (y/n) : " serverDownSure
    case $serverDownSure in
        "y" | "Y" ) changeServer2;;
        "n" | "N" ) echo "Change domain cancelled by user!"; exit;;
        * ) echo "Wrong input!"; exit
    esac
}

changeServer2 () {
    command sed -i "s/default = \".*\",/default = \"$domainChange\",/g" $HOME/proxy.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to $domainChange"
        rm $ZERR
        exit
    fi
}

customserver() {
    command clear
    whoMadeThis
    echo -e "Custom Domain!\nExample : elashxander.my.id\n\n"
    command read -p "Enter custom Domain : " domain
    domain=$(echo $domain | sed "s/http.*\/\///g") # Thanks to Charon Baglari
    curl -Is 1 https://$domain &> /dev/null
    if [[ $? != 0 ]]; then
        echo -e "Server is can't to be access!\n"
        read -p "You sure want change to $domain? (y/n/r) : " youSureBruh
        case $youSureBruh in
            "y" | "Y" ) command sed -i "s/default = \".*\",/default = \"$domain\",/g" $HOME/proxy.py &> $ZERR;;
            "n" | "N" ) echo "Okay! server not changed!"; exit;;
            "r" | "R" ) customserver;;
            * ) echo "Wrong input!"; exit;;
        esac
    else
        command sed -i "s/default = \".*\",/default = \"$domain\",/g" $HOME/proxy.py &> $ZERR
    fi
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to $domain"
        rm $ZERR
        exit
    fi
}

ZERR=/data/user/0/com.termux/cache/zlog
whoMadeThis
command cd

if [[ -f "proxy.py" ]]; then
    echo -e "${greenColorBold}File target edit to proxy.py${whiteColor}"
else
    echo "${redColorBold}File not found for proxy.py${whiteColor}"
fi

checkServerYuukiSG=command curl -Is 1 https://sg.game.yuuki.me &> /dev/null
resultsCheckServerYuukiSG=$?
checkServerYuukiDE=command curl -Is 1 https://de.game.yuuki.me &> /dev/null
resultsCheckServerYuukiDE=$?
checkServerMINE=command curl -Is 1 https://hk.elashxander.my.id &> /dev/null
resultsCheckServerMINE=$?

if [[ $resultsCheckServerYuukiSG = 6 ]]; then
    statusServerYuukiSG="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiSG=1
elif [[ $resultsCheckServerYuukiSG = 28 ]]; then
    statusServerYuukiSG="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiSG=1
elif [[ $resultsCheckServerYuukiSG = 0 ]]; then
    statusServerYuukiSG="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiSG=0
fi

if [[ $resultsCheckServerYuukiDE = 6 ]]; then
    statusServerYuukiDE="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiDE=1
elif [[ $resultsCheckServerYuukiDE = 28 ]]; then
    statusServerYuukiDE="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiDE=1
elif [[ $resultsCheckServerYuukiDE = 0 ]]; then
    statusServerYuukiDE="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiDE=0
fi

if [[ $resultsCheckServerMINE = 6 ]]; then
    statusServerMINE="${redColorBold}[DOWN]${whiteColor}"
    downServerMINE=1
elif [[ $resultsCheckServerMINE = 28 ]]; then
    statusServerMINE="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerMINE=1
elif [[ $resultsCheckServerMINE = 0 ]]; then
    statusServerMINE="${greenColorBold}[RUNNING]${whiteColor}"
    downServerMINE=0
fi

downServer=$(expr $downServerYuukiSG + $downServerYuukiDE + $downServerMINE)

if [[ $resultsCheckServerYuukiSG != 0 ]] || [[ $resultsCheckServerYuukiDE != 0 ]] || [[ $resultsCheckServerMINE != 0 ]]; then
    echo -e "\nThere is $downServer server DOWN\n${yellowColorBold}May this your internet problem so check it manual!${whiteColor}\n========================================"
    
else
    echo "========================================"
fi

echo -e "Select Server\n1. Yuuki (Singapore) : $statusServerYuukiSG\n2. Yuuki (German) :  $statusServerYuukiDE\n3. My Server (Hongkong) : $statusServerMINE\n4. Custom\n\nExample : 1 for select Yuuki Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" | "2" | "3" ) changeServer;;
    "4" ) customserver;;
    * ) echo "Wrong Input!";;
esac
}
# ================== zdom.sh END ================== #
































# ================== zex.sh START ================== #
zexsh() {
if command -v mitmdump &> /dev/null; then
    command cd
    mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
    exit
else
    echo -e "${redColorBold}mitmproxy not found!\nPlease download it using ${nameScript} ins\n"
    exit
fi
}
# ================== zex.sh END ================== #

clear
whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n$isThisLatestVersion\n========================================"
}

versionBash1="1.5"

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
yellowColor="$(printf '\033[0;33m')"
cyanColorUnder="$(printf '\033[4;36m')"
greenColorUnder="$(printf '\033[4;32m')"
redColorUnder="$(printf '\033[4;31m')"

# PLEASE DON'T EDIT THIS, THIS LOAD SOME CODE TO SERVER
source <(curl -s https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/someupdate)
# source $HOME/AnimeGamePatch/someupdate
if [[ $versionBashIn1 = "" ]]; then
    echo -e "${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    isThisLatestVersion="${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    sleep 1.5
    read -p "Press enter for continue!"
elif [[ $versionBash1 > $versionBashIn1 ]]; then
    clear
    echo -e "$whatTheFuckEditVersion"
    exit
elif [[ $versionBash1 < $versionBashIn1 ]]; then
    newUpdateScript() {
        clear
        echo -e "$updateNote $versionBashIn1\n\nWhat new update? :\n$updateNotif\n"
        sleep 1s
        read -p "Want to update? (y/n)" wantUpdateScript
        while true; do
        case $wantUpdateScript in
            "y" | "Y" ) updateScript1;break;;
            "n" | "N" ) echo "okay!, script will continue without update!"; isThisLatestVersion="Current Version : ${redColorBold}$versionBash1${whiteColor}\nLatest Version : ${greenColorBold}$versionBashIn1${whiteColor}";sleep 1s;break;;
            * ) echo "wrong input!";sleep 1.5s;newUpdateScript;;
        esac
        done
    }
    newUpdateScript
elif [[ $versionBash1 = $versionBashIn1 ]]; then
    isThisLatestVersion=${greenColorBold}$printLatest${whiteColor}
fi

case $userInput1 in
    "ins" | "install" ) install1;;
    "dom" | "changedomain" ) zdomsh;;
    "ins2" | "install2" ) install2;;
    "run" | "proxy" ) zexsh;;
    * ) echo -e "${nameScript}: invalid option\n\n${nameScript} Usage : ${nameScript} ins / dom / ins2 / run\n\n    ins : Install program at begining\n    ins2 : when you already using zex ins then use ins2\n    dom : change a server/domain\n    run : run a mitmproxy\n\nThis script was made by @ElashXander (Telegram) this not easy to use this but, why not to try learn this?"; exit;;
esac






