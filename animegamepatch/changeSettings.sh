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
        stringchange="openGenshin"
        if [[ $isConfisTrue2 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue2 = false ]]; then
            changeFrom="false"
            changeTo="true"
        fi
    elif [[ $inputsettings = "3" ]]; then
        stringchange="setProxy"
        if [[ $isConfisTrue3 = true ]]; then
            changeFrom="true"
            changeTo="false"
        elif [[ $isConfisTrue3 = false ]]; then
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
    elif [[ $inputsettings = "4" ]]; then
        clear
        whoMadeThis
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
        echo "${cyanColorBold}1. Mode 1       ${whiteColor}3. ${yellowColorBold}Help"
        echo "${cyanColorBold}2. Mode 2       ${whiteColor}0. ${redColorBold}Back${whiteColor}"
        echo
        echo -n "Enter input : "
        read ChangeConfSettings_input
        case $ChangeConfSettings_input in
            "1" ) stringchange="reset"; changeFrom="2"; changeTo="1";;
            "2" ) stringchange="reset"; changeFrom="1"; changeTo="2";;
            "3" ) clear; whoMadeThis; echo -e "${cyanColorBold}1. Mode 1 ${whiteColor} :\n${yellowColorBold}No need to Restart phone for reset proxy\n${cyanColorBold}2. Mode 2 ${whiteColor} :\n${yellowColorBold}Need Restart after delete proxy\nthis not reset but delete for Proxy so need to Restart\n"; read -p "${whiteColor}Press enter for back"; ChangeConfSettings;;
            "0" ) settingsScript;;
            * ) echo "${redColorBold}Wrong input!${whiteColor}"; sleep 1s; ChangeConfSettings;;
        esac
    elif [[ $inputsettings = "5" ]]; then
        clear
        whoMadeThis
        echo "${yellowColorBold}Enter b/B for back or cancel"
        echo
        echo "${cyanColorBold}Current Port : $getSettingsConf5"
        echo -n "${whiteColor}Enter custom Port : ${cyanColorBold}"
        read -r ChangeConfSettings_input
        echo -n "${whiteColor}"
        if [[ $ChangeConfSettings_input = "" ]]; then
            echo "${redColorBold}Please enter port${whiteColor}"
            sleep 1s
            ChangeConfSettings
            return 1
        elif [[ $ChangeConfSettings_input = "b" ]] || [[ $ChangeConfSettings_input = "B" ]]; then
            settingsScript
        elif [[ $ChangeConfSettings_input = "54321" ]]; then
            echo -n ""
        elif [[ 1025 < $ChangeConfSettings_input ]]; then
            echo "${redColorBold}Error${whiteColor} : Port $ChangeConfSettings_input not Allowed for Android"
            sleep 1
            ChangeConfSettings
        elif [[ $ChangeConfSettings_input = $getSettingsConf5 ]]; then
            echo "${redColorBold}Error${whiteColor} : Same Port"
            sleep 1s
            ChangeConfSettings
        fi
        stringchange="port"
        changeFrom="\"$getSettingsConf5\""
        changeTo="\"$ChangeConfSettings_input\""
    elif [[ $inputsettings = "6" ]]; then
        clear
        whoMadeThis
        changeSettings_list
        echo "${yellowColorBold}Enter b/B for back or cancel${whiteColor}"
        echo ""
        echo "${cyanColorBold}Current Server : ${greenColorBold}$customServer"
        echo "${cyanColorBold}Current Port : ${greenColorBold}$customPort${whiteColor}"
        echo 
        echo -n "Enter Server : ${cyanColorBold}"
        read ChangeConfSettings_input
        echo -n "${whiteColor}"
        if [[ $ChangeConfSettings_input = "b" ]] || [[ $ChangeConfSettings_input = "B" ]]; then
            settingsScript
        elif [[ $ChangeConfSettings_input = "" ]]; then
            echo "${redColorBold}Error${whiteColor} : Server not entered"
            sleep 1s
            ChangeConfSettings
        fi
        echo -n "Enter Port : ${cyanColorBold}"
        read ChangeConfSettings_input_Port
        echo -n "${whiteColor}"
        if [[ $ChangeConfSettings_input_Port = "" ]]; then
            echo "${redColorBold}Error${whiteColor} : Port not entered"
            sleep 1s
            ChangeConfSettings
        elif [[ $ChangeConfSettings_input_Port = "b" ]] || [[ $ChangeConfSettings_input_Port = "B" ]]; then
            settingsScript
        fi
        busybox sed -i "s/customServer=\".*\"/customServer=\"$ChangeConfSettings_input\"/g" "$pathScript"
        busybox sed -i "s/customPort=.*/customPort=$ChangeConfSettings_input_Port/g" "$pathScript"
        ChangeConfSettings
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]]; then
        echo "${redColorBold}Sorry there is Problem can't change the Settings.${whiteColor}"
        echo ""
        echo -n "Press enter for back to Settings!"
        read -r
        settingsScript
        return
    fi

    busybox sed -i "s/$stringchange=$changeFrom/$stringchange=$changeTo/g" "$pathScript"
    settingsScript
}

