spinPID() {
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
            echo -ne "\r[${greenColorBold}✓${whiteColor}"
            echo
            trap - INT
        fi
    done
}