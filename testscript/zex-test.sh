#!/data/data/com.termux/files/usr/bin/bash

# SCRIPT NOT ENCRYPTED FOR YOU CAN LEARN THE CODE BASH / SHELL SCRIPT.
# THIS CODE IS FREE
# CODE STILL DEVELOPMENT FOR FIX SOME CODE AND ADD CODE.

# THANKS TO @CharonCB21 (Telagram) for Helping me about this



userInput1=$1
nameScript=$(basename $0)

if [[ $forceStop = true ]]; then
    echo "$NoteStopScript"
    exit
fi


# ================== extract.sh START ================== #

# Extract Mitmproxy
extractMitm() {
    clear
    whoMadeThis
    mitmproxyPath=$HOME/.local/bin/mitmproxy
    if [[ -f $mitmproxyPath ]]; then
        echo "${yellowColorBold}mitmproxy already installed!${greenColorBold}"
        sleep 1s
        read -p "Press enter for back to Menu!${whiteColor}"
        clear
        UIMenu
    fi

    if ! command -v wget &> /dev/null; then
        echo "${greenColorBold}Install wget${whiteColor}"
        command pkg install wget -y
    fi
    clear
    whoMadeThis
    echo "${greenColorBold}Update PKG${whiteColor}"
    pkg update
    if [[ -f $HOME/mitmproxy.tar.gz ]]; then
        rm mitmproxy.tar.gz
    fi
    clear
    whoMadeThis
    command cd
    echo "${greenColorBold}Download mitmproxy file!${whiteColor}"
    wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz -q --show-progress
    if [[ $? != 0 ]]; then
        clear
        whoMadeThis
        echo "Failed to download mitmproxy files!"
        sleep 1s
        exit
    else
        clear
        whoMadeThis
        command cd
        echo "${greenColorBold}Extracting Mitmproxy files!${whiteColor}"
        tar -zxf $HOME/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions
        clear
        rm mitmproxy.tar.gz
        clear
        whoMadeThis
        echo "${greenColorBold}Download zex${whiteColor}"
        sleep 0.5s
        cd $PREFIX/bin
        rm zex
        wget https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/zex.sh -q --show-progress
        if [[ $? != 0 ]]; then
            clear
            whoMadeThis
            echo "Error for Download zex!"
            echo ""
            read -p "Press enter for back to main menu!"
            clear
            UIMenu
        fi
        mv zex.sh zex
        clear
        whoMadeThis
        echo "${greenColorBold}Set permission!${whiteColor}"
        chmod +x zex
        sleep 1s
        echo "${greenColorBold}Done!${whiteColor}"
        clear
        whoMadeThis
        echo "${greenColorBold}Install Python!${whiteColor}"
        command pkg install python -y
        if [[ $? != 0 ]]; then
            clear
            whoMadeThis
            echo "${redColorBold}Install python failed!${whiteColor}"
            echo ""
            read -p "Press enter for back to main menu!"
            clear
            UIMenu
        fi
        clear
        whoMadeThis
        echo -e "${greenColorBold}Done extract/install mitmproxy!...\n${whiteColor}"
        command cd
        if [[ -f proxy.py ]]; then
            rm proxy.py
        elif [[ -f proxy_config.py ]]; then
            rm proxy_config.py
        fi
        read -p "Press enter for back to menu!"
        clear
        UIMenu
    fi
}









# ================== zdom.sh START ================== #


