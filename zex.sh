#!/bin/bash

installmitmproxy() {
    if [[ -d "AnimeGamePatch" ]]; then
        bash AnimeGamePatch/install.sh
    else
        bash "Error"
        exit
    fi
}

if [ -f "$HOME/.local/bin/mitmdump" ]; then
    mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
else
    echo -e "Please download mitmproxy\n"
    sleep 2s
    read -p "Do you want to download it? (y/n)" asktodownload
    case $asktodownload in
        "y" ) installmitmproxy;;
        "n" ) echo "Okay!";;
        * ) echo "Wrong imput!!";;
    esac
fi
