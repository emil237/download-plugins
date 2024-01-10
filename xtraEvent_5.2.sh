#!/bin/sh
 # 
echo ""
cd /tmp
curl  -k -Lbk -m 55532 -m 555104 "https://raw.githubusercontent.com/emil237/download-plugins/main/xtraEvent_5.2.tar.gz" > /tmp/xtraEvent_5.2.tar.gz
sleep 1
echo "installing ...."
cd /tmp
tar -xzf xtraEvent_5.2.tar.gz  -C /
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
sleep 1
cd
rm -f /tmp/xtraEvent_5.2.tar.gz
echo "OK"
echo " UPLOADED BY EMIL_NABIL "
sleep 4;
echo ""
echo ""
exit






