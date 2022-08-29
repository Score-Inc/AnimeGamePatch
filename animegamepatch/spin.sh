spin() {
    # Spin var
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"
    # Check for process
    while kill -0 "$pid" 2> /dev/null; do
        for i in "${spin[@]}"; do
            echo -ne "\r[";
            echo -ne ${greenColorBold}"$i";
            echo -ne ${whiteColor}"]" "$1"; sleep 0.1;
            trap '' INT
        done
        # Adding checklist or "✓" for more good by me XD
        if ! (ps "$pid" &> /dev/null); then
            errCode=$(cat $HOME/z.log | grep "$catLogs_code")
            errOutput=$(cat $HOME/zerr.log)
            if [ $errCode = $2 ]; then
                echo -ne "\r[${greenColorBold}✓${whiteColor}"
                echo
            else
                echo -ne "\r[${redColorBold}X${whiteColor}"
                rm $HOME/zerr.log
                if [[ $5 != "1" ]]; then
                    echo -e "\n${redColorBold}Failed output${whiteColor}"
                    echo
                    echo "Reason :"
                    echo "$errOutput"
                    echo
                    rm $HOME/zerr.log
                    rm $HOME/z.log
                    read -p "Press enter for back to $3!"
                    $4
                else
                    echo
                fi
            fi
            trap - INT
        fi
    done
}

# Get Error Code
log() {
    echo -n "$1" > $HOME/z.log
    catLogs_code=$(cat "$HOME"/z.log | grep "$1")
}