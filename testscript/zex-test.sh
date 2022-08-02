#!/data/data/com.termux/files/usr/bin/bash

# SCRIPT NOT ENCRYPTED FOR YOU CAN LEARN THE CODE BASH / SHELL SCRIPT.
# THIS CODE IS FREE
# CODE STILL DEVELOPMENT FOR FIX SOME CODE AND ADD CODE.

# THANKS TO @CharonCB21 (Telagram) for Helping me about this



userInput1=$1
nameScript=$(basename "$0")


# ================== extract.sh START ================== #

# Extract Mitmproxy
extractMitm() {
    clear
    whoMadeThis
    mitmproxyPath=$HOME/.local/bin/mitmproxy
    if [[ -f $mitmproxyPath ]]; then
        echo "${yellowColorBold}mitmproxy already installed!${greenColorBold}"
        sleep 1s
        echo -n "Press enter for back to Menu!${whiteColor}"
        read -r
        clear
        UIMenu
        return
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
    command cd || echo
    echo "${greenColorBold}Download mitmproxy file!${whiteColor}"
    wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz -q --show-progress
    wgetDownloadFailed=$?
    if [[ "$wgetDownloadFailed" != 0 ]]; then
        clear
        whoMadeThis
        echo "Failed to download mitmproxy files!"
        sleep 1s
        exit
    else
        clear
        whoMadeThis
        command cd || echo
        echo "${greenColorBold}Extracting Mitmproxy files!${whiteColor}"
        tar -zxf "$HOME"/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions
        clear
        rm mitmproxy.tar.gz
        clear
        whoMadeThis
        if ! command -v python &> /dev/null; then
            clear
            whoMadeThis
            echo "${greenColorBold}Install Python!${whiteColor}"
            command pkg install python -y
            if ! command -v python &> /dev/null; then
                clear
                whoMadeThis
                echo "${redColorBold}Install python failed!${whiteColor}"
                echo -n "Press enter for back to main menu!"
                read -r
                clear
                UIMenu
                return
            fi
        fi
        clear
        whoMadeThis
        echo "${greenColorBold}Download zex${whiteColor}"
        sleep 0.5s
        cd "$PREFIX"/bin || echo
        rm zex
        wget https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/zex.sh -q --show-progress
        wgetDownloadFailed2=$?
        if [[ "$wgetDownloadFailed2" != 0 ]]; then
            clear
            whoMadeThis
            echo "${redColorBold}Error for Download zex!${whiteColor}"
            exit
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
        echo -e "${greenColorBold}Done extract/install mitmproxy!...\n${whiteColor}"
        command cd || echo
        if [[ -f proxy.py ]]; then
            rm proxy.py
        fi

        if [[ -f proxy_config.py ]]; then
            rm proxy_config.py
        fi
        echo -n "Press enter for back to menu!"
        read -r
        clear
        UIMenu
        return
    fi
}









# ================== zdom.sh START ================== #


zdomsh() {
clear
command cd || echo

changeServer() {
    clear
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
    command cd || echo
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\nPlease Download it at Main Menu!${whiteColor}\n"
        echo -n "Press enter for back to Main Menu!"
        read -r
        UIMenu
        return
    fi
    echo -e "${redColorBold}Server is down${whiteColor}\n"
    echo -n "${yellowColorBold}Are you sure want change to ${greenColorBold}$domainChange${whiteColor}? (y/n) : "
    read -r serverDownSure
    case $serverDownSure in
        "y" | "Y" ) changeServer2;;
        "n" | "N" ) echo "${yellowColorBold}Change domain cancelled by user!${whiteColor}"; exit;;
        * ) echo "Wrong input!"; exit
    esac
}

