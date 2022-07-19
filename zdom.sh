command clear
command cd

# do not use curl **** | bash it make error IDK
# This script will not get any updates, because this 100% offline i mean no detect there is Update so no update for this
# For latest version using zex dom go to https://github.com/ElaXan/AnimeGamePatch

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
blueColor="$(printf '\033[0;34m')"
cyanColorUnder="$(printf '\033[4;36m')"
greenColorUnder="$(printf '\033[4;32m')"
redColorUnder="$(printf '\033[4;31m')"
blueColorUnder="$(printf '\033[4;34m')"

whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\n${yellowColor}Script was made by @ElashXander (Telegram)${whiteColor}\n----------------------------------------\n${blueColor}Script convert from\n${blueColorUnder}https://github.com/ElaXan/AnimeGamePatch${whiteColor}\n========================================"
}

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
    read -p "${yellowColorBole}Are you sure want change to ${greenColorBold}$domainChange${whiteColor}? (y/n) : " serverDownSure
    case $serverDownSure in
        "y" | "Y" ) changeServer2;;
        "n" | "N" ) echo "${yellowColorBold}Change domain cancelled by user!${whiteColor}"; exit;;
        * ) echo "Wrong input!"; exit
    esac
}

changeServer2 () {
    command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domainChange\"/g" $HOME/proxy.py &> $ZERR
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
    curl -Ism 2 -f https://$domain &> /dev/null
    if [[ $? != 0 ]]; then
        echo -e "Server is can't to be access!\n"
        read -p "You sure want change to $domain? (y/n/r) : " youSureBruh
        case $youSureBruh in
            "y" | "Y" ) command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" $HOME/proxy.py &> $ZERR;;
            "n" | "N" ) echo "Okay! server not changed!"; exit;;
            "r" | "R" ) customserver;;
            * ) echo "Wrong input!"; exit;;
        esac
    else
        command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" $HOME/proxy.py &> $ZERR
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

checkServerYuukiSG=command curl -Ism 2 -f https://sg.game.yuuki.me &> /dev/null
resultsCheckServerYuukiSG=$?
checkServerYuukiDE=command curl -Ism 2 -f https://de.game.yuuki.me &> /dev/null
resultsCheckServerYuukiDE=$?
checkServerMINE=command curl -Ism 2 -f https://hk.elashxander.my.id &> /dev/null
resultsCheckServerMINE=$?

if [[ $resultsCheckServerYuukiSG = 28 ]]; then
    statusServerYuukiSG="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiSG=1
elif [[ $resultsCheckServerYuukiSG = 6 ]]; then
    statusServerYuukiSG="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiSG=1
elif [[ $resultsCheckServerYuukiSG = 0 ]]; then
    statusServerYuukiSG="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiSG=0
fi

if [[ $resultsCheckServerYuukiDE = 28 ]]; then
    statusServerYuukiDE="${redColorBold}[DOWN]${whiteColor}"
    downServerYuukiDE=1
elif [[ $resultsCheckServerYuukiDE = 6 ]]; then
    statusServerYuukiDE="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
    downServerYuukiDE=1
elif [[ $resultsCheckServerYuukiDE = 0 ]]; then
    statusServerYuukiDE="${greenColorBold}[RUNNING]${whiteColor}"
    downServerYuukiDE=0
fi

if [[ $resultsCheckServerMINE = 28 ]]; then
    statusServerMINE="${redColorBold}[DOWN]${whiteColor}"
    downServerMINE=1
elif [[ $resultsCheckServerMINE = 6 ]]; then
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
