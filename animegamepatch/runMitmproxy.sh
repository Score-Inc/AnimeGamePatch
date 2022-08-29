zexsh() {

changeProxy() {
    clear
    whoMadeThis
    trap - INT
    echo -e "${redColorBold}mitmproxy killed/force stopped!${whiteColor}"
    getSettingsConf4=$(cat "$pathScript" | grep "setProxy" | sed "s/.*setProxy=//g")
    getSettingsConf5=$(cat "$pathScript" | grep "reset" | sed "s/.*reset=//g")
    if [[ $getSettingsConf4 = true ]]; then
        if [[ $getSettingsConf5 = 1 ]]; then
            run_Program() { su -c settings put global http_proxy :0 &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 0.5s; }
            run_Program & pid=$!
            spin "${greenColorBold}Reset Proxy${whiteColor}" "0" "Main Menu" "UIMenu"
        elif [[ $getSettingsConf5 = 2 ]]; then
            run_Program() { su -c settings delete global http_proxy &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 0.5s; }
            run_Program & pid=$!
            spin "${greenColorBold}Delete proxy${whiteColor}" "0" "Main" "UIMenu"
            run_Program() { su -c settings delete global global_http_proxy_host &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 0.5s; }
            run_Program & pid=$!
            spin "${greenColorBold}Delete http proxy host${whiteColor}" "0" "Main" "UIMenu"
            run_Program() { su -c settings delete global global_http_proxy_port &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 0.5s; }
            run_Program & pid=$!
            spin "${greenColorBold}Delete http proxy port${whiteColor}" "0" "Main" "UIMenu"
            echo -e "${yellowColorBold}You need to restart your phone\nor you will have no Internet${whiteColor}"
        fi
    fi  
    getSettingsConf=$(cat "$pathScript" | grep "rename" | sed "s/.*rename=//g")
    if [[ $getSettingsConf = true ]]; then
        genshinData=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | grep "zex")
        zexPackage=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | sed "s/.*zex//g")
        if [[ ${genshinData} = "com.miHoYo.GenshinImpact" ]] && [[ ${zexPackage} = "com.miHoYo.GenshinImpact" ]]; then
            echo "${redColorBold}Skip Rename Package${whiteColor}"
        elif [[ ${zexPackage} = "com.miHoYo.GenshinImpact" ]]; then
            echo "${redColorBold}Skip Rename Package${whiteColor}"
        elif [[ ${genshinData} = "com.miHoYo.GenshinImpactzex" ]]; then
            echo "${greenColorBold}Rename back Data Genshin..."
            sleep 0.5s
            su -c mv /sdcard/Android/data/com.miHoYo.GenshinImpactzex /sdcard/Android/data/com.miHoYo.GenshinImpact
            echo "Done!${whiteColor}"
        fi
    fi
    echo ""
    echo -n "Press enter for back to Menu!"
    read -r
    UIMenu
    return
}

killMtimprob() {
    if [[ $killMitms = 2 ]]; then
        echo "${redColorBold}I can't fix this error. Try restart your phone!"
        exit
    fi
    if [[ $killMitms = 1 ]]; then
        echo "${yellowColorBold}Trying seconds method!${whiteColor}"
        killMitmd=$(ps ax > "$HOME"/z.log; grep "mitmdump" "$HOME"/z.log | sed "s/ pts\/1.*false//g")
        kill "$killMitmd"
        echo "Killed" > "$HOME"/zkill.log
        rm "$HOME"/z.log
        sleep 0.5
        echo "${greenColorBold}Trying run again...${whiteColor}"
        sleep 1s
        killMitms=2
        mitmProxyRun
    fi
    echo "${yellowColorBold}Trying fix this Issue!"
    sleep 1s
    echo "Killed" > "$HOME"/zkill.log
    pkill -9 mitmdump
    sleep 0.5
    echo "${greenColorBold}Trying run again...${whiteColor}"
    killMitms=1
    clear
    mitmProxyRun
}

