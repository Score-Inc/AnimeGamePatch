#!/data/data/com.termux/files/usr/bin/bash

# Color Text
greenColorBold="$(printf '\033[1;32m')"
redColorBold="$(printf '\033[1;31m')"
yellowColorBold="$(printf '\033[1;33m')"
cyanColorBold="$(printf '\033[1;36m')"
whiteColor="$(printf '\033[0;37m')"
yellowColor="$(printf '\033[0;33m')"

# Subcommand input
userInput1=$1

# Name Script
nameScript=$(basename "$0")

# Check if code run in Termux
checkTermux=$(uname -o)
if [[ $checkTermux != "Android" ]]; then
    clear
    echo "Please run script from Termux"
    exit
fi

# Install some program/package if not installed
if ! command -v ruby &>/dev/null; then
    echo "${greenColorBold}Installing ruby${whiteColor}"
    pkg install ruby -y &>/dev/null
fi

if ! command -v lolcat &>/dev/null; then
    echo "${greenColorBold}Installing lolcat${whiteColor}"
    gem install lolcat &>/dev/null
fi

if ! command -v cowsay &>/dev/null; then
    echo "${greenColorBold}Installing cowsay${whiteColor}"
    pkg install cowsay -y
fi

if ! command -v zip &>/dev/null; then
    echo "${greenColorBold}Installing zip${whiteColor}"
    pkg install zip -y
fi

if ! command -v busybox &>/dev/null; then
    echo "${greenColorBold}Installing busybox${whiteColor}"
    pkg install busybox -y
fi

if ! command -v wget &>/dev/null; then
    echo "${greenColorBold}Installing wget${whiteColor}"
    apt install wget -y
fi

if [ ! -f "$HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar" ]; then
    cd $HOME/.ElaXan/AnimeGamePatch
    echo "Downloading uber-apk-signer"
    wget https://github.com/patrickfav/uber-apk-signer/releases/download/v1.2.1/uber-apk-signer-1.2.1.jar -q
fi

AnimeGamePatch=$HOME/.ElaXan/AnimeGamePatch/animegamepatch
if [ -f "$AnimeGamePatch/changeSettings.sh" ]; then
    source $AnimeGamePatch/changeSettings.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/changeSettings.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/downloadGenshinAPK.sh" ]; then
    source $AnimeGamePatch/downloadGenshinAPK.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/downloadGenshinAPK.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/downloadProxy.sh" ]; then
    source $AnimeGamePatch/downloadProxy.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/downloadProxy.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/getCertificate.sh" ]; then
    source $AnimeGamePatch/getCertificate.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/getCertificate.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/installMitmproxy.sh" ]; then
    source $AnimeGamePatch/installMitmproxy.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/installMitmproxy.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/runMitmproxy.sh" ]; then
    source $AnimeGamePatch/runMitmproxy.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/runMitmproxy.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/spin.sh" ]; then
    source $AnimeGamePatch/spin.sh
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/spin.sh not found"
    exit 1
fi
if [ -f "$AnimeGamePatch/InstallCertificateAPK.sh" ]; then
    source "$AnimeGamePatch/InstallCertificateAPK.sh"
else
    echo "${redColorBold}Error${whiteColor} : $AnimeGamePatch/InstallCertificateAPK.sh not found"
    exit 1
fi

versionBash1="4.0.1"

su -c echo &>/dev/null
RootDetect=$?
if [[ $RootDetect = 0 ]]; then
    printRooted="${greenColorBold}You're phone is Rooted${whiteColor}"
    isRooted=true
elif [[ $RootDetect = 13 ]]; then
    printRooted="${redColorBold}Root access denied${whiteColor}"
    isRooted=false
elif [[ $RootDetect = 1 ]]; then
    printRooted="${yellowColorBold}You're phone is No Root${whiteColor}"
    isRooted=false
fi

isFDroid=$(env | grep "TERMUX_APK_RELEASE" | sed "s/TERMUX_APK_RELEASE=//g" | sed "s/\"//g")
if [[ $isFDroid != "F_DROID" ]]; then
    FDroidTermux="${redColorBold}I recommend you using Termux from F-Droid${whiteColor}\n========================================"