zdomsh() {
command clear
command cd

changeServer() {
    command clear
    whoMadeThis
    domainChange=$inpsrv
    # You can add more server here. But edit code bellow too not only this
    if [[ $domainChange = "1" ]]; then
        domainChange="sg.game.yuuki.me"
    elif [[ $domainChange = "2" ]]; then
        domainChange="de.game.yuuki.me"
    elif [[ $domainChange = "3" ]]; then
        domainChange="hk.elashxander.my.id"
    fi
    if [[ $inpsrv = "1" ]]; then
        if [[ $downServerYuukiSG = 1 ]]; then
            changeServerDOWN
        else
            changeServer2
        fi
    fi

    if [[ $inpsrv = "2" ]]; then
        if [[ $downServerYuukiDE = 1 ]]; then
            changeServerDOWN
        else
            changeServer2
        fi
    fi

    if [[ $inpsrv = "3" ]]; then
        if [[ $downServerMINE = 1 ]]; then
            changeServerDOWN
        else
            changeServer2
        fi
    fi
}

changeServerDOWN() {
    command cd
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\nPlease Download it at Main Menu!${whiteColor}\n"
        read -p "Press enter for back to Main Menu!"
        UIMenu
    fi
    echo -e "${redColorBold}Server is down${whiteColor}\n"
    read -p "${yellowColorBold}Are you sure want change to ${greenColorBold}$domainChange${whiteColor}? (y/n) : " serverDownSure
    case $serverDownSure in
        "y" | "Y" ) changeServer2;;
        "n" | "N" ) echo "${yellowColorBold}Change domain cancelled by user!${whiteColor}"; exit;;
        * ) echo "Wrong input!"; exit
    esac
}

changeServer2 () {
    command cd
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it at Main Menu!${whiteColor}\n"
        read -p "Press enter for back to Main Menu!"
        UIMenu
    fi
    command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domainChange\"/g" $HOME/proxy_config.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo -e "The Domain changed to $domainChange\n"
        rm $ZERR
        read -p "Press Enter to change server "
        clear
        zdomsh
    fi
}

customserver() {
    command cd
    command clear
    whoMadeThis
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it at Main Menu!${whiteColor}\n"
        read -p "Press enter for back to Main Menu!"
        UIMenu
    fi
    echo -e "Custom Domain!\nExample : elashxander.my.id\nB : Back to change server\n"
    command read -p "Enter custom Domain : " domain
    if [[ $domain = "B" ]] || [[ $domain = "b" ]] || [[ $domain = "Back" ]] || [[ $domain = "BACK" ]]; then
        command clear
        changeServer
    else
        domain=$(echo $domain | sed "s/http.*\/\///g") # Thanks to Charon Baglari
        curl -Ism 2 -f https://$domain &> /dev/null
    fi
    if [[ $? != 0 ]]; then
        echo -e "Server is can't to be access!\n"
        read -p "You sure want change to $domain? (y/n/r) : " youSureBruh
        case $youSureBruh in
            "y" | "Y" ) command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" $HOME/proxy_config.py &> $ZERR;;
            "n" | "N" ) echo "Okay! server not changed!"; exit;;
            "r" | "R" ) customserver;;
            * ) echo "Wrong input!"; exit;;
        esac
    else
        command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" $HOME/proxy_config.py &> $ZERR
    fi
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo -e "The Domain changed to $domain\n"
        rm $ZERR
        read -p "Press Enter to change server "
        clear
        zdomsh
    fi
}

ZERR=/data/user/0/com.termux/cache/zlog
whoMadeThis
command cd
if [[ -f "proxy_config.py" ]]; then
    serverUsing=$(cat proxy_config.py | grep "REMOTE_HOST = \"" | sed "s/.*= //g" | sed "s/\"//g")
else
    serverUsing=""
fi

if [[ $serverUsing = "" ]]; then
    serverUsing="${redColorBold}There is no Server${whiteColor}"
fi

if [[ -f "proxy_config.py" ]]; then
    echo -e "${greenColorBold}File target edit to proxy_config.py\n\n${cyanColorBold}Current Server : $serverUsing${whiteColor}"
else
    echo "${redColorBold}Can't display : proxy_config.py file not found${whiteColor}"
fi

