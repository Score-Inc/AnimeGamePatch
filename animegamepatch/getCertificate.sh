getCert() {
    clear
    cd $HOME || exit 1
    whoMadeThis
    if [[ ! -f ".local/bin/mitmproxy" ]]; then
        echo "${redColorBold}Please install mitmproxy first at Main Menu!${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
    if [[ -d .mitmproxy ]]; then
        rm -rf .mitmproxy
    fi
    if [ -f "/sdcard/mitm.cer" ]; then
        rm "/sdcard/mitm.cer"
    fi
    detectCertInstalled=/system/etc/security/cacerts/zexCert
    if [[ $isRooted = true ]]; then
        if [[ -f $detectCertInstalled ]]; then
            echo "${redColorBold}Certificate already exist..."
            echo "Do you want to remove it?${whiteColor}"
            echo ""
            echo -n "Enter input (y/n) : "
            read -r askDeleteCert
            case $askDeleteCert in
                "y" | "Y" ) su -c rm $detectCertInstalled; echo "${greenColorBold}Certficiate done deleted...${whiteColor}"; sleep 1s; clear; whoMadeThis;;
                "n" | 'N' ) echo "${greenColorBold}Cancel deleted cert by users!${whiteColor}"; sleep 1s; clear; whoMadeThis;;
                * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; getCert;;
            esac
        fi
    fi
    run_Program() { timeout --foreground 10s ./.local/bin/mitmdump --ssl-insecure &> $HOME/zerr.log & errCode=$?; log "$errCode"; sleep 3; }
    run_Program & pid=$!
    spin "Setup${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { curl -s --proxy 127.0.0.1:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem http://mitm.it/cert/cer > $HOME/zerr.log; errCode=$?; cp $HOME/zerr.log /sdcard/mitm.cer; log "$errCode"; sleep 1s; }
    run_Program & pid=$!
    spin "Get Certificate${whiteColor}" "0" "Menu" "UIMenu"
    echo -e "${greenColorBold}Saved to /sdcard and file name \"mitm.cer\"\n${whiteColor}"
    echo -n "Press enter for back to Menu!"
    read -r
    UIMenu
}