changeServer2 () {
    command cd || echo
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it at Main Menu!${whiteColor}\n"
        echo -n "Press enter for back to Main Menu!"
        read -r
        UIMenu
        return
    fi
    command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domainChange\"/g" "$HOME"/proxy_config.py &> "$ZERR"
    ifeditfailed=$?
    if [[ "$ifeditfailed" != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat "$ZERR"
        rm "$ZERR"
        exit
    else
        echo -e "The Domain changed to $domainChange\n"
        rm "$ZERR"
        echo -n "Press Enter to change server "
        read -r
        clear
        zdomsh
    fi
}

customserver() {
    command cd || echo
    clear
    whoMadeThis
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it at Main Menu!${whiteColor}\n"
        echo -n "Press enter for back to Main Menu!"
        read -r
        UIMenu
        return
    fi
    echo -e "Custom Domain!\nExample : elashxander.my.id\nB : Back to change server\n"
    echo -n "Enter custom Domain : "
    read -r domain
    if [[ $domain = "B" ]] || [[ $domain = "b" ]] || [[ $domain = "Back" ]] || [[ $domain = "BACK" ]]; then
        clear
        changeServer
    else
        domain=$(echo "$domain" | sed "s/http.*\/\///g") # Thanks to Charon Baglari
        curl -Ism 2 -f https://"$domain" &> /dev/null
    fi
    ifcurleditfail=$?
    if [[ "$ifcurleditfail" != 0 ]]; then
        echo -e "Server is can't to be access!\n"
        echo -n "You sure want change to $domain? (y/n/r) : "
        read -r youSureBruh
        case $youSureBruh in
            "y" | "Y" ) command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" "$HOME"/proxy_config.py &> "$ZERR";;
            "n" | "N" ) echo "Okay! server not changed!"; exit;;
            "r" | "R" ) customserver;;
            * ) echo "Wrong input!"; exit;;
        esac
    else
        command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" "$HOME"/proxy_config.py &> "$ZERR"
    fi
    ifeditsedfail=$?
    if [[ "$ifeditsedfail" != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat "$ZERR"
        rm "$ZERR"
        exit
    else
        echo -e "The Domain changed to $domain\n"
        rm "$ZERR"
        echo -n "Press Enter to change server "
        read -r
        clear
        zdomsh
    fi
}

ZERR=/data/user/0/com.termux/cache/zlog
whoMadeThis
command cd || echo
if [[ -f "proxy_config.py" ]]; then
    serverUsing=$(echo proxy_config.py | grep "REMOTE_HOST = \"" | sed "s/.*= //g" | sed "s/\"//g")
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

curl -Ism 3 -f https://sg.game.yuuki.me &> /dev/null
resultsCheckServerYuukiSG=$?
curl -Ism 3 -f https://de.game.yuuki.me &> /dev/null
resultsCheckServerYuukiDE=$?
curl -Ism 3 -f https://hk.elashxander.my.id &> /dev/null
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

downServer=$((downServerYuukiSG+downServerYuukiDE+downServerMINE))

if [[ $resultsCheckServerYuukiSG = 28 ]] || [[ $resultsCheckServerYuukiDE = 28 ]] || [[ $resultsCheckServerMINE = 28 ]]; then
    echo -e "\n${redColorBold}There is $downServer server DOWN${whiteColor}\n========================================"
elif [[ $resultsCheckServerYuukiSG = 6 ]] || [[ $resultsCheckServerYuukiDE = 6 ]] || [[ $resultsCheckServerMINE = 6 ]]; then
    echo "========================================"
elif [[ $resultsCheckServerYuukiSG = 0 ]] || [[ $resultsCheckServerYuukiDE = 0 ]] || [[ $resultsCheckServerMINE = 0 ]]; then
    echo "========================================"
fi

echo -e "Select Server\n1. Yuuki (Singapore) : $statusServerYuukiSG\n2. Yuuki (German) :  $statusServerYuukiDE\n3. My Server (Hongkong) : $statusServerMINE\n4. Custom\n5. BACK\n\nExample : 1 for select Yuuki Server"
echo -n "Enter input : "
read -r inpsrv

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

changeProxy() {
    clear
    whoMadeThis
    if [[ $isRooted = true ]]; then
        echo -e "${redColorBold}mitmproxy killed/force stopped!\n\n${greenColorBold}Reset Proxy..."
        su -c settings put global http_proxy :0
        sleep 0.5s
        echo "Done!${whiteColor}"
        genshinData=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | grep "zex")
        zexPackage=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | sed "s/.*zex//g")
        if [[ ${genshinData} = "com.miHoYo.GenshinImpact" ]] && [[ ${zexPackage} = "com.miHoYo.GenshinImpact" ]]; then
            echo "${redColorBold}Skip Rename Package${whiteColor}"
        elif [[ ${zexPackage} = "com.miHoYo.GenshinImpact" ]]; then
            echo "${redColorBold}Skip Rename Package${whiteColor}"
        elif [[ ${genshinData} = "com.miHoYo.GenshinImpactzex" ]]; then
            echo "${greenColorBold}Rename back Data Genshin..."
            sleep 0.5s
            su -c mv /sdcard/Android/data/com.miHoYo.GenshinImpactzex /sdcard/Android/data/com.miHoYo.GenshinImpact
            echo "Done!${whiteColor}"
        fi
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    else
        echo -e "${redColorBold}mitmproxy killed/force stopped!${whiteColor}\n"
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
}