checkServerYuukiSG=command curl -Ism 3 -f https://sg.game.yuuki.me &> /dev/null
resultsCheckServerYuukiSG=$?
checkServerYuukiDE=command curl -Ism 3 -f https://de.game.yuuki.me &> /dev/null
resultsCheckServerYuukiDE=$?
checkServerMINE=command curl -Ism 3 -f https://hk.elashxander.my.id &> /dev/null
resultsCheckServerMINE=$?

if [[ $resultsCheckServerYuukiSG = 28 ]]; then
    statusServerYuukiSG="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiSG=1
elif [[ $resultsCheckServerYuukiSG = 6 ]]; then
    statusServerYuukiSG="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiSG=0
elif [[ $resultsCheckServerYuukiSG = 0 ]]; then
    statusServerYuukiSG="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiSG=0
fi

if [[ $resultsCheckServerYuukiDE = 28 ]]; then
    statusServerYuukiDE="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiDE=1
elif [[ $resultsCheckServerYuukiDE = 6 ]]; then
    statusServerYuukiDE="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiDE=0
elif [[ $resultsCheckServerYuukiDE = 0 ]]; then
    statusServerYuukiDE="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiDE=0
fi

if [[ $resultsCheckServerMINE = 28 ]]; then
    statusServerMINE="${redColorBold}[DOWN]${whiteColor}"
    downServerMINE=1
elif [[ $resultsCheckServerMINE = 6 ]]; then
    statusServerMINE="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerMINE=0
elif [[ $resultsCheckServerMINE = 0 ]]; then
    statusServerMINE="${greenColorBold}[RUNNING]${whiteColor}"
    downServerMINE=0
fi

downServer=$(expr $downServerYuukiSG + $downServerYuukiDE + $downServerMINE)

if [[ $resultsCheckServerYuukiSG = 28 ]] || [[ $resultsCheckServerYuukiDE = 28 ]] || [[ $resultsCheckServerMINE = 28 ]]; then
    echo -e "\n${redColorBold}There is $downServer server DOWN${whiteColor}\n========================================"
elif [[ $resultsCheckServerYuukiSG = 6 ]] || [[ $resultsCheckServerYuukiDE = 6 ]] || [[ $resultsCheckServerMINE = 6 ]]; then
    echo "========================================"
elif [[ $resultsCheckServerYuukiSG = 0 ]] || [[ $resultsCheckServerYuukiDE = 0 ]] || [[ $resultsCheckServerMINE = 0 ]]; then
    echo "========================================"
fi

echo -e "Select Server\n1. Yuuki (Singapore) : $statusServerYuukiSG\n2. Yuuki (German) :  $statusServerYuukiDE\n3. My Server (Hongkong) : $statusServerMINE\n4. Custom\n5. BACK\n\nExample : 1 for select Yuuki Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" | "2" | "3" ) changeServer;;
    "4" ) customserver;;
    "5" ) clear; UIMenu;;
    * ) echo "Wrong Input!";;
esac
}
# ================== zdom.sh END ================== #
































# ================== zex.sh START ================== #
zexsh() {
if [[ $noInternet = true ]]; then
    command clear
    echo -e "${redColorBold}This internet required,\nplease turn on your internet for run mitmdump!${whiteColor}"
    exit
fi

changeProxy() {
    clear
    whoMadeThis
    if [[ $isRooted = true ]]; then
        echo -e "${redColorBold}mitmproxy killed/force stopped!\n\n${greenColorBold}Reset Proxy..."
        su -c settings put global http_proxy :0
        sleep 0.5s
        echo "Done!${whiteColor}"
        genshinData=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | grep "zex")
        if [[ $genshinData = "com.miHoYo.GenshinImpactzex" ]]; then
            echo "${greenColorBold}Rename back Data Genshin..."
            sleep 0.5s
            su -c mv /sdcard/Android/data/com.miHoYo.GenshinImpactzex /sdcard/Android/data/com.miHoYo.GenshinImpact
            echo "Done!${whiteColor}"
        fi
        echo ""
        read -p "Press enter for back to Menu!"
        UIMenu
        return
    else
        echo -e "${redColorBold}mitmproxy killed/force stopped!${whiteColor}\n"
        read -p "Press enter for back to Menu!"
        UIMenu
        return
    fi
}

