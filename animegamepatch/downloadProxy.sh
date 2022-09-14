downloadproxy() {
    clear
    whoMadeThis
    if [[ -f proxy.py ]]; then
        rm proxy.py
    fi
    if [[ -f proxy_config.py ]]; then
        rm proxy_config.py
    fi
    run_Program() { wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy.py -q &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "}Download proxy.py${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { wget https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/proxy_config.py -q &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Download proxy_config.py${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { busybox sed -i "s/REMOTE_HOST = \"localhost\"/REMOTE_HOST = \"sg.genshin.ps.yuuki.me\"/g" proxy_config.py &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 1s; }
    run_Program & pid=$!
    spin "Edit proxy_config.py${whiteColor}" "0" "Menu" "UIMenu"
    echo -n "Press enter for back to Change Server!"
    read -r
    clear
    UIMenu
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