#!/bin/sh
setup_command="wget https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.sh -O - | /bin/sh"
########################################

LOCK_FILE="/tmp/.backupflash_install.lock"
[ -f "$LOCK_FILE" ] && exit 0
touch "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT INT TERM

[ -d /usr/lib64 ] && LIBBASE=/usr/lib64 || LIBBASE=/usr/lib

ENIGMA_DETECTED=0
[ -x /usr/bin/enigma2 ] || [ -x /usr/bin/enigma2.sh ] || [ -d "$LIBBASE/enigma2" ] && ENIGMA_DETECTED=1

PKG_MGR=""
command -v apt-get >/dev/null 2>&1 && PKG_MGR="apt"
command -v opkg >/dev/null 2>&1 && PKG_MGR="opkg"
command -v dnf  >/dev/null 2>&1 && PKG_MGR="dnf"

for p in python3.13 python3.12 python3.11 python3.10 python3 python; do
    command -v $p >/dev/null 2>&1 && break
done

case "$PKG_MGR" in
apt)
    apt-get update >/dev/null 2>&1
    apt-get install -y wget curl pigz xz-utils bzip2 gzip flash-scripts python3-requests python-requests >/dev/null 2>&1
;;
opkg)
    opkg update >/dev/null 2>&1
    opkg install wget curl pigz xz bzip2 gzip flash-scripts python3-requests python-requests >/dev/null 2>&1
;;
dnf)
    dnf install -y wget curl pigz xz bzip2 gzip python3-requests >/dev/null 2>&1
;;
esac

for d in \
/media/ba/backupflashe \
/usr/lib/enigma2/python/Plugins/Extensions/backupflashe \
/usr/lib64/enigma2/python/Plugins/Extensions/backupflashe \
/usr/local/lib/enigma2/python/Plugins/Extensions/backupflashe
do
    [ -e "$d" ] && rm -rf "$d" >/dev/null 2>&1
done

cd /tmp >/dev/null 2>&1 || exit 1

wget -O backupflash.tar.gz https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz >/dev/null 2>&1 \
|| curl -L -o backupflash.tar.gz https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz >/dev/null 2>&1 \
|| exit 1

tar -xzf backupflash.tar.gz -C / >/dev/null 2>&1 || exit 1
rm -f backupflash.tar.gz >/dev/null 2>&1
sync

############################################
# SMART Enigma2 Restart
############################################

[ "$ENIGMA_DETECTED" -eq 1 ] || exit 0

if command -v init >/dev/null 2>&1; then
    init 4 >/dev/null 2>&1
    sleep 3
    init 3 >/dev/null 2>&1 && exit 0
fi

if command -v systemctl >/dev/null 2>&1; then
    systemctl restart enigma2 >/dev/null 2>&1 && exit 0
fi

[ -x /etc/init.d/enigma2 ] && /etc/init.d/enigma2 restart >/dev/null 2>&1 && exit 0
[ -x /etc/init.d/enigma ]  && /etc/init.d/enigma restart  >/dev/null 2>&1 && exit 0

pkill -9 enigma2 >/dev/null 2>&1
sleep 2
[ -x /usr/bin/enigma2.sh ] && /usr/bin/enigma2.sh >/dev/null 2>&1 &
[ -x /usr/bin/enigma2 ] && /usr/bin/enigma2 >/dev/null 2>&1 &

exit 0


