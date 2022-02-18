#!/bin/sh
####
#DESCRIPTION=This script will download plugins to hdd
####################################################################################
 # # Command: wget https://raw.githubusercontent.com/emil237/download-plugins/main/installer.sh -qO - | /bin/sh # #
###################################################################################
wget https://www.dropbox.com/s/fzxuq5yl5m3ttee/download-plugins.tar.bz2?dl=0 -O /tmp/download-plugins.tar.bz2
sleep 1
echo "Installing Plugin..."
tar -jxvf /tmp/download-plugins.tar.bz2 -C /
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
sleep 1
rm /tmp/download-plugins.tar.bz2
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
	echo '========================================================================================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0




























