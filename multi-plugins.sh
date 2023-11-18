#!/usr/bin/bash
#

# colors
Color_Off="\e[0m" # Text Reset
Red="\e[0;31m"    # Red
Yellow="\e[0;33m" # Yellow
Blue='\e[0;34m'   # Blue
Green='\e[0;32m'  # Green

###########################################
# Configure where we can find things here #
pyVersion=$(python -c"from sys import version_info; print(version_info[0])")
SitUrl='https://raw.githubusercontent.com/emil237/Important-plugins/main'
TmpDir='/var/volatile/tmp'

####################
#  Depends Checking  #
arrVar=("ffmpeg" "gstplayer" "exteplayer3" "enigma2-plugin-systemplugins-serviceapp")

if [ "${pyVersion}" = 3 ]; then
    arrVar+=("python3-core" "python3-futures3" "python3-image" "python3-json" "python3-multiprocessing" "python3-pillow" "python3-requests" "python3-cryptography")
else
    arrVar+=("python-core" "python-futures" "python-image" "python-imaging" "python-json" "python-multiprocessing" "python-requests" "python-cryptography")
fi
for PkgFile in "${arrVar[@]}"; do
    if ! grep -qs "Package: $PkgFile" '/var/lib/opkg/status'; then
        echo -e ">>>>   Please Wait Install ${Green}${PkgFile}${Color_Off}   <<<<"
        echo
        opkg install "${PkgFile}"
        wait
        sleep 0.8
        clear
    fi
done

if [ "$(opkg info libcrypto-compat | grep -Fic Package)" = 1 ]; then
    LibPkg="libcrypto-compat"
else
    LibPkg="libcrypto-compat-1.0.0"
fi
echo " Download Plugins "
echo "  1 - Cccam"
    echo "  2 - Ncam"
    echo "  3 - Oscam"
    echo "  4 - Raedquicksignal"
    echo "  5 - Arabicsavior"
    echo "  6 - Ajpanel"
    echo "  7 - Dreamsatpanel"
    echo "  8 - Keyadder"
    echo
    echo "  0 - Exit"
    echo
    echo "- Enter option:"

    read -r choice
if [ $choice -eq 1 ]
then
sleep 1
echo " download emu cccam "
wget https://dreambox4u.com/emilnabil237/emu/installer-cccam.sh -O - | /bin/sh

elif [ $choice -eq 2 ]
then
sleep 1
echo " download emu ncam "
wget https://dreambox4u.com/emilnabil237/emu/installer-ncam.sh -O - | /bin/sh

elif [ $choice -eq 3 ]
then
sleep 1
echo " download emu oscam "
wget https://dreambox4u.com/emilnabil237/emu/installer-oscam.sh -O - | /bin/sh

elif [ $choice -eq 4 ]
then
sleep 1
echo " download plugin Raedquicksignal "
wget https://dreambox4u.com/emilnabil237/plugins/RaedQuickSignal/installer.sh -O - | /bin/sh

elif [ $choice -eq 5 ]
then
sleep 1
echo " download plugin Arabicsavior "
wget http://dreambox4u.com/emilnabil237/plugins/ArabicSavior/installer.sh -O - | /bin/sh

elif [ $choice -eq 6 ]
then
sleep 1
echo " download plugin Ajpanel "
wget -q "--no-check-certificate" http://dreambox4u.com/emilnabil237/plugins/ajpanel/installer.sh -O - | /bin/sh

elif [ $choice -eq 7 ]
then
sleep 1
echo " download plugin Dreamsat Panel "
wget -q "--no-check-certificate" http://dreambox4u.com/emilnabil237/plugins/DreamSatPanel/installer.sh  -O - | /bin/sh

elif [ $choice -eq 8 ]
then
sleep 1
echo " download plugin Keyadder "
wget -q "--no-check-certificate" https://dreambox4u.com/emilnabil237/KeyAdder/installer.sh -O - | /bin/sh

elif [ $choice -eq 0 ]
then
clear
echo " thank you "
fi
sleep 0.8
sync
echo ""
echo ""
echo "******************************************************"
exit