mitmProxyRun() {
    command cd || echo
    clear
    whoMadeThis
    if [[ -f ./.local/bin/mitmdump ]]; then
        command cd || echo
        if [[ ! -f proxy.py ]] || [[ ! -f proxy_config.py ]]; then
            echo "${redColorBold}proxy.py not found, please download it in main menu!${whiteColor}"
            echo ""
            echo -n "Press Enter for back to menu!"
            read -r
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
                    echo -n "Enter input (y/n) : "
                    read -r renamePackage
                    case $renamePackage in
                        "y" | "Y" ) cd /sdcard/Android/data || echo; su -c mv com.miHoYo.GenshinImpact com.miHoYo.GenshinImpactzex; echo -e "${greenColorBold}Done Rename!${whiteColor}\n========================================"; command cd || echo;;
                        "n" | "N" ) echo -e "${yellowColorBold}Okay! Rename by yourself!${whiteColor}\n========================================"; sleep 0.4s;;
                        * ) echo -e "${redColorBold}Wrong Input!\nSkip Rename!${whiteColor}\n========================================"; sleep 0.5s;;
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
        mitmKilled=$(cat "$HOME"/zkill.log &> /dev/null)
        if [[ $mitmKilled = "Killed" ]]; then
            echo "mitmproxy killed/force stop!"
            exit
        fi
        
        
        ./.local/bin/mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
        ifmitmdumpfailed=$?
        if [[ "$ifmitmdumpfailed" != 0 ]]; then
            if [[ $killMitms = 2 ]]; then
                echo "${redColorBold}I can't fix this error. Try restart your phone!"
                exit
            fi
            if [[ $killMitms = 1 ]]; then
                echo "${yellowColorBold}Trying seconds method!${whiteColor}"
                killMitmd=$(ps ax > "$HOME"/z.log; grep "mitmdump" "$HOME"/z.log | sed "s/ pts\/1.*false//g")
                kill "$killMitmd"
                echo "Killed" > "$HOME"/zkill.log
                rm "$HOME"/z.log
                sleep 0.5
                echo "${greenColorBold}Trying run again...${whiteColor}"
                sleep 1s
                killMitms=2
                mitmProxyRun
            fi
            echo "${yellowColorBold}Trying fix this Issue!"
            sleep 1s
            echo "Killed" > "$HOME"/zkill.log
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
    echo -n "Press enter for back to Menu!"
    read -r
    clear
    proxyMenu
}


