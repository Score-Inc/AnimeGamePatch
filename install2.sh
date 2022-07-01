#!/data/user/0/com.termux/files/usr/bin/bash

command clear

whoMadeThis() {
    echo -e "========================================\n               ZEX HERE\n----------------------------------------\nScript was made by @ElashXander (Telegram)\n----------------------------------------\nAny support join Discord\nhttps://discord.gg/GenshinPS\n========================================"
}

zNextStep2() {
    command cd
    pathmynickname=/sdcard/Download/zexhere
    mkdir $pathmynickname
    clear
    whoMadeThis
    if [[ -f "/sdcard/Download/mitmproxy-ca-cert.cer" ]]; then
        mv "/sdcard/Download/mitmproxy-ca-cert.cer" "/sdcard/Download/mitmproxy-ca-cert.cer.crt"
    fi
    sleep 1
    if [[ -f "/sdcard/Download/mitmproxy-ca-cert.cer.crt" ]]; then
        echo "Cool we found you download for Android!"
    else
        echo -e "Did you download it for Android?\nor you not to download the Cert!"
        exit
    fi
    sleep 2
    echo -e "Please enter path\nwhere you save the APK Genshin when you download from Google Drive\nExample : Download\nExample 2 : Download/file download"
    read -p "Path : /sdcard/" where_the_apk
    where_the_apk="/sdcard/$where_the_apk"
    zexherebro="Genshin.Impact.Cert.Patch_Sign.apk"
    if [[ -f "$where_the_apk/$zexherebro" ]]; then
        echo "Cool! File genshin apk in $where_the_apk"
        sleep 2
    else
        echo -e "Not found! in $where_the_apk/$zexherebro\n\n\nPlease download it from Google Drive\nCopy this and download it!"
        sleep 1
        echo "https://drive.google.com/file/d/184KGay4O9dWI_yjuyhTbAWtLlStOvfDo/view?usp=drivesdk"
        exit
    fi
    zexsign="$HOME/AnimeGamePatch/release.jks" 
    if [[ -f $zexsign ]]; then
        echo "Cool!. Signature Downloaded"
        sleep 1
    else
        echo -e "Download Signature from Github!\nhttps://github.com/ElaXan/AnimeGamePatch"
        exit
    fi
    pathfordec="/sdcard/Download/zexhere/dec"
    if [[ -d  $pathfordec ]]; then
        echo -e "Folder exist\nPlease WAIT!"
        rm -rf $pathfordec
        echo "Folder Removed!"
    fi
 
    echo "Decompile Genshin APK! (Please Wait!)"
    sleep 1
    apktool -r -s d "/sdcard/Download/Genshin.Impact.Cert.Patch_Sign.apk" -o "$pathfordec"
    if [[ $? != 0 ]]; then
        echo "Decompile Failed!"
        echo "Read the Error and solve it by yourself"
        exit
    else
        echo "Decompile Completed!!!"
    fi
    sleep 1
    echo "Edit APK!!"
    sleep 1
    certbro=/storage/emulated/0/Download/mitmproxy-ca-cert.cer.crt
    rm "$pathfordec/res/raw/mitmproxy-ca-cert.cer.cer.pem" &> /sdcard/zlog.sh
    cp $certbro $pathfordec/res/raw/mitmproxy-ca-cert.cer.cer.pem &> /sdcard/zlog.txt
    if [[ $? != 0 ]]; then
        echo "No Certificate!. Please download it!!"
        exit
    fi
    sleep 1
    echo "Done!"
    sleep 1
    echo -e "Compile Genshin APK\n[PLEASE WAIT]"
    outputcomp="/sdcard/Download/zex.apk"
    command apktool b $pathfordec -o $outputcomp
    if [[ $? != 0 ]]; then
        echo "Compile Failed!"
        echo "Read the error and solve it by yourself"
        exit
    else
        echo "DONE!!"
    fi
    sleep 1
    echo "Zipalign Genshin"
    if [[ -f "$where_the_apk/Genshin.apk" ]]; then
        rm "$where_the_apk/Genshin.apk"
    fi
    command zipalign -v 4 $outputcomp /sdcard/Download/Genshin.apk > /sdcard/zlogzipalign.txt
    if [[ $? != 0 ]]; then
        echo "Zipalign Failed"
        echo "Read the error and solve it by yourself"
        exit
    else
        echo "Done!!!"
    fi
    sleep 1
    if [[ -f "$HOME/AnimeGamePatch/release.jks" ]]; then
        echo "Sign APK (Password is 123456)"
    else
        echo -e "Signature not found!\nPlease download it from Github!"
    fi
    command cd
    command cd AnimeGamePatch
    command apksigner sign --ks release.jks --pass-encoding ibm437 /sdcard/Download/Genshin.apk
    if [[ $? != 0 ]]; then
        echo "Wrong Password!"
        echo "Password is : 123456"
        sleep 2
        echo "Try again!"
        command apksigner sign --ks release.jks --pass-encoding ibm437 /sdcard/Download/Genshin.apk
        if [[ $? != 0 ]]; then
            echo "Wrong Password!"
            sleep 1
            exit
        else
            echo "Password Correct!"
        fi
    else
        echo "Password Correct"
        echo "DONE!!!!!!"
    fi

    

    zRunProgram() {
        command cd
        mitmdump -s proxy.py -k --ssl-insecure --set block_global=false
    }

    clear
    whoMadeThis
    sleep 1
    echo "        IMPORTANT"
    echo "When you install Genshin, Google Play Store Will Blocked to install reason Genshin Apk Unknown Developer. REASON WHY?? Because Genshin APK Sign by my Signature."
    echo ""
    echo "Just do allow for install"
    echo ""
    echo "No Virus, Already check with VirusTotal"
    echo "Here for the Link"
    echo "https://www.virustotal.com/gui/file/e50e657e8a5b64ff48888a3a58e99a1a96eb700aa97cc77b991650b551942738/detection"
    echo ""
    echo "It will be safe if you download files from Google Drive"
    echo "https://drive.google.com/file/d/184KGay4O9dWI_yjuyhTbAWtLlStOvfDo/view?usp=drivesdk"
    echo ""
    echo "  @ElashXander (Telegram)"
    echo "========================================"
    read -p "Enter for Continue"
    echo -e "You can install Genshin with name Genshin.apk in /sdcard/Download\nDon't close the Termux!"
    sleep 1
    echo "Cleaning [PLEASE WAIT!!]"
    rm -rf "$where_the_apk/zexhere"
    rm -rf "$where_the_apk/Genshin.apk.idsig"
    rm -rf "$where_the_apk/zex.apk"
    rm -rf "/sdcard/zlog.txt"
    rm -rf "/sdcard/zlog2.txt"
    echo "All Done!!!"
    sleep 1
    echo "Install Genshin Impact with name Genshin.apk in /sdcard/Download"
    echo "If already install and you open it."
    echo "Please Close it"
    echo "Need Hostname: 127.0.0.1 and Port : 8080 if not will not work"
    echo ""
    echo "if you want play again. Just run bash zex.sh"
    echo "Don't forget to settings your proxy and Port"
    pathtool=$HOME/AnimeGamePatch
    if [[ -f "$HOME/zex.sh" ]]; then
        echo "File already moved for zex.sh!"
    else
        if [[ -f "$pathtool/zex.sh" ]]; then
            mv $pathtool/zex.sh $HOME
            sleep 1
            echo "move zex.sh to Termux data (/data/data/com.termux)"
            sleep 2
        else
            echo "Please Download zex.sh!"
        fi
    fi

    if [[ -f "$HOME/zdom.sh" ]]; then
        echo "File already moved for zdom.sh!"
    else
        if [[ -f "$pathtool/zdom.sh" ]]; then
            mv $pathtool/zdom.sh $HOME
            sleep 1
            echo "move zdom.sh to Termux data (/data/data/com.termux)"
            sleep 2
        else
            echo "Please Download zdom.sh!"
        fi
    fi
    sleep 1
    echo "Open Genshin Now!!"
    sleep 2
    zRunProgram
}