else
    FDroidTermux="========================================"
fi

clear
whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n$isThisLatestVersion\n$printRooted\n$FDroidTermux"
}

showCowsay() {
    cowsay -f eyes "ElashXander Project" | lolcat
    echo "========================================" | lolcat
}

downloadGenshin() {
    clear
    whoMadeThis
    if [[ $dgenshininp = "1" ]]; then
        echo "${redColorBold}file size is 453 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "2" ]]; then
        echo "${redColorBold}File size is 264 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "3" ]]; then
        echo "${redColorBold}File size is 238 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "4" ]]; then
        echo "${redColorBold}File size is 321 MB... Do you want continue to download?${whiteColor}"
    fi
    echo -n "Enter input (y/n) : "
    read -r dwngenshin
    case $dwngenshin in
    "y" | "Y") downloadYesGenshin ;;
    "n" | "N") UIMenu ;;
    *)
        echo "Wrong Input!"
        sleep 1s
        UIMenu
        ;;
    esac
}

GenshinAPKs() {
    clear
    cd $HOME || exit 1
    whoMadeThis
    echo "1. ${greenColorBold}Genshin Impact Version 3.2${whiteColor}"
    echo "2. ${yellowColorBold}Genshin Impact Version 3.0${whiteColor}"
    echo "3. ${yellowColorBold}Genshin Impact Version 2.8${whiteColor}"
    echo "4. ${yellowColorBold}Genshin Impact Version 2.7${whiteColor}"
    echo "0. Back"
    echo ""
    echo -n "Enter input : "
    read -r dgenshininp
    case $dgenshininp in
    "1" | "2" | "3" | "4") downloadGenshin ;;
    "0") UIMenu ;;
    *)
        echo "Wrong Input!"
        sleep 1s
        GenshinAPKs
        ;;
    esac
}

changeServerDOWN() {
    cd $HOME || exit 1
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\nPlease Download it!${whiteColor}\n"
        echo -n "Press enter for back to Change Server Menu!"
        read -r
        zdomsh
        return
    fi
    echo -e "${redColorBold}Server is down${whiteColor}\n"
    echo -n "${yellowColorBold}Are you sure want change to ${greenColorBold}$domainChange${whiteColor}? (y/n) : "
    read -r serverDownSure
    case $serverDownSure in
    "y" | "Y") changeServer2 ;;
    "n" | "N")
        echo "${yellowColorBold}Change domain cancelled by user!${whiteColor}"
        exit
        ;;
    *)
        echo "Wrong input!"
        exit
        ;;
    esac
}

settingsScript() {
    clear
    whoMadeThis
    changeSettings_list
    echo "[$isLogOutputSettings] ${whiteColor}1. ${cyanColorBold}Log Output Mitmproxy${whiteColor}"
    echo "[$openGenshinConf] ${whiteColor}2. ${cyanColorBold}Auto open Genshin Impact App${whiteColor}"
    echo "[$renameconf] ${whiteColor}3. ${cyanColorBold}Autorename Package Genshin (ROOT)${whiteColor}"
    echo "[$setProxyConf] ${whiteColor}4. ${cyanColorBold}Change Proxy (ROOT)${whiteColor}"
    echo "[$resetProxyConf] ${whiteColor}5. ${cyanColorBold}Reset Proxy (ROOT)${whiteColor}"
    echo "[$currentPort] ${whiteColor}6. ${cyanColorBold}Localhost Port${whiteColor}"
    echo "${whiteColor}7. ${cyanColorBold}Custom Server${whiteColor}"
    echo "0. ${redColorBold}Back to Menu!${whiteColor}"
    echo ""
    echo -n "Enter input : "
    read -r inputsettings
    case $inputsettings in
    "1" | "2" | "3" | "4" | "5" | "6" | "7") ChangeConfSettings ;;
    "0") UIMenu ;;
    *)
        echo "${redColorBold}Wrong input!${whiteColor}"
        sleep 1s
        settingsScript
        ;;
    esac
}

