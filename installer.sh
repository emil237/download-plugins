#!/bin/sh # 
 # # Command: wget https://raw.githubusercontent.com/emil237/download-plugins/main/installer.sh -qO - | /bin/sh # # ########################################### ###########################################  
MY_URL="https://raw.githubusercontent.com/emil237/download-plugins/main"  
echo "******************************************************************************************************************"
echo "    download plugins to hdd   "
echo "============================================================================================================================="
#####################################################################################
echo "      download plugins to hdd    "
mkdir -p /media/hdd/download-plugins
cd /tmp
set -e 
wget -q  "https://drive.google.com/uc?id=1RTeS5tq8S7yLvgZdHKCQbVrWjZJEWdkz&export=download"
wait
tar -xzf *.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/*.tar.gz
echo "==========================================================================================================================="
echo "      download plugins to hdd    "
cd /tmp
set -e 
wget -q  "https://drive.google.com/uc?id=1ReNewIEl1jNYIIS5aVpRyZAa4jgxolzg&export=download"
wait
tar -xzf *.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/*.tar.gz
sleep 2;
echo "" 
echo "" 
echo "****************************************************************************************************************************"
echo "# DOWNLOADS  INSTALLED SUCCESSFULLY #"
echo "
echo " "*********************************************************" 
	echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
	echo '========================================================================================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0




























