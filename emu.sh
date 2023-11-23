#!/bin/bash

while true; do
    echo "Download emu"
sleep 3;
    echo " 1 - Cccam"
    echo " 2 - Ncam"
    echo " 3 - Oscam"
    echo " 4 - GosatPlus-Ncam"
    echo " 5 - GosatPlus-Oscam"
    echo " 6 - GosatPlus"
    echo " 7 - MgCamd"
    echo " 8 - Oscam-Icam"
    echo " 9 - Powercam-Icam"
    echo "10 - Powercam-Ncam"
    echo "11 - Powercam-Oscam"
    echo "12 - Revcam-Ncam"
    echo "13 - Revcam-Oscam"
    echo "14 - Revcam"
    echo "15 - Supcam-Ncam"
    echo "16 - Supcam-Oscam"
    echo "17 - Ultracam-Ncam"
    echo "18 - Ultracam-Oscam"
    echo "19 - Ultracam"
    echo
    echo "00 - Back to previous"
    echo
    echo " 0 -  Exit  "
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
                echo "Running emu gosatplus-ncam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-gosatplus-ncam.sh)" ;;
            5)
                echo "Running emu GosatPlus-Oscam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-gosatplus-oscam.sh)" ;;
            6)
                echo "Running emu GosatPlus script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/emu/installer-gosatplus.sh)" ;;
            7)
                echo "Running emu MgCamd Panel script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/script/emu-mgcamd.sh)" ;;
            8)
                echo "Running emo OscamIcam script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://raw.githubusercontent.com/biko-73/OsCam_EMU/main/installericam.sh)" ;;
            9)
                echo "Running emu PowercamIcam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/install-powercamicam-arm.sh)" ;;
            10)
                echo "Running emu PowercamNcam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-powercam-ncam.sh)" ;;
            11)
                echo "Running emu PowecamOscam script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/emu/installer-powercam-oscam.sh)" ;;
            12)
                echo "Running emu RevcamNcam script from URL..."
                sh -c "$(wget -qO- --no-check-certificate https://dreambox4u.com/emilnabil237/emu/installer-revcam-ncam.sh)" ;;
             13)
                echo "Running emu RevcamOscam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-revcam-oscam.sh)" ;;
             14)
                echo "Running emu Revcam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-revcam.sh)" ;;
             15)
                echo "Running emu SupcamNcam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-supcam-ncam.sh)" ;;
             16)
                echo "Running emu SupcamOscam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-supcam-oscam.sh)" ;;
             17)
                echo "Running emu UltracamNcam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-ultracam-ncam.sh)" ;;
              18)
                echo "Running emu UltracamOscam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-ultracam-oscam.sh)" ;;
              19)
                echo "Running emu Ultracam script from URL..."
                sh -c "$(wget -O- https://dreambox4u.com/emilnabil237/emu/installer-ultracam.sh)" ;;
            00)
                echo "Running Back to previous script from URL..."
                sh -c "$(wget -O- https://raw.githubusercontent.com/emil237/download-plugins/main/multi-plugins.sh)" ;;
            0)
                echo "Thank you"; exit ;;
            *)
                echo "Invalid option: $choices"; continue ;;
        esac
    done
done

