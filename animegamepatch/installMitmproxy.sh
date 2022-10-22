extractMitm() {
    clear
    showCowsay
    mitmproxyPath=$HOME/.ElaXan/mitmproxy/.local/bin/mitmproxy
    if [ ! -d "$HOME/.ElaXan/mitmproxy" ]; then
        busybox mkdir "$HOME/.ElaXan/mitmproxy"
    fi

    if [[ -f $mitmproxyPath ]]; then
        echo "${yellowColorBold}mitmproxy already installed!${greenColorBold}"
        echo
        echo "${greenColorBold}Do you want to reinstall?${whiteColor}"
        echo -n "Enter input (y/N) : "
        read -r extractMitm_input
        case $extractMitm_input in
        "y" | "Y")
            rm -rf $HOME/.ElaXan/mitmproxy
            clear
            showCowsay
            ;;
        "n" | "N") UIMenu ;;
        *)
            echo "${redColorBold}Wrong input!${whiteColor}"
            sleep 1s
            extractMitm
            ;;
        esac
    fi
    run_Program() {
        yes | pkg update &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Update PKG${whiteColor}" "0" "Menu" "UIMenu"
    if [[ -f $HOME/mitmproxy.tar.gz ]]; then
        rm mitmproxy.tar.gz
    fi
    cd $HOME || exit 1
    run_Program() {
        wget https://github.com/ElaXan/AnimeGamePatch/releases/download/mitm/mitmproxy.tar.gz &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Download mitmproxy file${whiteColor}" "0" "Menu" "UIMenu"
    cd $HOME || exit 1
    run_Program() {
        tar -zxf "$HOME"/mitmproxy.tar.gz -C /data/data/com.termux/files --preserve-permissions &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Extracting Mitmproxy files${whiteColor}" "0" "Menu" "UIMenu"
    rm mitmproxy.tar.gz
    if ! command -v python &>/dev/null; then
        run_Program() {
            pkg install python -y &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "Install Python${whiteColor}" "0" "Menu" "UIMenu"
    fi
    if ! command -v pipx &>/dev/null; then
        run_Program() {
            python3 -m pip install --user pipx &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "Install pipx${whiteColor}" "0" "Menu" "UIMenu"
        run_Program() {
            python3 -m pipx ensurepath &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "pipx ensurepath${whiteColor}" "0" "Menu" "UIMenu"
        pipxInstalled=true
    fi
    cd $HOME || exit 1
    if [[ -f proxy.py ]]; then
        rm proxy.py
    fi
    if [[ -f proxy_config.py ]]; then
        rm proxy_config.py
    fi
    if [[ $pipxInstalled = true ]]; then
        echo "${greenColorBold}You need to restart or reopen termux for can using command \"pipx\"${whiteColor}"
    fi
    echo -n "Press enter for back to menu!"
    read -r
    clear
    UIMenu
    return
}