UIMenu() {
    clear
    whoMadeThis
    echo "${whiteColor}1. ${cyanColorBold}Extract Mitmproxy! and install Python"
    echo "${whiteColor}2. ${cyanColorBold}Get Certificate"
    echo "${whiteColor}3. ${cyanColorBold}Download Genshin APKs"
    echo "${whiteColor}4. ${cyanColorBold}Run Mitmproxy (zex run)"
    echo "${whiteColor}5. ${cyanColorBold}Download proxy.py"
    echo "${whiteColor}6. ${cyanColorBold}Install certificate to APK"
    echo "${whiteColor}7. ${cyanColorBold}Settings"
    echo "${whiteColor}0. ${redColorBold}Exit${whiteColor}"
    echo -n "Enter input : "
    read -r enterInputUI
    case $enterInputUI in
    "1") extractMitm ;;
    "2") getCert ;;
    "3") GenshinAPKs ;;
    "4") zexsh ;;
    "5") downloadproxy ;;
    "6") installCertAPK ;;
    "7") settingsScript ;;
    "0") exit 0 ;;
    *)
        echo "Wrong input!"
        sleep 1s
        clear
        UIMenu
        ;;
    esac
}

pathScript=$HOME/.termux/settings.zex
if [[ ! -f $pathScript ]]; then
    echo -e -n "# Script made by ElaXan\n# This for Settings Feature. Delete this if have problem on change Settings or you can edit Manual\ninstallcert=false\nrename=false\nopenGenshin=false\nsetProxy=false\nreset=1\nport=\"54321\"\ncustomServer=\"elashxander.my.id\"\ncustomPort=443\nlogOutputMitm=false" >"$pathScript"
fi
# PLEASE DON'T EDIT THIS, THIS LOAD SOME CODE FROM SERVER
isThisLatestVersion="${greenColorBold}Checking version...${whiteColor}"
whoMadeThis
# Why Shell Check this said problem... TF
echo "${greenColorBold}Load data from server...${whiteColor}"
source <(curl -s https://raw.githubusercontent.com/Score-Inc/AnimeGamePatch/main/someupdate)
# source $HOME/AnimeGamePatch/someupdate
if [[ $versionBashIn1 = "" ]]; then
    echo -e "\n${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    isThisLatestVersion="${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    noInternet=true
    sleep 1.5
    read -p "Press enter for continue!"
elif [[ $versionBash1 > $versionBashIn1 ]]; then
    clear
    echo -e "$whatTheFuckEditVersion"
    exit
elif [[ $versionBash1 < $versionBashIn1 ]]; then
    clear
    echo -e "$updateNote $versionBashIn1\n\nWhat is new/update? :\n$updateNotif\n"
    sleep 1s
    read -p "Want to update? (y/n)" wantUpdateScript
    while true; do
        case $wantUpdateScript in
        "y" | "Y")
            updateScript1
            break
            ;;
        "n" | "N")
            echo "okay!, script will continue without update!"
            isThisLatestVersion="Current Version : ${redColorBold}$versionBash1${whiteColor}\nLatest Version : ${greenColorBold}$versionBashIn1${whiteColor}"
            sleep 1s
            break
            ;;
        *)
            echo "wrong input!"
            sleep 1.5s
            newUpdateScript
            ;;
        esac
    done
elif [[ $versionBash1 = $versionBashIn1 ]]; then
    isThisLatestVersion=${greenColorBold}$printLatest${whiteColor}
    noInternet=false
fi

if [[ $forceUpdate = true ]]; then
    updateSciptForce
fi

# SubCommand here
# You can edit as you want (IF YOU KNOW SHELL CODE)
# If you want make to UI 1,2,3,4 install without zex ins for example. You can do it (I SAID AGAIN IF YOU KNOW SHELL CODE)
case $userInput1 in
"1") extractMitm ;;
"2") getCert ;;
"3") GenshinAPKs ;;
"4") zexsh ;;
"5") downloadproxy ;;
"6") installCertAPK ;;
"7") settingsScript ;;
*)
    clear
    UIMenu
    ;;
esac