mitmProxyRun() {
    command cd
    clear
    whoMadeThis
    if [[ -f ./.local/bin/mitmdump ]]; then
        command cd
        if [[ ! -f proxy.py ]] || [[ ! -f proxy_config.py ]]; then
            echo "${redColorBold}proxy.py not found, please download it in main menu!${whiteColor}"
            echo ""
            read -p "Press Enter for back to menu!"
            clear
            UIMenu
            return 1
        fi
        if [[ $isRooted = true ]]; then
            genshinData=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | grep "zex")
            genshinDatas=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | sed "s/com.*zex//g" | grep "com")
            if [[ $genshinDatas != "com.miHoYo.GenshinImpact" ]]; then
                echo "========================================"
            else
                if [[ $genshinData != "com.miHoYo.GenshinImpactzex" ]]; then
                    echo -e "${yellowColorBold}Do you want rename package Genshin?\n"
                    read -p "Enter input (y/n) : " renamePackage
                    case $renamePackage in
                        "y" | "Y" ) cd /sdcard/Android/data; su -c mv com.miHoYo.GenshinImpact com.miHoYo.GenshinImpactzex; echo -e "${greenColor}Done Rename!${whiteColor}\n========================================"; command cd;;
                        "n" | "N" ) echo -e "${yellowColorBold}Okay! Rename by yourself!${whiteColor}\n========================================"; sleep 0.4s;;
                        * ) echo -e "${redColorInput}Wrong Input!\nSkip Rename!${whiteColor}\n========================================"; sleep 0.5s;;
                    esac
                else
                    echo "========================================"
                fi
            fi
            echo "${greenColorBold}Change Proxy..."
            sleep 0.3s
            su -c settings put global http_proxy 127.0.0.1:8080
            echo "Done${whiteColor}"
            sleep 0.5s
            echo -e "${cyanColorBold}Important... For reset just do CTRL + C${whiteColor}"
            sleep 2s
            clear
            whoMadeThis
        else
            echo "${greenColorBold}Make Sure you already set the proxy and port"
            sleep 0.2s
            echo "Proxy/hostname : 127.0.0.1"
            sleep 0.2s
            echo "Port : 8080"
            sleep 0.2s
            echo "If you not do that will not work${whiteColor}"
            sleep 0.2s
            echo "========================================"
        fi
        mitmKilled=$(cat $HOME/zkill.log &> /dev/null)
        if [[ $mitmKilled = "Killed" ]]; then
            echo "mitmproxy killed/force stop!"
            exit
        fi
        
        
        ./.local/bin/mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
        if [[ $? != 0 ]]; then
            if [[ $killMitms = 2 ]]; then
                echo "${redColorBold}I can't fix this error. Try restart your phone!"
                exit
            fi
            if [[ $killMitms = 1 ]]; then
                echo "${yellowColorBold}Trying seconds method!${whiteColor}"
                killMitmd=$(ps ax > $HOME/z.log; grep "mitmdump" $HOME/z.log | sed "s/ pts\/1.*false//g")
                kill $killMitmd
                echo "Killed" > $HOME/zkill.log
                rm $HOME/z.log
                sleep 0.5
                echo "${greenColorBold}Trying run again...${whiteColor}"
                sleep 1s
                killMitms=2
                mitmProxyRun
            fi
            echo "${yellowColorBold}Trying fix this Issue!"
            sleep 1s
            echo "Killed" > $HOME/zkill.log
            pkill -9 mitmdump
            sleep 0.5
            echo "${greenColorBold}Trying run again...${whiteColor}"
            killMitms=1
            clear
            mitmProxyRun
        fi
        changeProxy
    else
        echo -e "${redColorBold}mitmproxy not found!\nPlease download it using ${nameScript} 1\n"
        exit
    fi
}
    mitmProxyRun
}
# ================== zex.sh END ================== #










