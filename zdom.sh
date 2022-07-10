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
    command sed -i "s/default = \".*\",/default = \"$domainChange\",/g" $HOME/proxy.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to $domainChange"
        rm $ZERR
    fi
}

customserver() {
    command clear
    whoMadeThis
    echo -e "Custom Domain!\nExample : elashxander.my.id\n[DON'T USE https:// or http://]\n\n"
    read -p "Enter custom Domain : " domain
    command sed -i "s/default = \".*\",/default = \"$domain\",/g" $HOME/proxy.py &> $ZERR
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
    echo -e "File target edit to proxy.py\n========================================"
else
    echo "File not found for proxy.py"
fi
echo -e "Select Server\n1. HK/Asia Server\n2. Europe/EU Server\n3. Europe2/EU2 Server\n4. My Server (Hongkong)\n5. Custom\n\nExample : 1 for select Asia Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" | "2" | "3" | "4" ) changeServer;;
    "5" ) customserver;;
    * ) echo "Wrong Input!";;
esac
