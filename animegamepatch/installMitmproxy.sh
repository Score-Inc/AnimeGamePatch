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
        extractMitm_wget=true
        pkg install wget -y &> /dev/null & pid=$!
        spinPID "${greenColorBold}Install wget${whiteColor}"
    fi
    echo "${greenColorBold}Update PKG${whiteColor}"
    pkg update -y
    if [[ -f $HOME/mitmproxy.tar.gz ]]; then
        rm mitmproxy.tar.gz
    fi
    clear
    whoMadeThis
    if [[ $extractMitm_wget = true ]]; then
        echo "${whiteColor}[${greenColorBold}✓${whiteColor}] ${greenColorBold}Install wget${whiteColor}"
    fi
    echo "${whiteColor}[${greenColorBold}✓${whiteColor}] ${greenColorBold}Update PKG${whiteColor}"
    cd $HOME || exit 1
    wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz -q &
    wgetDownloadFailed=$?
    pid=$!
    spinPID "${greenColorBold}Download mitmproxy file${whiteColor}"
    if [[ "$wgetDownloadFailed" != 0 ]]; then
        clear
        whoMadeThis
        echo "Failed to download mitmproxy files!"
        sleep 1s
        exit
    else
        cd $HOME || exit 1
        tar -zxf "$HOME"/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions & pid=$!
        spinPID "${greenColorBold}Extracting Mitmproxy files${whiteColor}"
        rm mitmproxy.tar.gz
        if ! command -v python &> /dev/null; then
            pkg install python -y &> /dev/null & pid=$!
            spinPID "${greenColorBold}Install Python${whiteColor}"
            if ! command -v python &> /dev/null; then
                echo "${redColorBold}Install python failed!${whiteColor}"
                echo -n "Press enter for back to main menu!"
                read -r
                clear
                UIMenu
                return
            fi
        fi
        echo -e "${greenColorBold}Done extract/install mitmproxy!...\n${whiteColor}"
        cd $HOME || exit 1
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