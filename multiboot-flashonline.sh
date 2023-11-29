wget -O /var/volatile/tmp/multiboot-flashonline_all.ipk "https://raw.githubusercontent.com/emil237/plugins/main/multiboot-flashonline_all.ipk"
wait
opkg install --force-overwrite /tmp/*.ipk
wait
rm -r /var/volatile/tmp/multiboot-flashonline_all.ipk
wait
sleep 2;
exit 0
