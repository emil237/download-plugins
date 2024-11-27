#!/bin/sh
echo "install plugin Wget for Vti Image"
cd /tmp
curl  -k -Lbk -m 55532 -m 555104 "https://github.com/emil237/download-plugins/raw/refs/heads/main/wget_vti_1.16.3-r0_all.ipk" > /tmp/wget_vti_1.16.3-r0_all.ipk
sleep 1
echo "install plugin...."
cd /tmp
opkg install /tmp/wget_vti_1.16.3-r0_all.ipk
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
sleep 1
rm /tmp/wget_vti_1.16.3-r0_all.ipk
sleep 2
killall -9 enigma2
exit