clear
whoMadeThis
sleep 2
echo "Export Cargo"
sleep 1
export CARGO_BUILD_TARGET=aarch64-linux-android &> /sdcard/zlog.txt
checkexport=$?
sleep 1
echo "Done!"
sleep 1
echo -e "Install mitmproxy with pipx (This may take long time)\n[Make Coffee For Waiting This Shit]"
sleep 1
pipx install mitmproxy &> /sdcard/zlog2.txt
checkpipxmitm=$?
sleep 1
echo "Done Install mitmproxy"
sleep 1
echo "Download proxy.py"
if [[ -f $HOME/proxy.py ]]; then
    rm $HOME/proxy.py
fi
sleep 1
command cd
command wget https://gist.githubusercontent.com/exzork/8bbf5975bb9efab0a9c8a03a01dadd5e/raw/c2574d6f66798e65f2ed4709a69b43c6cecf60be/proxy.py &> /sdcard/zlog2.txt
checkwgetdownload=$?
sleep 1
echo "Edit proxy.py"
sleep 1
sed -i 's/genshin.exzork.me/hk.genshinps.me/g' proxy.py
checkeditfile=$?
sleep 1
echo "Done"
sleep 2
clear
if [[ $checkexport != 0 ]]; then
    zcheckexport="Export Failed (Error)"
