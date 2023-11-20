#!/bin/sh
#
choice="$1"
cdchoice="$1" /tmp
echo " Download Plugins "
echo "  1 - Cccam"
    echo "  2 - Ncam"
    echo "  3 - Oscam"
    echo "  4 - Raedquicksignal"
    echo "  5 - Arabicsavior"
    echo "  6 - Ajpanel"
    echo "  7 - Dreamsatpanel"
    echo "  8 - Keyadder"
    echo "  9 - Jedimakerxtream"
    echo "  10 - xtreamity"
    echo "  11 - Iptosat"
    echo "  12 - Ipaudio 6.7"
    echo
    echo "  0 - Exit"
    echo
    echo "- Enter option:"

    read choice
read -ra  <<<"${choice}"
if [ "$choice" -eq "1" ]
then
sleep 1
echo " download emu cccam "


elif [ "$choice" -eq "2" ]
then
sleep 1
echo " download emu ncam "


elif [ "$choice" -eq "3" ]
then
sleep 1
echo " download emu oscam "

elif [ "$choice" -eq "4" ]
then
sleep 1
echo " download plugin Raedquicksignal "

elif [ "$choice" -eq "5" ]
then
sleep 1
echo " download plugin Arabicsavior "

elif [ "$choice" -eq "6" ]
then
sleep 1
echo " download plugin Ajpanel "

elif [ "$choice" -eq "7" ]
then
sleep 1
echo " download plugin Dreamsat Panel "

elif [ "$choice" -eq "8" ]
then
sleep 1
echo " download plugin Keyadder "

elif [ "$choice" -eq "9" ]
then
sleep 1
echo " download plugin Jedimakerxtream "

elif [ "$choice" -eq "10" ]
then
sleep 1
echo " download plugin xtreamity "

elif [ "$choice" -eq "11" ]
then
sleep 1
echo " download plugin Iptosat "

elif [ "$choice" -eq "12" ]
then
sleep 1
echo " download plugin Ipaudio 6.7"

elif [ "$choice" -eq "0" ]
then
clear
echo " thank you "
 fi
exit









