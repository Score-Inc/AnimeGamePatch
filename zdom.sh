#!/bin/bash

command clear
command cd

whoMadeThis() {
echo -e "========================================\n               ZEX HERE\n----------------------------------------\nScript was made by @ElashXander (Telegram)\n----------------------------------------\nAny support join Discord\nhttps://discord.gg/GenshinPS\n========================================"
}

asiaserver() {
    command clear
    whoMadeThis
    command sed -i "s/default = \".*\",/default = \"hk.genshinps.me\",/g" $HOME/proxy.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to hk.genshinps.me"
        rm $ZERR
    fi
}

euserver() {
    command clear
    whoMadeThis
    command sed -i "s/default = \".*\",/default = \"eu.genshinps.me\",/g" $HOME/proxy.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to eu.genshinps.me"
        rm $ZERR
    fi
}

eu2server() {
    command clear
    whoMadeThis
    command sed -i "s/default = \".*\",/default = \"eu2.genshinps.me\",/g" $HOME/proxy.py &> $ZERR
    if [[ $? != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat $ZERR
        rm $ZERR
        exit
    else
        echo "The Domain changed to eu2.genshinps.me"
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
echo -e "Select Server\n1. HK/Asia Server\n2. Europe/EU Server\n3. Europe2/EU2 Server\n4. Custom\n\nExample : 1 for select Asia Server"
read -p "Enter input : " inpsrv

case $inpsrv in
    "1" ) asiaserver
          ;;
    "2" ) euserver
          ;;
    "3" ) eu2server
          ;;
    "4" ) customserver
          ;;
    * ) echo "Wrong Input!"
        ;;
esac

