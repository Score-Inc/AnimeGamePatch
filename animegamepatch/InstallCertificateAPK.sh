DownloadAPKCert() {
    clear
    whoMadeThis
    if [ ! -d "$HOME/.ElaXan/Edit" ]; then
        mkdir "$HOME/.ElaXan/Edit"
    fi
    echo "${greenColorBold}Download Genshin.apks${whiteColor}"
    wget https://github.com/ElaXan/AnimeGamePatch/releases/download/3.0/Genshin-mitm-cert.apks -O $HOME/.ElaXan/Edit/Genshin.apks -q --show-progress
    DownloadAPKCert_check=true
    patchingAPK
}

patchingAPK() {
    clear
    showCowsay
    if [ ! -d "$HOME/.ElaXan/Edit" ]; then
        mkdir $HOME/.ElaXan/Edit
    fi
    if [[ $DownloadAPKCert_check != true ]]; then
        rm -rf $HOME/.ElaXan/Edit/*
    fi
    if [[ $apksFound = true ]]; then
        cp $installCertAPK_input $HOME/.ElaXan/Edit/Genshin.apks
    fi
    cd $HOME/.ElaXan/Edit || exit 1
    run_Program() { busybox unzip Genshin.apks -d Decompile &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Unzip Genshin.apks${whiteColor}" "0" "Menu" "UIMenu"
    cd Decompile || exit 1
    if ! (unzip -l base.apk | grep "res/raw" &> /dev/null); then
        echo "${redColorBold}This APK not support${whiteColor}"
        exit 1
    fi
    run_Program() { timeout --foreground 10s $HOME/.local/bin/mitmdump --ssl-insecure &> $HOME/zerr.log & errCode=$?; log "$errCode"; sleep 3; }
    run_Program & pid=$!
    spin "Setup${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { curl -s --proxy 127.0.0.1:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem http://mitm.it/cert/cer > $HOME/zerr.log; errCode=$?; cp $HOME/zerr.log $HOME/.ElaXan/mitm.pem; echo "Babi" &> $HOME/zerr.log; sleep 1s; }
    run_Program & pid=$!
    spin "Get Certificate${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { apktool d -rs base.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Decompile APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { rm dec1/res/raw/*; mv $HOME/.ElaXan/mitm.pem dec1/res/raw/mitm.pem &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 1s; }
    run_Program & pid=$!
    spin "Patching APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { apktool b dec1 -o enc.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Compile APK${whiteColor}" "0" "Menu" "UIMenu"
    run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a enc.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Sign APK${whiteColor}" "0" "Menu" "UIMenu"
    rm enc.apk
    rm base.apk
    mv enc*.apk base.apk
    run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"

    run_Program() { apktool d -rs split_AssetBundles.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Decompile APK (split_AssetBundles.apk)${whiteColor}" "0" "Menu" "UIMenu"
    rm split_AssetBundles.apk

    run_Program() { apktool b dec1 -o split_AssetBundles.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Compile APK (split_AssetBundles.apk)${whiteColor}" "0" "Menu" "UIMenu"

    run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_AssetBundles.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Sign APK (split_AssetBundles.apk)${whiteColor}" "0" "Menu" "UIMenu"
    rm split_AssetBundles.apk
    mv split_AssetBundles*.apk split_AssetBundles.apk

    run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"

    run_Program() { apktool d -rs split_config.arm64_v8a.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Decompile APK (split_config.arm64_v8a.apk)${whiteColor}" "0" "Menu" "UIMenu"
    rm split_config.arm64_v8a.apk

    run_Program() { apktool b dec1 -o split_config.arm64_v8a.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Compile APK (split_config.arm64_v8a.apk)${whiteColor}" "0" "Menu" "UIMenu"

    run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_config.arm64_v8a.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Sign APK (split_config.arm64_v8a.apk)${whiteColor}" "0" "Menu" "UIMenu"
    rm split_config.arm64_v8a.apk
    mv split_config.arm*.apk split_config.arm64_v8a.apk

    run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"

    if [ -f "split_config.en.apk" ]; then
        run_Program() { apktool d -rs split_config.en.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Decompile APK (split_config.en.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.en.apk
        run_Program() { apktool b dec1 -o split_config.en.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Compile APK (split_config.en.apk)${whiteColor}" "0" "Menu" "UIMenu"
        run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_config.en.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Sign APK (split_config.en.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.en.apk
        mv split_config.en*.apk split_config.en.apk
        run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"
    fi

    if [ -f "split_config.in.apk" ]; then
        run_Program() { apktool d -rs split_config.in.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Decompile APK (split_config.in.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.in.apk
        run_Program() { apktool b dec1 -o split_config.in.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Compile APK (split_config.in.apk)${whiteColor}" "0" "Menu" "UIMenu"
        run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_config.in.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Sign APK (split_config.in.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.in.apk
        mv split_config.in*.apk split_config.in.apk
        run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"
    fi

    if [ -f "split_config.ms.apk" ]; then
        run_Program() { apktool d -rs split_config.ms.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Decompile APK (split_config.ms.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.ms.apk
        run_Program() { apktool b dec1 -o split_config.ms.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Compile APK (split_config.ms.apk)${whiteColor}" "0" "Menu" "UIMenu"
        run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_config.ms.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Sign APK (split_config.ms.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.ms.apk
        mv split_config.ms*.apk split_config.ms.apk
        run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"
    fi

    if [ -f "split_config.xxhdpi.apk" ]; then
        run_Program() { apktool d -rs split_config.xxhdpi.apk -o dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Decompile APK (split_config.xxhdpi.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.xxhdpi.apk
        run_Program() { apktool b dec1 -o split_config.xxhdpi.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Compile APK (split_config.xxhdpi.apk)${whiteColor}" "0" "Menu" "UIMenu"
        run_Program() { java -jar $HOME/.ElaXan/AnimeGamePatch/uber-apk-signer-1.2.1.jar -a split_config.xxhdpi.apk &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Sign APK (split_config.xxhdpi.apk)${whiteColor}" "0" "Menu" "UIMenu"
        rm split_config.xxhdpi.apk
        mv split_config.xxhdpi*.apk split_config.xxhdpi.apk
        run_Program() { rm -rf dec1 &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        run_Program & pid=$!
        spin "Remove Folder dec1${whiteColor}" "0" "Menu" "UIMenu"
    fi
    run_Program() { zip -9 /sdcard/Genshin-patched * &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "zip APK to .apks${whiteColor}" "0" "Menu" "UIMenu"
    rm -rf $HOME/.ElaXan/Edit/*
    mv /sdcard/Genshin-patched.zip /sdcard/Genshin-patched.apks
    touch $HOME/.ElaXan/installed
    echo
    echo "========================================" | lolcat
    echo "${greenColorBold}.apks saved to /sdcard with name Genshin-patched.apks"
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
        if ! (ls $installCertAPK_input &> /dev/null); then
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
            "y" | "Y" ) DownloadAPKCert;;
            "n" | "N" ) UIMenu;;
            * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; installCertAPK;;
        esac
    else
        echo "${redColorBold}Wrong input${whiteColor}"
        sleep 1
        installCertAPK
    fi
    patchingAPK
}