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
        run_Program() { pkg install wget -y &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "${greenColorBold}Install wget${whiteColor}" "0" "Menu" "UIMenu"
    fi
    run_Program() { yes | pkg update &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${greenColorBold}Update PKG${whiteColor}" "0" "Menu" "UIMenu"
    if [[ -f $HOME/mitmproxy.tar.gz ]]; then
        rm mitmproxy.tar.gz
    fi
    cd $HOME || exit 1
    run_Program() { wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz -q &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${greenColorBold}Download mitmproxy file${whiteColor}" "0" "Menu" "UIMenu"
    cd $HOME || exit 1
    run_Program() { tar -zxf "$HOME"/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${greenColorBold}Extracting Mitmproxy files${whiteColor}" "0" "Menu" "UIMenu"
    rm mitmproxy.tar.gz
    if ! command -v python &> /dev/null; then
        run_Program() { pkg install python -y &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "${greenColorBold}Install Python${whiteColor}" "0" "Menu" "UIMenu"
    fi
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
}