changeSettings_list() {
    getSettingsConf=$(cat "$pathScript" | grep "rename" | busybox sed "s/.*rename=//g")
    getSettingsConf2=$(cat "$pathScript" | grep "openGenshin" | busybox sed "s/.*openGenshin=//g")
    getSettingsConf3=$(cat "$pathScript" | grep "setProxy" | busybox sed "s/.*setProxy=//g")
    getSettingsConf4=$(cat "$pathScript" | grep "reset" | busybox sed "s/.*reset=//g")
    getSettingsConf5=$(cat "$pathScript" | grep "port" | busybox sed -e "s/.*port=\"//g" -e "s/\"//g")
    getSettingsConf6=$(cat "$pathScript" | grep "customServer" | busybox sed -e "s/.*customServer=\"//g" -e "s/\"//g")
    getSettingsConf7=$(cat "$pathScript" | grep "customPort" | busybox sed "s/.*customPort=//g")

    if [[ $getSettingsConf = true ]]; then
        renameconf="${greenColorBold}ON${whiteColor}"
        isConfisTrue=true
    elif [[ $getSettingsConf = false ]]; then
        renameconf="${redColorBold}OFF${whiteColor}"
        isConfisTrue=false
    elif [[ $getSettingsConf != true ]] || [[ $getSettingsConf != false ]]; then
        isConfisTrue=err
    fi

    if [[ $getSettingsConf2 = true ]]; then
        openGenshinConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue2=true
    elif [[ $getSettingsConf2 = false ]]; then
        openGenshinConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue2=false
    elif [[ $getSettingsConf2 != true ]] || [[ $getSettingsConf2 != false ]]; then
        isConfisTrue2=err
    fi

    if [[ $getSettingsConf3 = true ]]; then
        setProxyConf="${greenColorBold}ON${whiteColor}"
        isConfisTrue3=true
    elif [[ $getSettingsConf3 = false ]]; then
        setProxyConf="${redColorBold}OFF${whiteColor}"
        isConfisTrue3=false
    elif [[ $getSettingsConf3 != true ]] || [[ $getSettingsConf3 != false ]]; then
        isConfisTrue3=err
    fi

    if [[ $getSettingsConf4 = 1 ]]; then
        resetProxyConf="${greenColorBold}MODE 1${whiteColor}"
        isConfisErr=false
    elif [[ $getSettingsConf4 = 2 ]]; then
        resetProxyConf="${greenColorBold}MODE 2${whiteColor}"
        isConfisErr=false
    elif [[ $getSettingsConf4 != 1 ]] || [[ $getSettingsConf5 != 2 ]]; then
        isConfisErr=true
    fi

    if [[ $getSettingsConf5 = "" ]]; then
        isPortMissing=true
    else
        currentPort="${greenColorBold}$getSettingsConf5${whiteColor}"
        isPortMissing=false
    fi

    if [[ $getSettingsConf6 = "" ]]; then
        isServerMissing=true
    else
        customServer="$getSettingsConf6"
        isServerMissing=false
    fi

    if [[ $getSettingsConf7 = "" ]]; then
        isCustomPortMissing=true
    else
        customPort="$getSettingsConf7"
        isCustomPortMissing=false
    fi

    if [[ $isConfisTrue = err ]] || [[ $isConfisTrue2 = err ]] || [[ $isConfisTrue3 = err ]] || [[ $isConfisErr = true ]] || [[ $isPortMissing = true ]] || [[ $isServerMissing = true ]] || [[ $isCustomPortMissing = true ]]; then
        rm "$pathScript"
        echo -e -n "# Script made by ElaXan\n# This for Settings Feature. Delete this if have problem on change Settings or you can edit Manual\ninstallcert=false\nrename=false\nopenGenshin=false\nsetProxy=false\nreset=1\nport=\"54321\"\ncustomServer=\"elashxander.my.id\"\ncustomPort=443" > "$pathScript"
        settingsScript
    fi
}