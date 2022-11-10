spin() {
    # Spin var
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"
    # Check for process
    while kill -0 "$pid" 2>/dev/null; do
        for i in "${spin[@]}"; do
            echo -ne "\r["
            echo -ne ${greenColorBold}"$i"
            echo -ne ${whiteColor}"]"${greenColorBold} "$1"
            sleep 0.1
            trap '' INT
        done
        # Adding checklist or "✓" for more good by me XD
        if ! (ps "$pid" &>/dev/null); then
            errCode=$(cat $HOME/z.log | grep "$catLogs_code")
            errOutput=$(cat $HOME/zerr.log)
            if [ $errCode = $2 ]; then
                echo -ne "\r[${greenColorBold}✓${whiteColor}"
                echo
            else
                trap - INT
                echo -ne "\r[${redColorBold}X${whiteColor}"
                echo -e "\n${redColorBold}Failed output with code ${errCode}${whiteColor}"
                echo
                echo "Reason :"
                echo "$errOutput"
                echo
                read -p "Press enter for back to $3!"
                $4
            fi
            rm $HOME/z.log
            rm $HOME/zerr.log
            trap - INT
        fi
    done
}

# Get Error Code
log() {
    echo -n "$1" >$HOME/z.log
    catLogs_code=$(cat "$HOME"/z.log | grep "$1")
}