# ================== proxy.sh START ================== #
downloadproxy() {
    clear
    whoMadeThis
    if [[ -f proxy.py ]]; then
        rm proxy.py
    fi
    if [[ -f proxy_config.py ]]; then
        rm proxy_config.py
    fi
    echo "${greenColorBold}Download proxy.py${whiteColor}"
    sleep 1s
    wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy.py &> /dev/null
    clear
    whoMadeThis
    echo "${greenColorBold}Download proxy_config.py${whiteColor}"
    sleep 1s
    wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy_config.py &> /dev/null
    clear
    whoMadeThis
    echo "${greenColorBold}Edit proxy_config.py${whiteColor}"
    sleep 1s
    sed -i "s/REMOTE_HOST = \"localhost\"/REMOTE_HOST = \"sg.game.yuuki.me\"/g" proxy_config.py
    echo "${greenColorBold}Done Edit${whiteColor}"
    sleep 1s
    if [[ -f proxy.py ]] || [[ -f proxy_config.py ]]; then
        echo "${greenColorBold}proxy.py successfully download!${whiteColor}"
        echo ""
    else
        echo "${redColorBold}proxy.py failed to download!${whiteColor}"
        echo ""
    fi
    read -p "Press enter for back to Menu!"
    clear
    proxyMenu
}


proxyMenu() {
    cd
    clear
    whoMadeThis
    if [[ -f proxy.py ]] || [[ -f proxy_config.py ]]; then
        echo "${greenColorBold}proxy.py already download${whiteColor}"
    else
        echo "${redColorBold}proxy.py not found!${whiteColor}"
    fi
    echo "========================================"
    echo "1. ${greenColorBold}Download proxy.py${whiteColor}"
    echo "2. ${yellowColorBold}Back${whiteColor}"
    echo ""
    read -p "Enter input : " proxyInput
    while true; do
    case $proxyInput in
        "1" ) downloadproxy; break;;
        "2" ) clear; UIMenu break;;
        * ) echo "Wrong input!"; proxyMenu;;
    esac
    done
}


