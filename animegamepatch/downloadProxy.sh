downloadproxy() {
    clear
    whoMadeThis
    if [[ -f proxy.py ]]; then
        rm proxy.py
    fi
    if [[ -f proxy_config.py ]]; then
        rm proxy_config.py
    fi
    wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy.py &> /dev/null & pid=$!
    spinPID "${greenColorBold}Download proxy.py${whiteColor}"
    clear
    whoMadeThis
    wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy_config.py &> /dev/null & pid=$!
    spinPID "${greenColorBold}Download proxy_config.py${whiteColor}"
    clear
    whoMadeThis
    echo "${greenColorBold}Edit proxy_config.py${whiteColor}"
    sleep 1s
    sed -i "s/REMOTE_HOST = \"localhost\"/REMOTE_HOST = \"sg.genshin.ps.yuuki.me\"/g" proxy_config.py
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
    zdomsh
}


proxyMenu() {
    cd $HOME || exit 1
    clear
    whoMadeThis
    if [[ -f proxy.py ]] || [[ -f proxy_config.py ]]; then
        echo "${greenColorBold}proxy.py already download${whiteColor}"
    else
        echo "${redColorBold}proxy.py not found!${whiteColor}"
    fi
    echo "========================================"
    echo "1. ${greenColorBold}Download proxy.py${whiteColor}"
    echo "0. ${yellowColorBold}Back${whiteColor}"
    echo ""
    echo -n "Enter input : "
    read -r proxyInput
    while true; do
    case $proxyInput in
        "1" ) downloadproxy; break;;
        "0" ) clear; zdomsh break;;
        * ) echo "Wrong input!"; sleep 0.5s; proxyMenu;;
    esac
    done
}