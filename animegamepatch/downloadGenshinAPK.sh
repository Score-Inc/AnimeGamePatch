downloadYesGenshin() {
    clear
    whoMadeThis
    cd $HOME || exit 1
    if ! command -v wget &> /dev/null; then
        pkg install wget
    fi
    echo "${yellowColorBold}Download Genshin apks. [PLEASE WAIT!]${whiteColor}"
    if [[ $dgenshininp = "1" ]]; then
        if [[ -f "/sdcard/Genshin_Impact_3.0.apks" ]]; then
            echo "${greenColorBold}Genshin_Impact_3.0.apks already exist in /sdcard !${whiteColor}"
            echo 
            echo -n "Press enter to back Menu!"
            read -r
            UIMenu
            return
        else
            versionGenshin="3.0"
            if [[ -f "$HOME/AnimeGame-Termux-3.0-patched.apks" ]]; then
                rm "$HOME/AnimeGame-Termux-3.0-patched.apks"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/3.0/AnimeGame-Termux-3.0-patched.apks -q --show-progress
        fi
    elif [[ $dgenshininp = "2" ]]; then
        if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
            echo "${greenColorBold}Genshin_Impact_2.8.apks already exist in /sdcard !${whiteColor}"
            echo 
            echo -n "Press enter to back Menu!"
            read -r
            UIMenu
            return
        else
            versionGenshin="2.8"
            if [[ -f "$HOME/Genshin_Impact_2.8.apks" ]]; then
                rm "$HOME/Genshin_Impact_2.8.apks"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/2.8/Genshin_Impact_2.8.apks -q --show-progress
        fi
    elif [[ $dgenshininp = "3" ]]; then
        if [[ -f "/sdcard/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
            echo "${greenColorBold}Genshin.Impact.Cert.Patch_Sign.apk already exist in /sdcard !${whiteColor}"
            echo 
            echo "Press enter to back Menu!"
            read -r
            UIMenu
            return
        else
            versionGenshin="2.7"
            if [[ -f "$HOME/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
                rm "$HOME/Genshin.Impact.Cert.Patch_Sign.apk"
            fi
            wget https://github.com/ElaXan/AnimeGamePatch/releases/download/2.7/Genshin.Impact.Cert.Patch_Sign.apk -q --show-progress
        fi
    fi
    ifdownloadgenshinfailed=$?
    if [[ "$ifdownloadgenshinfailed" != 0 ]]; then
        clear
        whoMadeThis
        echo "${redColorBold}Download Failed!${whiteColor}"
        echo ""
        echo -n "Press enter go back to Menu!"
        read -r
        UIMenu
        return
    else
        clear
        whoMadeThis
        echo "${greenColorBold}Download Successfully!${whiteColor}"
        sleep 0.5s
        echo "${greenColorBold}Move apks Genshin to /sdcard${whiteColor}"
        sleep 0.5s
        if [[ -f "Genshin_Impact_2.8.apks" ]]; then
            mv Genshin_Impact_2.8.apks /sdcard
        elif [[ -f "Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
            mv Genshin.Impact.Cert.Patch_Sign.apk /sdcard
        elif [[ -f "AnimeGame-Termux-3.0-patched.apks" ]]; then
            mv AnimeGame-Termux-3.0-patched.apks /sdcard
        else
            echo "${redColorBold}File Genshin APKs not found!${whiteColor}"
            echo ""
            echo -n "Press Enter for back to Menu!"
            read -r
            clear
            UIMenu
            return
        fi
    fi
    if [[ -f "/sdcard/Genshin_Impact_2.8.apks" ]]; then
        echo -e "${greenColorBold}Success move to /sdcard !\n\nInstall with SAI Installer or other apk that support install .apks${whiteColor}"
        if [[ $isRooted = true ]]; then
            echo "${yellowColorBold}Can't do Install automatically with \"pm install\" because file name is .apks so install manually${whiteColor}"
        fi
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
    elif [[ -f "/sdcard/AnimeGame-Termux-3.0-patched.apks" ]]; then
        if [[ $isRooted = true ]]; then
            echo "${yellowColorBold}Can't do install automatically with \"pm install\" because file name is .apks so install manually${whiteColor}"
        fi
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
    elif [[ -f "/sdcard/Genshin.Impact.Cert.Patch_Sign.apk" ]]; then
        if [[ $isRooted = true ]]; then
            su -c pm install Genshin.Impact.Cert.Patch_Sign.apk
            echo "${yellowColorBold}Genshin Installed with \"pm install\" so check it...${whiteColor}"
        fi
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
    else
        echo "${redColorBold}Failed to move Genshin APKs to /sdcard${whiteColor}"
        echo ""
        echo -n "Press Enter for back to Menu!"
        read -r
        clear
        UIMenu
        return
    fi
}


downloadGenshin() {
    clear
    whoMadeThis
    if [[ $dgenshininp = "1" ]]; then
        echo "${redColorBold}File size is 264 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "2" ]]; then
        echo "${redColorBold}File size is 238 MB... Do you want continue to download?${whiteColor}"
    elif [[ $dgenshininp = "3" ]]; then
        echo "${redColorBold}File size is 321 MB... Do you want continue to download?${whiteColor}"
    fi
    echo -n "Enter input (y/n) : "
    read -r dwngenshin
    case $dwngenshin in
        "y" | "Y" ) downloadYesGenshin;;
        "n" | "N" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; UIMenu;;
    esac
}

GenshinAPKs() {
    clear
    cd $HOME || exit 1
    whoMadeThis
    echo "1. ${greenColorBold}Genshin Impact Version 3.0${whiteColor}"
    echo "2. ${yellowColorBold}Genshin Impact Version 2.8${whiteColor}"
    echo "3. ${yellowColorBold}Genshin Impact Version 2.7${whiteColor}"
    echo "0. Back"
    echo ""
    echo -n "Enter input : "
    read -r dgenshininp
    case $dgenshininp in
        "1" | "2" | "3" ) downloadGenshin;;
        "0" ) UIMenu;;
        * ) echo "Wrong Input!"; sleep 1s; GenshinAPKs;;
    esac
}