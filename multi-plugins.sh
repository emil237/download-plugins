#!/bin/sh
#
cd /tmp
echo " Download Plugins "
choice="$1"
echo -e "\e[35m  1 - Cccam"
    echo -e "\e[33m  2 - Ncam"
    echo -e "\e[35m  3 - Oscam"
    echo -e "\e[32m  4 - Raedquicksignal"
    echo -e "\e[33m  5 - Arabicsavior"
    echo -e "\e[35m  6 - Ajpanel"
    echo -e "\e[32m  7 - Dreamsatpanel"
    echo -e "\e[33m  8 - Keyadder"
    echo -e "\e[31m  9 - Jedimakerxtream"
    echo -e "\e[32m  10 - xtreamity"
    echo -e "\e[35m  11 - Iptosat"
    echo -e "\e[31m  12 - Ipaudio 6.7"
    echo
    echo -e "\e[32m  0 - Exit"
    echo
    echo "- Enter Numper option:"

    read choice
if [ "$choice" -eq 1 ]
then
sleep 1
echo " download emu cccam "
wget https://dreambox4u.com/emilnabil237/emu/installer-cccam.sh -O - | /bin/sh

elif [ "$choice" -eq 2 ]
then
sleep 1
echo " download emu ncam "
wget https://dreambox4u.com/emilnabil237/emu/installer-ncam.sh -O - | /bin/sh

elif [ "$choice" -eq 3 ]
then
sleep 1
echo " download emu oscam "
wget https://dreambox4u.com/emilnabil237/emu/installer-oscam.sh -O - | /bin/sh

elif [ "$choice" -eq 4 ]
then
sleep 1
echo " download plugin Raedquicksignal "
wget https://dreambox4u.com/emilnabil237/plugins/RaedQuickSignal/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 5 ]
then
sleep 1
echo " download plugin Arabicsavior "
wget http://dreambox4u.com/emilnabil237/plugins/ArabicSavior/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 6 ]
then
sleep 1
echo " download plugin Ajpanel "
wget -q "--no-check-certificate" http://dreambox4u.com/emilnabil237/plugins/ajpanel/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 7 ]
then
sleep 1
echo " download plugin Dreamsat Panel "
wget -q "--no-check-certificate" http://dreambox4u.com/emilnabil237/plugins/DreamSatPanel/installer.sh  -O - | /bin/sh

elif [ "$choice" -eq 8 ]
then
sleep 1
echo " download plugin Keyadder "
wget -q "--no-check-certificate" https://dreambox4u.com/emilnabil237/KeyAdder/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 9 ]
then
sleep 1
echo " download plugin Jedimakerxtream "
wget https://dreambox4u.com/emilnabil237/plugins/jedimakerxtream/installer.sh -qO - | /bin/sh

elif [ "$choice" -eq 10 ]
then
sleep 1
echo " download plugin xtreamity "
wget https://dreambox4u.com/emilnabil237/plugins/xtreamity/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 11 ]
then
sleep 1
echo " download plugin Iptosat "
wget -q "--no-check-certificate" https://dreambox4u.com/emilnabil237/plugins/iptosat/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 12 ]
then
sleep 1
echo " download plugin Ipaudio 6.7"
wget -q "--no-check-certificate" https://dreambox4u.com/emilnabil237/plugins/ipaudio/installer.sh -O - | /bin/sh

elif [ "$choice" -eq 0 ]
then
clear
echo -e "\e[32m thank you  And Good By "
 fi
echo -e "\e[35mUploded By Emil Nabil "
sleep 3;
exit