proxyMenu() {
    cd || echo
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
    echo -n "Enter input : "
    read -r proxyInput
    while true; do
    case $proxyInput in
        "1" ) downloadproxy; break;;
        "2" ) clear; UIMenu break;;
        * ) echo "Wrong input!"; proxyMenu;;
    esac
    done
}


downloadYesGenshin() {
    clear
    whoMadeThis
    command cd || echo
    if ! command -v wget &> /dev/null; then
        pkg install wget
    fi
    echo "${yellowColorBold}Download Genshin apks. [PLEASE WAIT!]${whiteColor}"
    if [[ $dgenshininp = "1" ]]; then
        if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
            echo "${greenColorBold}Genshin_Impact_2.8.apks already exist in /sdcard !${whiteColor}"
            echo ""
            echo -n "Press enter to back Menu!"
            read -r
            UIMenu
            return
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
            echo "Press enter to back Menu!"
            read -r
            UIMenu
            return
        else
            versionGenshin="2.7"
            if [[ -f "$HOME/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
                rm "$HOME/Genshin.Impact.Cert.Patch_Sign.apk"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/2.7/Genshin.Impact.Cert.Patch_Sign.apk -q --show-progress
        fi
    fi
    ifdownloadgenshinfailed=$?
    if [[ "$ifdownloadgenshinfailed" != 0 ]]; then
        clear
        whoMadeThis
        echo "${redColorBold}Download Failed!${whiteColor}"
        echo ""
        echo -n "Press enter go back to Menu!"
        read -r
        UIMenu
        return
    else
        clear
        whoMadeThis
        echo "${greenColorBold}Download Successfully!${whiteColor}"
        sleep 0.5s
        echo "${greenColorBold}Move apks Genshin to /sdcard${whiteColor}"
        sleep 0.5s
        if [[ -f "Genshin_Impact_2.8.apks" ]]; then
            mv Genshin_Impact_2.8.apks /sdcard
        elif [[ -f "Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
            mv Genshin.Impact.Cert.Patch_Sign.apk /sdcard
        else
            echo "${redColorBold}File Genshin APKs not found!"
            echo ""
            echo -n "Press Enter for back to Menu!"
            read -r
            clear
            UIMenu
            return
        fi
    fi
    if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
        echo -e "${greenColorBold}Success move to /sdcard !\n\nInstall with SAI Installer or other apk that support install .apks${whiteColor}"
        if [[ $isRooted = true ]]; then
            if [[ $versionGenshin = "2.8" ]]; then
                echo "Can't do Install automatically with \"pm install\" because file name is .apks so install manually"
            elif [[ $versionGenshin = "2.7" ]]; then
                cd /sdcard || echo
                pm install Genshin.Impact.Cert.Patch_Sign.apk
            fi
        fi
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
    else
        echo "${redColorBold}Failed to move Genshin APKs to /sdcard${whiteColor}"
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
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
    echo -n "Enter input (y/n) : "
    read -r dwngenshin
    case $dwngenshin in
        "y" | "Y" ) downloadYesGenshin;;
        "n" | "N" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; UIMenu;;
    esac
}

GenshinAPKs() {
    clear
    command cd || echo
    whoMadeThis
    echo "1. ${greenColorBold}Genshin Impact Version 2.8${whiteColor}"
    echo "2. ${yellowColorBold}Genshin Impact Version 2.7${whiteColor}"
    echo "3. Back"
    echo ""
    echo -n "Enter input : "
    read -r dgenshininp
    case $dgenshininp in
        "1" | "2" ) downloadGenshin;;
        "3" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; GenshinAPKs;;
    esac
}

greenColorBold="$(printf '\033[1;32m')"
redColorBold="$(printf '\033[1;31m')"
yellowColorBold="$(printf '\033[1;33m')"
cyanColorBold="$(printf '\033[1;36m')"
whiteColor="$(printf '\033[0;37m')"
yellowColor="$(printf '\033[0;33m')"

# IDK WHY THIS ERROR, SO I WILL FIX THIS AS SOON AS POSSIBLE

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

isFDroid=$(export | tee "$HOME"/isFdroid.zex | grep "TERMUX_APK_RELEASE" "$HOME"/isFdroid.zex  | sed "s/declare -x TERMUX_APK_RELEASE=//g" | sed "s/\"//g")
if [[ $isFDroid != "F_DROID" ]]; then
    rm "$HOME"/isFDroid.zex
    FDroidTermux="${redColorBold}I recommend you using Termux from F-Droid${whiteColor}\n========================================"
else
    rm "$HOME"/isFDroid.zex
    FDroidTermux="========================================"
fi

clear
whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n${yellowColorBold}Development Version (Maybe there is Bug)\n${printRooted}${whiteColor}\n========================================\n${greenColorBold}This only for test Script\nbefore update to Stable Version...${whiteColor}\n$FDroidTermux"
}


 

# PLEASE DON'T EDIT THIS, THIS LOAD SOME CODE FROM SERVER
# Why Shell Check this said problem... TF
source <(curl -s https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/someupdate)
# source $HOME/AnimeGamePatch/someupdate

changeLog() {
    clear
    whoMadeThis
    echo "${greenColorBold}1. Add code detect package Genshin (Root)"
    echo "2. Fix some code"
    echo "3. Add install certificate to Root"
    echo "4. Add function remove Certificate from Root${whiteColor}"
    echo "5. Remove unnecessary code and fix code"
    echo ""
    echo -n "Press enter for back to Menu!"
    read -r
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
        echo "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    else
        command zex
    fi
}

getCert() {
    clear
    command cd || echo
    whoMadeThis
    if [[ ! -f ".local/bin/mitmproxy" ]]; then
        echo "${redColorBold}Please install mitmproxy first at Main Menu!${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
    if [[ -d .mitmproxy ]]; then
        rm -rf .mitmproxy
    fi
    detectCertInstalled=/system/etc/security/cacerts/zexCert
    if [[ $isRooted = true ]]; then
        if [[ -f $detectCertInstalled ]]; then
            echo "${redColorBold}Certificate already exist..."
            echo "Do you want to remove it?${whiteColor}"
            echo ""
            echo -n "Enter input (y/n) : "
            read -r askDeleteCert
            case $askDeleteCert in
                "y" | "Y" ) su -c rm $detectCertInstalled; echo "${greenColorBold}Certficiate done deleted...${whiteColor}"; sleep 1s; clear; whoMadeThis;;
                "n" | 'N' ) echo "${greenColorBold}Cancel deleted cert by users!${whiteColor}"; sleep 1s; clear; whoMadeThis;;
                * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; getCert;;
            esac
        fi
    fi
    echo "${greenColorBold}Setup...${whiteColor}"
    timeout --foreground 10s ./.local/bin/mitmdump --ssl-insecure &> /dev/null &
    sleep 2s
    echo "${greenColorBold}Done...${whiteColor}"
    sleep 1s
    echo "${greenColorBold}Get Certificate...${whiteColor}"
    curl -s --proxy 127.0.0.1:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem http://mitm.it/cert/cer > /sdcard/mitm.cer
    sleep 0.5s
    if [[ $isRooted = true ]]; then
        echo "========================================"
        echo "${greenColorBold}Do you want to install Certificate as Root?${whiteColor}"
        echo "${yellowColorBold}i'm not take any responsibility if there is something wrong with your Phone"
        echo "or even can't delete for the certficate${whiteColor}"
        echo ""
        echo -n "Enter input (y/n) : "
        read -r installCert
        case $installCert in
            "y" | "Y" ) echo "${yellowColorBold}Okay will continue install cert as Root!${whiteColor}"; sleep 1s;;
            "n" | "N" ) echo -e "${greenColorBold}Okay cancell for install cert as Root!\nCertificate file saved in /sdcard and file name \"mitm.cer\"${whiteColor}"; sleep 1s; echo ""; echo -n "Press enter for back to Menu!"; read -r; UIMenu;;
            * ) echo -e "Wrong Input!\n${greenColorBold}Will skip for install cert as Root!\nCertificate file saved in /sdcard and file name \"mitm.cer\"${whiteColor}"; sleep 1s; echo ""; echo -n "Press enter for back to Menu!"; read -r; UIMenu; return ;;
        esac
        clear
        whoMadeThis
        echo "${greenColorBold}Install certificate...${whiteColor}"
        pathCertRoot=/system/etc/security/cacerts/zexCert
        echo "${greenColorBold}Mount target to /${whiteColor}"
        su -c mount -o rw,remount /
        sleep 0.5s
        echo "${greenColorBold}Success mount... Now copying certificate!${whiteColor}"
        su -c mv /sdcard/mitm.cer "$pathCertRoot"
        sleep 0.5s
        echo "${greenColorBold}Set Permission...${whiteColor}"
        su -c chmod 644 "$pathCertRoot"
        if [[ ! -f $pathCertRoot ]]; then
            echo "${redColorBold}Failed install certificate as Root!${whiteColor}"
            echo ""
            echo -n "Press enter for back to Menu!"
            read -r
            UIMenu
            return
        else
            echo "${greenColorBold}Certificate Success install as Root${whiteColor}"
            echo ""
            echo -n "Press enter for back to Menu!"
            read -r
            UIMenu
            return
        fi
    else
        echo -e "${greenColorBold}Done get Certificate.\nSaved to /sdcard and file name \"mitm.cer\"\n${whiteColor}"
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
}

