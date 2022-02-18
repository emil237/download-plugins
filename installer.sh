#!/bin/sh # 
 # # Command: wget https://raw.githubusercontent.com/emil237/download-plugins/main/installer.sh -qO - | /bin/sh # # ########################################### ###########################################  
MY_URL="https://raw.githubusercontent.com/emil237/download-plugins/main"  
echo "******************************************************************************************************************"
echo "    download plugins to hdd   "
echo "============================================================================================================================="
#####################################################################################
echo "      download plugins to hdd    "
cd /tmp
set -e 
wget -q "--no-check-certificate" "https://drive.google.com/uc?id=1RTeS5tq8S7yLvgZdHKCQbVrWjZJEWdkz&export=download"
wait
tar xzvpf download-plugins.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/download-plugins.tar.gz
echo "==========================================================================================================================="
echo "      download plugins to hdd    "
cd /tmp
set -e 
wget -q "--no-check-certificate"  "https://drive.google.com/uc?id=1ReNewIEl1jNYIIS5aVpRyZAa4jgxolzg&export=download"
wait
tar xzvpf download-plugins2.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/download-plugins2.tar.gz
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
###########################################                                                                         #!/bin/sh
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



