downloadYesGenshin() {
    command clear
    whoMadeThis
    command cd
    if ! command -v wget &> /dev/null; then
        pkg install wget
    fi
    echo "${yellowColorBold}Download Genshin apks. [PLEASE WAIT!]${whiteColor}"
    if [[ $dgenshininp = "1" ]]; then
        if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
            echo "${greenColorBold}Genshin_Impact_2.8.apks already exist in /sdcard !${whiteColor}"
            echo ""
            read -p "Press enter to back Menu!"
            UIMenu
        else
            versionGenshin="2.8"
            if [[ -f "$HOME/Genshin_Impact_2.8.apks" ]]; then
                rm "$HOME/Genshin_Impact_2.8.apks"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/2.8/Genshin_Impact_2.8.apks -q --show-progress
        fi
    elif [[ $dgenshininp = "2" ]]; then
        if [[ -f "/sdcard/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
            echo "${greenColorBold}Genshin.Impact.Cert.Patch_Sign.apk already exist in /sdcard !${whiteColor}"
            echo ""
            read -p "Press enter to back Menu!"
            UIMenu
        else
            versionGenshin="2.7"
            if [[ -f "$HOME/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
                rm "$HOME/Genshin.Impact.Cert.Patch_Sign.apk"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/2.7/Genshin.Impact.Cert.Patch_Sign.apk -q --show-progress
        fi
    fi
    if [[ $? != 0 ]]; then
        clear
        whoMadeThis
        echo "${redColorBold}Download Failed!${whiteColor}"
        echo ""
        read -p "Press enter go back to Menu!"
        UIMenu
    else
        clear
        whoMadeThis
        echo "${greenColorBold}Download Successfully!${whiteColor}"
        sleep 0.5s
        echo "${greenColorBold}Move apks Genshin to /sdcard${whiteColor}"
        sleep 0.5s
        if [[ -f "Genshin_Impact_2.8.apks" ]]; then
            mv Genshin_Impact_2.8.apks /sdcard
        else
            echo "${redColorBold}File Genshin APKs not found!"
            echo ""
            read -p "Press Enter for back to Menu!"
            clear
            UIMenu
        fi
    fi
    if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
        echo -e "${greenColorBold}Success move to /sdcard !\n\nInstall with SAI Installer or other apk that support install .apks${whiteColor}"
        if [[ $isRooted = true ]]; then
            if [[ $versionGenshin = "2.8" ]]; then
                echo "Can't do Install automatically with \"pm install\" because file name is .apks so install manually"
            elif [[ $versionGenshin = "2.7" ]]; then
                cd /sdcard
                pm install Genshin.Impact.Cert.Patch_Sign.apk
            fi
        fi
        echo ""
        read -p "Press Enter for back to Menu!"
        clear
        UIMenu
    else
        echo "${redColorBold}Failed to move Genshin APKs to /sdcard${whiteColor}"
        echo ""
        read -p "Press Enter for back to Menu!"
        clear
        UIMenu
    fi
}


downloadGenshin() {
    clear
    whoMadeThis
    if [[ $dgenshininp = "1" ]]; then
        echo "${redColorBold}File size is 238 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "2" ]]; then
        echo "${redColorBold}File size is 321 MB... Do you want continue to download?${whiteColor}"
    fi
    read -p "Enter input (y/n) : " dwngenshin
    case $dwngenshin in
        "y" | "Y" ) downloadYesGenshin;;
        "n" | "N" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; UIMenu;;
    esac
}

GenshinAPKs() {
    clear
    command cd
    whoMadeThis
    echo "1. ${greenColorBold}Genshin Impact Version 2.8${whiteColor}"
    echo "2. ${yellowColorBold}Genshin Impact Version 2.7${whiteColor}"
    echo "3. Back"
    echo ""
    read -p "Enter input : " dgenshininp
    case $dgenshininp in
        "1" | "2" ) downloadGenshin;;
        "3" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; GenshinAPKs;;
    esac
}


versionBash1="2.5"

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

# IDK WHY THIS ERROR, SO I WILL FIX THIS AS SOON AS POSSIBLE
pathZex=$PREFIX/bin/zex

su -c echo &> /dev/null
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

isFDroid=$(export > $HOME/isFdroid.zex | cat $HOME/isFdroid.zex | grep "TERMUX_APK_RELEASE" $HOME/isFdroid.zex  | sed "s/declare -x TERMUX_APK_RELEASE=//g" | sed "s/\"//g")
if [[ $isFDroid != "F_DROID" ]]; then
    FDroidTermux="${redColorBold}I recommend you using Termux from F-Droid${whiteColor}\n========================================"
else
    FDroidTermux="========================================"
fi

rm $HOME/isFDroid.zex

clear
whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n${yellowColorBold}Development Version (Maybe there is Bug)\n${printRooted}${whiteColor}\n========================================\n${greenColorBold}This only for test Script\nbefore update to Stable Version...${whiteColor}\n$FDroidTermux"
}

fixVersionScripts() {
    openZex=$(cat $pathZex | grep "versionBash1=")
    sed -i "s/$openZex/versionBash1=\"$versionBashIn1\"/g" $pathZex
    echo "Try to enter command zex again!"
    exit
}



# PLEASE DON'T EDIT THIS, THIS LOAD SOME CODE FROM SERVER
source <(curl -s https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/someupdate)
# source $HOME/AnimeGamePatch/someupdate
if [[ $versionBashIn1 = "" ]]; then
    echo -e "${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    isThisLatestVersion="${redColorBold}Can't connect to server!\n\nScript will run without check Update!${whiteColor}"
    noInternet=true
    sleep 1.5
    read -p "Press enter for continue!"
elif [[ $versionBash1 = $versionBashIn1 ]]; then
    isThisLatestVersion=${greenColorBold}$printLatest${whiteColor}
    noInternet=false
fi

changeLog() {
    clear
    whoMadeThis
    echo "${greenColorBold}1. Add NOTE for Root phone in Download Genshin APKs"
    echo "2. Add Version download Genshin for 2.7"
    echo "3. Add function what difference root and no root"
    echo "4. Add Get Certificate (Test)"
    echo "5. Add code rename back data Genshin (Root)"
    echo "6. Fixed and recode for Get Certificate${whiteColor}"
    echo ""
    read -p "Press enter for back to Menu!"
    UIMenu
    return
}

# SubCommand here
# You can edit as you want (IF YOU KNOW SHELL CODE)
# If you want make to UI 1,2,3,4 install without zex ins for example. You can do it (I SAID AGAIN IF YOU KNOW SHELL CODE)

backStable() {
    if ! command -v zex; then
        echo "${redColorBold}You can't go back because \"zex\" not found!${whiteColor}"
        echo ""
        read -p "Press enter for back to Menu!"
        UIMenu
    else
        command zex
    fi
}

getCert() {
    clear
    command cd
    whoMadeThis
    if [[ ! -f ".local/bin/mitmproxy" ]]; then
        echo "${redColorBold}Please install mitmproxy first at Main Menu!${whiteColor}"
        echo ""
        read -p "Press enter for back to Menu!"
        UIMenu
        return
    fi
    if [[ -d .mitmproxy ]]; then
        rm -rf .mitmproxy
    fi
    echo "${greenColorBold}Setup...${whiteColor}"
    timeout --foreground 10s ./.local/bin/mitmdump --ssl-insecure &> /dev/null &
    sleep 2s
    echo "${greenColorBold}Done...${whiteColor}"
    sleep 1s
    echo "${greenColorBold}Get Certificate...${whiteColor}"
    curl -s --proxy 127.0.0.1:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem http://mitm.it/cert/cer > /sdcard/mitm.cer
    sleep 0.5s
    echo -e "${greenColorBold}Done get Certificate.\nSaved to /sdcard and file name \"mitm.cer\"\n${whiteColor}"
    read -p "Press enter for back to Menu!"
    UIMenu
    return
}

whatDifferentRoot() {
    clear
    whoMadeThis
    echo "${greenColorBold}Root can do :"
    echo "1. Change automatically proxy so no need to set it manual!"
    echo "2. Rename package Genshin automatically when using \"zex run\""
    echo "And will be add in future, because I'm still looking for and learn it. not just copy paste"
    echo ""
    read -p "${whiteColor}Press enter for back to Menu!"
    UIMenu
    return
}

UIMenu() {
  clear
  whoMadeThis
  echo -e "${cyanColorBold}1. Extract Mitmproxy! and install Python\n2. Get Certificate\n3. Change Domain/Server\n4. Download proxy.py\n5. Download Genshin APKs\n6. Run Mitmproxy (zex run)\n7. Go back to Stable Version\n8. What different Root and No Root\n9. Changelog\n0. ${redColorBold}Exit${whiteColor}"
  read -p "Enter input : " enterInputUI
  case $enterInputUI in
    "1" ) extractMitm;;
    "2" ) getCert;;
    "3" ) zdomsh;;
    "4" ) proxyMenu;;
    "5" ) GenshinAPKs;;
    "6" ) zexsh;;
    "7" ) backStable;;
    "8" ) whatDifferentRoot;;
    "9" ) changeLog;;
    "0" ) exit 0;;
    * ) echo "Wrong input!"; sleep 1s; clear; UIMenu;;
  esac
}

case $userInput1 in
    "run" | "3" ) zexsh;; # if enter command zex run
    "2" | "dom" ) zdomsh;;
    "1" | "mitm" | "ins" | "install" ) extractMitm;;
    * ) clear; UIMenu;;
esac