removeCertRoot() {
    clear
    whoMadeThis
    if [[ "$isRooted" = false ]]; then
        echo "${redColorBold}This feature only for Rooted phone!${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
    rmpathCertRoot=/system/etc/security/cacerts/zexCert
    echo "${greenColorBold}Mount target to /${whiteColor}"
    su -c mount -o rw,remount /
    sleep 0.5s
    echo "${greenColorBold}Check certficate...${whiteColor}"
    if [[ ! -f "$rmpathCertRoot" ]]; then
        echo "${redColorBold}There is no Certificate...${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    else
        su -c rm "$rmpathCertRoot"
        if [[ ! -f $rmpathCertRoot ]]; then
            echo "${greenColorBold}Success remove Certificat Root!${whiteColor}"
            echo ""
            echo -n "Press enter for back to Menu"
            read -r
            UIMenu
            return
        else
            echo "${redColorBold}Can't Remove Certificat, IDK how to fix it"
        fi
    fi
}

whatDifferentRoot() {
    clear
    whoMadeThis
    echo "${greenColorBold}Root can do :"
    echo "1. Change automatically proxy so no need to set it manual!"
    echo "2. Rename package Genshin automatically when using \"zex run\""
    echo "And will be add in future, because I'm still looking for and learn it. not just copy paste"
    echo ""
    echo -n "${whiteColor}Press enter for back to Menu!"
    read -r
    UIMenu
    return
}




UIMenu() {
  clear
  whoMadeThis
  echo -e "${cyanColorBold}1. Extract Mitmproxy! and install Python\n2. Get Certificate\n3. Remove Certificate Root\n4. Change Domain/Server\n5. Download proxy.py\n6. Download Genshin APKs\n7. Run Mitmproxy (zex run)\n8. Go back to Stable Version\n9. What different Root and No Root\n10. Changelog\n0. ${redColorBold}Exit${whiteColor}"
  echo -n "Enter input : "
  read -r enterInputUI
  case $enterInputUI in
    "1" ) extractMitm;;
    "2" ) getCert;;
    "3" ) removeCertRoot;;
    "4" ) zdomsh;;
    "5" ) proxyMenu;;
    "6" ) GenshinAPKs;;
    "7" ) zexsh;;
    "8" ) backStable;;
    "9" ) whatDifferentRoot;;
    "10" ) changeLog;;
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

