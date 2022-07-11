#!/bin/bash

command clear
command cd

whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\nScript was made by @ElashXander (Telegram)\n----------------------------------------\nAny support join Discord\nhttps://discord.gg/UfAC8dBD4p\n========================================"
}

changeServer() {
    command clear
    whoMadeThis
    domainChange=$inpsrv
    if [[ $domainChange = "1" ]]; then
        domainChange="hk.genshinps.me"
    elif [[ $domainChange = "2" ]]; then
        domainChange="eu.genshinps.me"
    elif [[ $domainChange = "3" ]]; then
        domainChange="eu2.genshinps.me"
    elif [[ $domainChange = "4" ]]; then
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
    if [[ $inpsrv = "4" ]]; then
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
    echo -e "Custom Domain!\nExample : elashxander.my.id\n[DON'T USE https:// or http://]\n\n"
    command read -p "Enter custom Domain : " domain
    curl -Is -m 1 https://$domain &> /dev/null
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
    fi
}

ZERR=/data/user/0/com.termux/cache/zlog
whoMadeThis
command cd

if [[ -f "proxy.py" ]]; then
    echo -e "File target edit to proxy.py"
else
    echo "File not found for proxy.py"
fi

checkServerHK=command curl -Is -m 1 https://hk.genshinps.me &> /dev/null
resultsCheckServerHK=$?
checkServerEU=command curl -Is -m 1 https://eu.genshinps.me &> /dev/null
resultsCheckServerEU=$?
checkServerEU2=command curl -Is -m 1 https://eu2.genshinps.me &> /dev/null
resultsCheckServerEU2=$?
checkServerMINE=command curl -Is -m 1 https://hk.elashxander.my.id &> /dev/null
resultsCheckServerMINE=$?
if [[ $resultsCheckServerHK != 0 ]]; then
    statusServerHK="[DOWN]"
    downServerHK=1
else
    statusServerHK="[RUNNING]"
    downServerHK=0
fi
if [[ $resultsCheckServerEU != 0 ]]; then
    statusServerEU="[DOWN]"
    downServerEU=1
else
    statusServerEU="[RUNNING]"
    downServerEU=0
fi
if [[ $resultsCheckServerEU2 != 0 ]]; then
    statusServerEU2="[DOWN]"
    downServerEU2=1
else
    statusServerEU2="[RUNNING]"
    downServerEU2=0
fi
if [[ $resultsCheckServerMINE != 0 ]]; then
    statusServerMINE="[DOWN]"
    downServerMINE=1
else
    statusServerMINE="[RUNNING]"
    downServerMINE=0
fi
downServer=$(expr $downServerHK + $downServerEU + $downServerEU2 + $downServerMINE)

if [[ $resultsCheckServerHK != 0 ]] || [[ $resultsCheckServerEU != 0 ]] || [[ $resultsCheckServerEU2 != 0 ]] || [[ $resultsCheckServerMINE != 0 ]]; then
    echo -e "\nThere is $downServer server DOWN\n========================================"
else
    echo "========================================"
fi

echo -e "Select Server\n1. HK/Asia Server $statusServerHK\n2. Europe/EU Server $statusServerEU\n3. Europe2/EU2 Server $statusServerEU2\n4. My Server (Hongkong) $statusServerMINE\n5. Custom\n\nExample : 1 for select Asia Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" | "2" | "3" | "4" ) changeServer;;
    "5" ) customserver;;
    * ) echo "Wrong Input!";;
esac
