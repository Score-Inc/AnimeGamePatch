ChangeConfSettings() {
    if [[ $inputsettings = "1" ]]; then
        stringchange="rename"
        if [[ $isConfisTrue = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "2" ]]; then
        stringchange="installcert"
        if [[ $isConfisTrue2 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue2 = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            clear
            whoMadeThis
            echo "${greenColorBold}Do you want to install Certificate as Root?${whiteColor}"
            echo "${yellowColorBold}i'm not take any responsibility if there is something wrong with your Phone"
            echo "or even can't delete for the certficate${whiteColor}"
            echo ""
            echo -n "Enter input (y/n) : "
            read -r installCert
            case $installCert in
                "y" | "Y" ) sleep 0.1s;;
                "n" | "N" ) UIMenu;;
                * ) echo "Wrong Input!"; sleep 1s; settingsScript;;
            esac
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "3" ]]; then
        stringchange="openGenshin"
        if [[ $isConfisTrue3 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue3 = false ]]; then
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "4" ]]; then
        stringchange="setProxy"
        if [[ $isConfisTrue4 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue4 = false ]]; then
            if [[ $isRooted = false ]]; then
                clear
                whoMadeThis
                echo "${redColorBold}Sorry this only for Rooted Device!${whiteColor}"
                echo ""
                echo -n "Press enter for back to Settings!"
                read -r
                settingsScript
                return
            fi
            changeFrom="false"
            changeTo="true"
        fi
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]]; then
        echo "${redColorBold}Sorry there is Problem can't change the Settings.${whiteColor}"
        echo ""
        echo -n "Press enter for back to Settings!"
        read -r
        settingsScript
        return
    fi

    sed -i "s/$stringchange=$changeFrom/$stringchange=$changeTo/g" "$pathScript"
    settingsScript
}

settingsScript() {
    clear
    whoMadeThis
    getSettingsConf=$(cat "$pathScript" | grep "rename" | sed "s/.*rename=//g")
    getSettingsConf2=$(cat "$pathScript" | grep "installcert" | sed "s/.*installcert=//g")
    getSettingsConf3=$(cat "$pathScript" | grep "openGenshin" | sed "s/.*openGenshin=//g")
    getSettingsConf4=$(cat "$pathScript" | grep "setProxy" | sed "s/.*setProxy=//g")

    if [[ $getSettingsConf = true ]]; then
        renameconf="${greenColorBold}ON${whiteColor}"
        isConfisTrue=true
    elif [[ $getSettingsConf = false ]]; then
        renameconf="${redColorBold}OFF${whiteColor}"
        isConfisTrue=false
    elif [[ $getSettingsConf = "" ]]; then
        isConfisTrue=err
    fi

    if [[ $getSettingsConf2 = true ]]; then
        installcertconf="${greenColorBold}ON${whiteColor}"
        isConfisTrue2=true
    elif [[ $getSettingsConf2 = false ]]; then
        installcertconf="${redColorBold}OFF${whiteColor}"
        isConfisTrue2=false
    elif [[ $getSettingsConf2 = "" ]]; then
        isConfisTrue2=err
    fi

    if [[ $getSettingsConf3 = true ]]; then
        openGenshinConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue3=true
    elif [[ $getSettingsConf3 = false ]]; then
        openGenshinConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue3=false
    elif [[ $getSettingsConf3 = "" ]]; then
        isConfisTrue3=err
    fi

    if [[ $getSettingsConf4 = true ]]; then
        setProxyConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue4=true
    elif [[ $getSettingsConf4 = false ]]; then
        setProxyConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue4=false
    elif [[ $getSettingsConf4 = "" ]]; then
        isConfisTrue4=err
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]] || [[ $isConfisTrue4 = err ]]; then
        rm "$pathScript"
        echo -e -n "# Script made by ElaXan\n# This for Settings Feature. Delete this if have problem on change Settings or you can edit Manual\ninstallcert=false\nrename=false\nopenGenshin=false\nsetProxy=false" > "$pathScript"
        settingsScript
    fi

    echo "[$renameconf] ${cyanColorBold}1. Autorename Package Genshin (ROOT)${whiteColor}"
    echo "[$installcertconf] ${cyanColorBold}2. Auto Install cert as Root (ROOT)${whiteColor}"
    echo "[$openGenshinConf] ${cyanColorBold}3. Auto open Genshin Impact App${whiteColor}"
    echo "[$setProxyConf] ${cyanColorBold}4. Auto Change Proxy (ROOT)${whiteColor}"
    echo "0. Back to Menu!"
    echo ""
    echo -n "Enter input : "
    read -r inputsettings
    case $inputsettings in
        "1" | "2" | "3" | "4" ) ChangeConfSettings;;
        "0" ) UIMenu;;
        * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; settingsScript;;
    esac
}