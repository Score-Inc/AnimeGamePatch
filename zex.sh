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
    echo "${greenColorBold}Download mitmproxy file!${whiteColor}"
    wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz
    if [[ $? != 0 ]]; then
        clear
        whoMadeThis
        echo "Failed to download mitmproxy files!"
        sleep 1s
        exit
    else
        clear
        whoMadeThis
        echo "${greenColorBold}Extracting Mitmproxy files!${whiteColor}"
        tar -zxf $HOME/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions
        clear
        rm mitmproxy.tar.gz
        echo "${greenColorBold}Download zex${whiteColor}"
        cd $PREFIX/bin
        rm zex
        wget https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/zex.sh
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
        clear
        whoMadeThis
        echo -e "${greenColorBold}Done installed!\n\nPlease exit termux then open again and type zex...${whiteColor}"
        command cd
        rm proxy.py
        exit
    fi
}









# ================== zdom.sh START ================== #

downloadproxy() {
    cd
    clear
    whoMadeThis
    if [[ -f proxy.py ]] || [[ -f proxy_config.py ]]; then
        echo "${yellowColorBold}Failed : proxy.py already download${whiteColor}"
        echo ""
        read -p "${greenColorBold}Press enter for back to Menu!${whiteColor}"
        zdomsh
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
    echo "${greenColorBold}proxy.py successfully download!${whiteColor}"
    echo ""
    read -p "Press enter for back to Menu!"
    zdomsh
}


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
    echo -e "${redColorBold}Server is down${whiteColor}\n"
    read -p "${yellowColorBold}Are you sure want change to ${greenColorBold}$domainChange${whiteColor}? (y/n) : " serverDownSure
    case $serverDownSure in
        "y" | "Y" ) changeServer2;;
        "n" | "N" ) echo "${yellowColorBold}Change domain cancelled by user!${whiteColor}"; exit;;
        * ) echo "Wrong input!"; exit
    esac
}

changeServer2 () {
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
        zdomsh
        exit
    fi
}

customserver() {
    command clear
    whoMadeThis
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
        command sed -i "s/REMOTE_HOST = \".*\",/REMOTE_HOST = \"$domain\"/g" $HOME/proxy_config.py &> $ZERR
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
        zdomsh
        exit
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
    echo -e "\nThere is $downServer server DOWN\n${yellowColorBold}${whiteColor}\n========================================"
elif [[ $resultsCheckServerYuukiSG = 6 ]] || [[ $resultsCheckServerYuukiDE = 6 ]] || [[ $resultsCheckServerMINE = 6 ]]; then
    echo "========================================"
elif [[ $resultsCheckServerYuukiSG = 0 ]] || [[ $resultsCheckServerYuukiDE = 0 ]] || [[ $resultsCheckServerMINE = 0 ]]; then
    echo "========================================"
fi

echo -e "Select Server\n1. Yuuki (Singapore) : $statusServerYuukiSG\n2. Yuuki (German) :  $statusServerYuukiDE\n3. My Server (Hongkong) : $statusServerMINE\n4. Custom\n5. Download proxy.py\n6. BACK\n\nExample : 1 for select Yuuki Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" | "2" | "3" ) changeServer;;
    "4" ) customserver;;
    "5" ) downloadproxy;;
    "6" ) clear; UIMenu;;
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

mitmProxyRun() {
    command cd
    if [[ -f ./.local/bin/mitmdump ]]; then
        command cd
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
                rm $HOME/z.log
                sleep 0.5
                echo "${greenColorBold}Trying run again...${whiteColor}"
                sleep 1s
                killMitms=2
                mitmProxyRun
            fi

            echo "${yellowColorBold}Trying fix this Issue!"
            sleep 1s
            pkill -9 mitmdump
            sleep 0.5
            echo "${greenColorBold}Trying run again...${whiteColor}"
            killMitms=1
            clear
            mitmProxyRun
        fi
        exit
    else
        echo -e "${redColorBold}mitmproxy not found!\nPlease download it using ${nameScript} 1\n"
        exit
    fi
}
mitmProxyRun
}
# ================== zex.sh END ================== #

clear
whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n$isThisLatestVersion\n========================================"
}

versionBash1="2.4"

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
elif [[ $versionBash1 > $versionBashIn1 ]]; then
    clear
    echo -e "$whatTheFuckEditVersion"
    exit
    # echo -e "\nWant to fix this?\n"
    # read -p "Enter input (y/n) : " fixVersionScript
    # case $fixVersionScript in
    #    "y" ) fixVersionScripts;;
    #    "n" ) exit;;
    #    * ) echo "Wrong Input!"; exit;;
    # esac
elif [[ $versionBash1 < $versionBashIn1 ]]; then
    newUpdateScript() {
        clear
        echo -e "$updateNote $versionBashIn1\n\nWhat is new/update? :\n$updateNotif\n"
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
    noInternet=false
fi

# SubCommand here
# You can edit as you want (IF YOU KNOW SHELL CODE)
# If you want make to UI 1,2,3,4 install without zex ins for example. You can do it (I SAID AGAIN IF YOU KNOW SHELL CODE)

UIMenu() {
  whoMadeThis
  echo -e "${cyanColorBold}1. Extract Mitmproxy! and install Python\n2. Change Domain/Server\n3. Run Mitmproxy (zex run)\n4. ${redColorBold}Exit${whiteColor}"
  read -p "Enter input : " enterInputUI
  case $enterInputUI in
    "1" ) extractMitm;;
    "2" ) zdomsh;;
    "3" ) zexsh;;
    "4" ) exit;;
    * ) echo "Wrong input!"; sleep 1s; clear; UIMenu;;
  esac
}

case $userInput1 in
    "run" | "3" ) zexsh;; # if enter command zex run
    "2" | "dom" ) zdomsh;;
    "1" | "mitm" | "ins" | "install" ) extractMitm;;
    * ) clear; UIMenu;;
esac



