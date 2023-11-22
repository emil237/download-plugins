#!/bin/bash

while true; do
    echo "Download Plugins"
    echo -e "\e[33m 1 - Cccam"
    echo -e "\e[33m 2 - Ncam"
    echo -e "\e[33m 3 - Oscam"
    echo -e "\e[37m 4 - Raedquicksignal"
    echo -e "\e[37m 5 - Arabicsavior"
    echo -e "\e[37m 6 - Ajpanel"
    echo -e "\e[37m 7 - Dreamsatpanel"
    echo -e "\e[37m 8 - Keyadder"
    echo -e "\e[37m 9 - Jedimakerxtream"
    echo -e "\e[37m10 - xtreamity"
    echo -e "\e[37m11 - Iptosat"
    echo -e "\e[37m12 - Ipaudio 6.7"
    echo -e "\e[37m13 - levi45 addonsmanager"
    echo -e "\e[37m14 - E2IPLAYER TSIPLYER"
    echo -e "\e[37m15 - CronManager"
    echo -e "\e[37m16 - HistoryZapSelector"
    echo -e "\e[37m17 - Epg Grabber"
    echo -e "\e[37m18 - IpaudioPro-py3.9-py3.11"
    echo -e "\e[37m19 - Multi-Stalker-ALL-Python"
    echo -e "\e[37m20 - Xtraevent"
    echo -e "\e[37m21 - Multi StalkerPro-py2+py3.11"
    echo -e "\e[36m22 - Neoboot_9.65"
    echo -e "\e[37m23 - Feed Emil Nabil "
    echo
    echo
    echo -e "\e[37m  0 -  Exit  "
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
             13)
                echo "Running plugin levi45 addonsmanager script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/levi45-addonsmanager/installer.sh)" ;;
             14)
                echo "Running plugin E2IPLAYER TSIPLYER script from URL..."
                sh -c "$(wget -O- https://gitlab.com/MOHAMED_OS/e2iplayer/-/raw/main/install-e2iplayer.sh?inline=false)" ;;
             15)
                echo "Running plugin CronManager script from URL..."
                sh -c "$(wget -O- https://github.com/emil237/download-plugins/raw/main/cronmanager.sh)" ;;
             16)
                echo "Running plugin HistoryZapSelector script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/historyzap/installer.sh)" ;;
             17)
                echo "Running plugin Epg Grabber script from URL..."
                sh -c "$(wget -O- https://raw.githubusercontent.com/ziko-ZR1/Epg-plugin/master/Download/installer.sh)" ;;
              18)
                echo "Running plugin IpaudioPro script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/ipaudiopro/installer.sh)" ;;
              19)
                echo "Running plugin Multi-Stalker script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/multistalker/installer.sh)" ;;
              20)
                echo "Running plugin Xtraevent script from URL..."
                sh -c "$(wget -O- https://github.com/emil237/download-plugins/raw/main/Xtraevent-v4.6.sh)" ;;
              21)
                echo "Running plugin Multi StalkerPro script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/MultiStalkerPro/installer.sh)" ;;
              22)
                echo "Running plugin Neoboot_9.65 script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/plugins/neoboot-v9.65/iNB.sh)" ;;
            23)
                echo "Running Install Feed Emil Nabil script from URL..."
                sh -c "$(wget -O- http://dreambox4u.com/emilnabil237/script/FEED-emil-feed.sh)" ;;
            0)
                echo "Thank you"; exit ;;
            *)
                echo "Invalid option: $choices"; continue ;;
        esac
    done
done









