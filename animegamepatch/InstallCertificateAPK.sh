DownloadAPKCert() {
    clear
    whoMadeThis
    LinkAPkGenshin="https://github.com/Score-Inc/AnimeGamePatch/releases/download/3.2/Genshin_Impact_3.2-Termux.apk"
    if [ ! -d "$HOME/.ElaXan/Edit" ]; then
        mkdir "$HOME/.ElaXan/Edit"
    fi
    echo "${greenColorBold}Download Genshin.apk${whiteColor}"
    wget ${LinkAPkGenshin} -O $HOME/.ElaXan/Edit/Genshin.apk -q --show-progress
    DownloadAPKCert_check=true
    patchingAPK
}

patchingAPK() {
    if ! (command -v java &>/dev/null); then
        echo "${redColorBold}Java not found/installed${whiteColor}"
        echo
        echo -n "Press enter for back"
        read -r
        installCertAPK
    fi
    if ! (command -v apktool &>/dev/null); then
        echo "${redColorBold}Apktool not found/installed${whiteColor}"
        echo
        echo -n "Press enter for back"
        read -r
        installCertAPK
    fi
    clear
    showCowsay
    if [ ! -d "$HOME/.ElaXan/Edit" ]; then
        mkdir $HOME/.ElaXan/Edit
    fi
    if [[ $DownloadAPKCert_check != true ]]; then
        rm -rf $HOME/.ElaXan/Edit/*
    fi
    if [[ $apksFound = true ]]; then
        cp $installCertAPK_input $HOME/.ElaXan/Edit/Genshin.apk
    fi
    cd $HOME/.ElaXan/Edit || exit 1
    if ! (unzip -l Genshin.apk | grep "res/raw" &>/dev/null); then
        echo "${redColorBold}This APK not support${whiteColor}"
        exit 1
    fi
    run_Program() {
        timeout --foreground 10s $HOME/.local/bin/mitmdump --ssl-insecure &>$HOME/zerr.log &
        errCode=$?
        log "$errCode"
        sleep 5s
    }
    run_Program &
    pid=$!
    spin "Setup${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() {
        curl -s --proxy 127.0.0.1:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem http://mitm.it/cert/cer >$HOME/zerr.log
        errCode=$?
        cp $HOME/zerr.log $HOME/.ElaXan/mitm.pem
        log "$errCode"
        sleep 1s
    }
    run_Program &
    pid=$!
    spin "Get Certificate${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() {
        apktool d -rs Genshin.apk -o dec1 &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Decompile APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() {
        rm dec1/res/raw/*
        mv $HOME/.ElaXan/mitm.pem dec1/res/raw/mitm.pem &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
        sleep 1s
    }
    run_Program &
    pid=$!
    spin "Patching APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() {
        apktool b dec1 -o enc.apk &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Compile APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() {
        java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a enc.apk &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Sign APK${whiteColor}" "0" "Menu" "UIMenu"
    rm enc.apk
    mv enc*.apk /sdcard/Genshin-patched-exaaa.apk
    run_Program() {
        rm -rf dec1 &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"
    rm -rf $HOME/.ElaXan/Edit/*
    if [ -f "/sdcard/Genshin-patchedCer-Termux.apk" ]; then
        rm /sdcard/Genshin-patchedCer-Termux.apk
    fi
    mv /sdcard/Genshin-patched-exaaa.apk /sdcard/Genshin-patchedCer-Termux.apk
    touch $HOME/.ElaXan/installed
    echo
    echo "========================================" | lolcat
    echo "${greenColorBold}.apks saved to /sdcard with name Genshin-patchedCer-Termux.apk"
    echo "${whiteColor}"
    echo -n "Press enter for back to Main Menu!"
    read
    UIMenu
}

installCertAPK() {
    if [ ! -f "$HOME/.local/bin/mitmdump" ]; then
        clear
        whoMadeThis
        echo "${redColorBold}Error${whiteColor} : mitmproxy not installed"
        echo
        echo -n "Press enter for back to Main Menu!"
        read
        UIMenu
    fi

    if ! command -v apktool &>/dev/null; then
        echo "${greenColorBold}Installing apktool${whiteColor}"
        pkg install apktool -y
    fi

    if ! command -v java &>/dev/null; then
        echo "${greenColorBold}Installing Java${whiteColor}"
        pkg install openjdk-17 -y
    fi

    clear
    whoMadeThis
    echo "${greenColorBold}Do you want to use APK on your phone?${whiteColor}"
    echo -n "Enter input (y/N) : ${CCB}"
    read installCertAPK_input
    echo -n "${whiteColor}"
    if [[ $installCertAPK_input = "y" ]] || [[ $installCertAPK_input = "Y" ]]; then
        clear
        whoMadeThis
        echo "${greenColorBold}Cool. Now put path where the APK is"
        echo -n "${whiteColor}Enter Path : ${CCB}"
        read -r installCertAPK_input
        echo -n "${whiteColor}"
        if ! (ls $installCertAPK_input &>/dev/null); then
            echo "${redColorBold}Error ${whiteColor}: $installCertAPK_input not found"
            sleep 1s
            installCertAPK
        fi
        apksFound=true
    elif [[ $installCertAPK_input = "n" ]] || [[ $installCertAPK_input = "N" ]]; then
        clear
        whoMadeThis
        echo "${greenColorBold}Do you want to download APK?${whiteColor}"
        echo -n "${whiteColor}Enter input (y/N) : ${CCB}"
        read installCertAPK_input
        echo -n "${whiteColor}"
        case $installCertAPK_input in
        "y" | "Y") DownloadAPKCert ;;
        "n" | "N") UIMenu ;;
        *)
            echo "${redColorBold}Wrong input!${whiteColor}"
            sleep 1s
            installCertAPK
            ;;
        esac
    else
        echo "${redColorBold}Wrong input${whiteColor}"
        sleep 1
        installCertAPK
    fi
    patchingAPK
}
