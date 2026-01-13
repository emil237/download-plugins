#!/bin/sh
##
setup_command="wget https://raw.githubusercontent.com/emil237/backupflash/main/installer.sh -O - | /bin/sh"
##########################################
###########################################
MY_URL="https://raw.githubusercontent.com/emil237/backupflash/main"
############################
version=9.5

if [ ! -d '/usr/lib64' ]; then
	LIBPATH='/usr/lib'
else
	LIBPATH='/usr/lib64'
fi

# Find name of device
DreamOS=/var/lib/dpkg/status

if uname -r | grep -q "dm7080"; then
    echo "[Your device is MIPS - DM7080]"
elif uname -r | grep -q "dm820"; then
    echo "[Your device is MIPS - DM820]"
elif uname -r | grep -q "dm520"; then
    echo "[Your device is MIPS - DM520/525]"
elif uname -r | grep -q "dm525"; then
    echo "[Your device is MIPS - DM525]"
elif uname -r | grep -q "dm900"; then
    echo "[Your device is armv7l - DM900]"
elif uname -r | grep -q "dm920"; then
    echo "[Your device is armv7l - DM920]"
elif uname -r | grep -q "4.9"; then
    if [ -e /dev/ci0 ]; then
        echo "[Your device is armv64 - dreamtwo]"
    else
        echo "[Your device is armv64 - dreamone]"
    fi
else
    echo "##############################################"
    echo "#     Sorry, plugin does not support your STB      #"
    echo "##############################################"
    exit 1
fi

# Check Python version
if python --version 2>&1 | grep -q '^Python 3\.'; then
    echo "You have Python3 image"
    PYTHON=PY3
    CRYPT=python3-crypt
else
    echo "You have Python2 image"
    PYTHON=PY2
    CRYPT=python-crypt
fi

# Determine package manager
if [ -f $DreamOS ]; then
    STATUS=$DreamOS
else
    STATUS=/var/lib/opkg/status
fi

# Check for installed packages
for pkg in wget pigz xz flash-scripts $CRYPT; do
    if grep -q $pkg $STATUS; then
        echo "$pkg is installed"
    else
        echo "Missing $pkg, will attempt to install."
        missing_pkg=1
    fi
done

# Install missing packages
if [ "$missing_pkg" = "1" ]; then
    if [ -f $DreamOS ]; then
        dpkg --configure -a
        apt-get update
        apt-get install wget pigz xz python-twisted-web flash-scripts python-requests $CRYPT -y
    elif [ "$PYTHON" = "PY3" ]; then
        opkg update
        opkg install wget pigz xz python-twisted-web flash-scripts python3-requests $CRYPT
    else
        opkg update
        opkg install wget pigz xz flash-scripts python-requests $CRYPT
    fi
fi

# Remove old versions
for dir in /media/ba/backupflashe $LIBPATH/enigma2/python/Plugins/Extensions/{backupflashe,backupflashe2,dBackup}; do
    if [ -d "$dir" ]; then
        rm -rf "$dir"
    fi
done

# Download and install new version
cd /tmp || exit 1
wget "${MY_URL}/backupflash.tar.gz"
tar -xzf backupflash.tar.gz -C /

# Save plugin from BA protection
if [ -f "/media/ba/ba.sh" ] && [ -d "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe" ]; then
    mv /usr/lib/enigma2/python/Plugins/Extensions/backupflashe /media/ba
    ln -s /media/ba/backupflashe /usr/lib/enigma2/python/Plugins/Extensions
fi

# Cleanup
rm -f backupflash-"$version".tar.gz
cd ..
sync

# Completion message
echo "#########################################################"
echo "#          BackupFlash INSTALLED SUCCESSFULLY           #"
echo "#                 Raed  &  mfaraj57                     #"
echo "#########################################################"
echo "#             PLEASE RESTART YOUR STB                   #"
echo "##########################################################"
sleep 3
killall -9 enigma2
exit 0


