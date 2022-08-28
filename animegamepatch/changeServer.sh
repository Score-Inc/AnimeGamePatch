changeServer() {
    clear
    whoMadeThis
    domainChange=$inpsrv
    # You can add more server here. But edit code bellow too not only this
    if [[ $domainChange = "1" ]]; then
        domainChange="sg.genshin.ps.yuuki.me"
        portChange="443"
    elif [[ $domainChange = "2" ]]; then
        domainChange="eu.genshin.ps.yuuki.me"
        portChange="443"
    elif [[ $domainChange = "3" ]]; then
        domainChange="127.0.0.1"
        portChange="54321"
    fi
    if [[ $inpsrv = "1" ]]; then
        if [[ $downServerYuukiSG = 1 ]]; then
            changeServerDOWN
        else
            changeServer2
        fi
    fi

    if [[ $inpsrv = "2" ]]; then
        if [[ $downServerYuukiDE = 1 ]]; then
            changeServerDOWN
        else
            changeServer2
        fi
    fi

    if [[ $inpsrv = "3" ]]; then
        changeServer2
    fi
}



changeServer2 () {
    cd $HOME || exit 1
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it!${whiteColor}\n"
        echo -n "Press enter for back to Change Server Menu!"
        read -r
        zdomsh
        return
    fi
    sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domainChange\"/g" "$HOME"/proxy_config.py &> "$ZERR"
    sed -i "s/REMOTE_PORT = $portUsing/REMOTE_PORT = $portChange/g" $HOME/proxy_config.py &> /dev/null
    ifeditfailed=$?
    if [[ "$ifeditfailed" != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat "$ZERR"
        rm "$ZERR"
        exit
    else
        echo -e "The Domain changed to $domainChange\n"
        rm "$ZERR"
        echo -n "Press Enter to change server "
        read -r
        clear
        zdomsh
    fi
}

customserver() {
    cd $HOME || exit 1
    clear
    whoMadeThis
    if [[ ! -f "proxy.py" ]] || [[ ! -f "proxy_config.py" ]]; then
        echo -e "${redColorBold}Error : proxy_config.py not found\n\nPlease Download it!${whiteColor}\n"
        echo -n "Press enter for back to Change Server Menu!"
        read -r
        zdomsh
        return
    fi
    echo -e "${greenColorBold}Custom Domain!\n${cyanColorBold}Example : elashxander.my.id\n${yellowColorBold}Enter b/B for back or cancel\n${whiteColor}"
    echo -n "Enter custom Domain : ${cyanColorBold}"
    read -r domain
    echo -n "${whiteColor}"
    if [[ $domain = "B" ]] || [[ $domain = "b" ]] || [[ $domain = "Back" ]] || [[ $domain = "BACK" ]]; then
        clear
        zdomsh
    fi
    echo -n "Enter port : "
    read -r changeAPort
    if [[ $changeAPort = "B" ]] || [[ $changeAPort = "b" ]] || [[ $changeAPort = "Back" ]] || [[ $changeAPort = "Back" ]]; then
        clear
        zdomsh
    fi
    domain=$(echo "$domain" | sed "s/http.*\/\///g") # Thanks to Charon Baglari
    curl -Ism 2 -f https://"$domain" &> /dev/null
    ifcurleditfail=$?
    if [[ $domain = "127.0.0.1" ]]; then
        command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" "$HOME"/proxy_config.py &> "$ZERR"
        sed -i "s/REMOTE_PORT = $portUsing/REMOTE_PORT = $changeAPort/g" $HOME/proxy_config.py &> /dev/null
        echo "Domain changed to localhost..."
        echo ""
        echo -n "Press Enter to change server "
        read -r
        clear
        zdomsh
    elif [[ "$ifcurleditfail" != 0 ]]; then
        echo -e "Server is can't to be access!\n"
        echo -n "You sure want change to $domain? (y/n/r) : "
        read -r youSureBruh
        case $youSureBruh in
            "y" | "Y" ) command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" "$HOME"/proxy_config.py &> "$ZERR";sed -i "s/REMOTE_PORT = .*/REMOTE_PORT = $changeAPort/g" $HOME/proxy_config.py &> /dev/null;;
            "n" | "N" ) echo "Okay! server not changed!"; exit;;
            "r" | "R" ) customserver;;
            * ) echo -e "Wrong input!\nTry Again..."; sleep 1s; customserver;;
        esac
    else
        command sed -i "s/REMOTE_HOST = \".*\"/REMOTE_HOST = \"$domain\"/g" "$HOME"/proxy_config.py &> "$ZERR"
        sed -i "s/REMOTE_PORT = $portUsing/REMOTE_PORT = $changeAPort/g" $HOME/proxy_config.py &> /dev/null
    fi
    ifeditsedfail=$?
    if [[ "$ifeditsedfail" != 0 ]]; then
        echo "ERROR!"
        echo -e "\nReason Error : ";command cat "$ZERR"
        rm "$ZERR"
        exit
    else
        echo -e "The Domain changed to $domain\n"
        rm "$ZERR"
        echo -n "Press Enter to change server "
        read -r
        clear
        zdomsh
    fi
}

