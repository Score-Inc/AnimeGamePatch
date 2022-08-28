removeCertRoot() {
    clear
    whoMadeThis
    if [[ "$isRooted" = false ]]; then
        echo "${redColorBold}This feature only for Rooted phone!${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    fi
    rmpathCertRoot=/system/etc/security/cacerts/zexCert
    echo "${greenColorBold}Mount target to /${whiteColor}"
    su -c mount -o rw,remount /
    sleep 0.5s
    echo "${greenColorBold}Check certficate...${whiteColor}"
    if [[ ! -f "$rmpathCertRoot" ]]; then
        echo "${redColorBold}There is no Certificate...${whiteColor}"
        echo ""
        echo -n "Press enter for back to Menu!"
        read -r
        UIMenu
        return
    else
        su -c rm "$rmpathCertRoot"
        if [[ ! -f $rmpathCertRoot ]]; then
            echo "${greenColorBold}Success remove Certificat Root!${whiteColor}"
            echo ""
            echo -n "Press enter for back to Menu"
            read -r
            UIMenu
            return
        else
            echo "${redColorBold}Can't Remove Certificat, IDK how to fix it"
        fi
    fi
}