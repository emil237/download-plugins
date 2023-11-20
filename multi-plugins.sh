#!/bin/bash

while true; do
    echo "Download Plugins"
    echo "1 - Cccam"
    echo "2 - Ncam"
    echo "3 - Oscam"
    echo "4 - Raedquicksignal"
    echo "5 - Arabicsavior"
    echo "6 - Ajpanel"
    echo "7 - Dreamsatpanel"
    echo "8 - Keyadder"
    echo "9 - Jedimakerxtream"
    echo "10 - xtreamity"
    echo "11 - Iptosat"
    echo "12 - Ipaudio 6.7"
    echo "0 - Exit"
    echo
    echo "Enter options (space-separated):"
    read choices

    # Split the user input into an array
    IFS=' ' read -ra choices_array <<< "$choices"

    # Process each choice
    for choice in "${choices_array[@]}"; do
        case $choice in
            1)
                echo "Running emu cccam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-cccam.sh)" ;;
            2)
                echo "Running emu ncam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-ncam.sh)" ;;
            3)
                echo "Running emu oscam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-oscam.sh)" ;;
            4)
                echo "Running plugin Raedquicksignal script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/RaedQuickSignal/installer.sh)" ;;
            5)
                echo "Running plugin Arabicsavior script from URL..."
                sh -c "$(wget -O- http://dreambox4u.com/emilnabil237/plugins/ArabicSavior/installer.sh)" ;;
            6)
                echo "Running plugin Ajpanel script from URL..."
                sh -c "$(wget -qO- --no-check-certificate http://dreambox4u.com/emilnabil237/plugins/ajpanel/installer.sh)" ;;
            7)
                echo "Running plugin Dreamsat Panel script from URL..."
                sh -c "$(wget -qO- --no-check-certificate http://dreambox4u.com/emilnabil237/plugins/DreamSatPanel/installer.sh)" ;;
            8)
                echo "Running plugin Keyadder script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/KeyAdder/installer.sh)" ;;
            9)
                echo "Running plugin Jedimakerxtream script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/jedimakerxtream/installer.sh)" ;;
            10)
                echo "Running plugin xtreamity script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/xtreamity/installer.sh)" ;;
            11)
                echo "Running plugin Iptosat script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/plugins/iptosat/installer.sh)" ;;
            12)
                echo "Running plugin Ipaudio 6.7 script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/plugins/ipaudio/installer.sh)" ;;
            0)
                echo "Thank you"; exit ;;
            *)
                echo "Invalid option: $choice"; continue ;;
        esac
    done
done