changeServer_list() {
    if [[ -f "proxy_config.py" ]]; then
        serverUsing=$(cat proxy_config.py | grep "REMOTE_HOST = \"" | sed "s/.*= //g" | sed "s/\"//g")
        portUsing=$(cat proxy_config.py | grep "REMOTE_PORT = " | head -n 1 | sed "s/.*= //g")
    else
        serverUsing=""
        portUsing=""
    fi
    if [[ $serverUsing = "" ]]; then
        serverUsing="${redColorBold}There is no Server${whiteColor}"
    fi
    if [[ $portUsing = "" ]]; then
        portUsing="${redColorBold}There is no Port${whiteColor}"
    fi
    if [[ -f "proxy_config.py" ]]; then
        zdomsh_echo="${greenColorBold}File target edit to proxy_config.py\n\n${cyanColorBold}Current Server : $serverUsing\nCurrent Port : $portUsing${whiteColor}"
    else
        zdomsh_echo="${redColorBold}Can't display : proxy_config.py file not found${whiteColor}"
    fi
    echo "${greenColorBold}Checking server...${whiteColor}"
    curl -Ism 3 -f https://sg.genshin.ps.yuuki.me &> /dev/null
    resultsCheckServerYuukiSG=$?
    curl -Ism 3 -f https://eu.genshin.ps.yuuki.me &> /dev/null
    resultsCheckServerYuukiEU=$?
    clear
    whoMadeThis
    echo -e ${zdomsh_echo}
    if [[ $resultsCheckServerYuukiSG = 28 ]]; then
        statusServerYuukiSG="${redColorBold}[DOWN]${whiteColor}"
        downServerYuukiSG=1
    elif [[ $resultsCheckServerYuukiSG = 6 ]]; then
        statusServerYuukiSG="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
        downServerYuukiSG=0
    elif [[ $resultsCheckServerYuukiSG = 0 ]]; then
        statusServerYuukiSG="${greenColorBold}[RUNNING]${whiteColor}"
        downServerYuukiSG=0
    fi
    if [[ $resultsCheckServerYuukiEU = 28 ]]; then
        statusServerYuukiEU="${redColorBold}[DOWN]${whiteColor}"
        downServerYuukiEU=1
    elif [[ $resultsCheckServerYuukiEU = 6 ]]; then
        statusServerYuukiEU="${yellowColorBold}[CAN'T CONNECT]${whiteColor}"
        downServerYuukiEU=0
    elif [[ $resultsCheckServerYuukiEU = 0 ]]; then
        statusServerYuukiEU="${greenColorBold}[RUNNING]${whiteColor}"
        downServerYuukiEU=0
    fi
}