mitmProxyRun() {
    cd $HOME || exit 1
    clear
    whoMadeThis
    if [[ -f ./.local/bin/mitmdump ]]; then
        cd $HOME || exit 1
        if [[ ! -f proxy.py ]] || [[ ! -f proxy_config.py ]]; then
            echo "${redColorBold}proxy.py not found, please download it in main menu!${whiteColor}"
            echo ""
            echo -n "Press Enter for back to menu!"
            read -r
            clear
            UIMenu
            return 1
        fi
        getSettingsConf=$(cat "$pathScript" | grep "rename" | sed "s/.*rename=//g")
        if [[ $getSettingsConf = true ]]; then
            if [[ $isRooted = false ]]; then
                echo "${redColorBold}Sorry auto rename only for Rooted device!${whiteColor}"
                echo "${yellowColorBold}Please turn off in Settings!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Menu!"
                read -r
                UIMenu
                return
            fi
            genshinData=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | grep "zex")
            genshinDatas=$(su -c ls /sdcard/Android/data | grep "com.miHoYo" | sed "s/.*com/com/g" | sed "s/com.*zex//g" | grep "com")
            if [[ $genshinDatas != "com.miHoYo.GenshinImpact" ]]; then
                echo "${redColorBold}Can't Rename, Package genshin doesn't exist!...${whiteColor}"
                echo "========================================"
            else
                if [[ $genshinData != "com.miHoYo.GenshinImpactzex" ]]; then
                    cd /sdcard/Android/data || echo
                    su -c mv com.miHoYo.GenshinImpact com.miHoYo.GenshinImpactzex
                    echo -e "${greenColorBold}Done Rename!${whiteColor}\n========================================"
                    cd $HOME || exit 1
                else
                    echo "${redColorBold}Can't Rename, there is 2 Package exist...${whiteColor}"
                    echo "========================================"
                fi
            fi
        fi
        getSettingsConf4=$(cat "$pathScript" | grep "setProxy" | sed "s/.*setProxy=//g")
        if [[ $getSettingsConf4 = true ]]; then
            run_Program() { su -c settings put global http_proxy 127.0.0.1:8080 &> $HOME/zerr.log; errCode=$?; log "$errCode"; sleep 1s; }
            run_Program & pid=$!
            spin "${greenColorBold}Change Proxy${whiteColor}" "0" "Menu" "UIMenu"
            sleep 1
            clear
            whoMadeThis
            rmpathCertRoot=/system/etc/security/cacerts/zexCert
            if [ ! -f $rmpathCertRoot ]; then
                echo "${yellowColorBold}Make sure you already install Certificate"
                sleep 0.1s
                echo "if you not do that will not work${whiteColor}"
                echo "========================================"
            fi
        else
            echo "${yellowColorBold}Make Sure you already set the proxy and port"
            sleep 0.1s
            echo "Proxy/hostname : 127.0.0.1"
            sleep 0.1s
            echo "Port : 8080"
            sleep 0.1s
            echo "If you not do that will not work${whiteColor}"
            sleep 0.1s
            echo "========================================"
            echo "${yellowColorBold}Make sure you already install Certificate"
            sleep 0.1s
            echo "if you not do that will not work${whiteColor}"
            echo "========================================"
        fi
        mitmKilled=$(cat "$HOME"/zkill.log &> /dev/null)
        if [[ $mitmKilled = "Killed" ]]; then
            echo "mitmproxy killed/force stop!"
            exit
        fi
        
        if [[ $isConfisTrue3 = true ]]; then
            echo "${greenColorBold}Open Genshin...${whiteColor}"
            am start --user 0 com.miHoYo.GenshinImpactzex/com.miHoYo.GetMobileInfo.MainActivity &> "$HOME"/.termux/openGenshin
            detectErrorOpenGenshin=$(cat "$HOME"/.termux/openGenshin | sed 's/.*does not/does not/g' | grep "does not")
            if [[ $detectErrorOpenGenshin = "does not exist." ]]; then
                echo -e "${redColorBold}Can't open Genshin...\nTarget to com.miHoYo.GenshinImpactzex\n${yellowColorBold}Will Skip open Genshin${whiteColor}"
                sleep 1s
                rm "$HOME"/.termux/openGenshin
            else
                rm "$HOME"/.termux/openGenshin
            fi
            echo "${greenColorBold}Log saved to /sdcard/mitm.log"
            echo "For stop press CTRL + C on your keyboard"
            echo "Now you can open Genshin${whiteColor}"
            run_Program() { ./.local/bin/mitmdump -s proxy.py -k --ssl-insecure --set block_global=false > /sdcard/mitm.log; echo "Babi" &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
            run_Program & pid=$!
            spin "${greenColorBold}mitmdump/mitmproxy running${whiteColor}" "0" "Nothing" "changeProxy"
            changeProxy
        else
            echo "${greenColorBold}Log saved to /sdcard/mitm.log"
            echo "For stop press CTRL + C on your keyboard"
            echo "Now you can open Genshin${whiteColor}"
            run_Program() { ./.local/bin/mitmdump -s proxy.py -k --ssl-insecure --set block_global=false >> /sdcard/mitm.log; echo "Babi" &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
            run_Program & pid=$!
            spin "${greenColorBold}mitmdump/mitmproxy running${whiteColor}" "0" "Nothing" "changeProxy"
            changeProxy
        fi
        changeProxy
    else
        echo -e "${redColorBold}mitmproxy not found!\nPlease download it using ${nameScript} 1\n"
        exit
    fi
}
    mitmProxyRun
}