else
    zcheckexport="Export Successfully"
fi

if [[ $checkpipxmitm != 0 ]]; then
    zcheckpipxmitm="Install mitmproxy Failed (Error)"
else
    zcheckpipxmitm="Install mitmproxy Successfully"
fi

if [[ $checkwgetdownload != 0 ]]; then
    zcheckwgetdownload="Download Proxy Failed (Error)"
else
    zcheckwgetdownload="Download Proxy Successfully"
fi

if [[ $checkeditfile != 0 ]]; then
    zcheckeditfile="Edit Proxy Failed (Error)"
else
    zcheckeditfile="Edit Proxy Successfully"
fi
whoMadeThis
sleep 1
echo -e "Results:\nExport Cargo = $zcheckexport\n\nInstall mitmproxy with pipx = $zcheckpipxmitm\n\nDownload proxy.py = $zcheckwgetdownload\n\nEdit proxy.py = $zcheckeditfile\n\n"
sleep 1
if [[ $checkexport != 0 ]] || [[ $checkpipxmitm != 0 ]] || [[ $checkwgetdownload != 0 ]] || [[ $checkeditfile != 0 ]]; then
    echo -e "There is Error\nJoin Discord Server and tag @Helper for Help\nhttps://discord.gg/GenshinPS"
    exit
else
    echo "Please Setting your WiFi or mobile data to Proxy"
    echo "Hostname : 127.0.0.1"
    echo "Port : 8080"
    echo "Download for Android there"
    echo "You will be offline (No Internet). Don't panic!"
    echo "This because Proxy."
    echo "You can turn off it or delete Proxy on WiFi Settings\n"
    read -p "Press enter for continue"
    echo -e "Download to /sdcard/Download\nFor code detect that you download it\n"
    read -p "Press enter for continue"
    echo -e "After open please wait 1 or 2 seconds\nand refresh it the site/browser!!!\n\nDon't share your certificate or error\n"
    read -p "Press enter for continue"
    echo "good luck!"
    sleep 2
    termux-open-url http://mitm.it
    echo "CTRL + C Key for Continue"
    mitmdump --ssl-insecure > /sdcard/zlog.txt
    zNextStep2
fi
