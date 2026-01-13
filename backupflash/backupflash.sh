#!/bin/sh
##
setup_command="wget https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.sh -O - | /bin/sh"
############################################
version="9.5"

# Detect device architecture
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
    echo "#  Sorry, plugin does not support your STB  #"
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
if [ -f "$DreamOS" ]; then
    STATUS="$DreamOS"
    OS_TYPE="dream"
else
    STATUS="/var/lib/opkg/status"
    OS_TYPE="opkg"
fi

# Check for installed packages
missing_pkg=0
for pkg in wget pigz xz flash-scripts $CRYPT; do
    if grep -q "Package: $pkg" "$STATUS" 2>/dev/null || grep -q "^$pkg" "$STATUS" 2>/dev/null; then
        echo "$pkg is installed"
    else
        echo "Missing $pkg, will attempt to install."
        missing_pkg=1
    fi
done

# Install missing packages
if [ "$missing_pkg" = "1" ]; then
    if [ "$OS_TYPE" = "dream" ]; then
        dpkg --configure -a
        apt-get update
        apt-get install wget pigz xz flash-scripts python-requests $CRYPT -y
    elif [ "$PYTHON" = "PY3" ]; then
        opkg update
        opkg install wget pigz xz python3-twisted-web flash-scripts python3-requests $CRYPT
    else
        opkg update
        opkg install wget pigz xz flash-scripts python-requests $CRYPT
    fi
    
    # Check if installation was successful
    if [ $? -ne 0 ]; then
        echo "Failed to install required packages. Please check your internet connection and repositories."
        exit 1
    fi
fi

# Remove old versions
for dir in /media/ba/backupflashe $LIBPATH/enigma2/python/Plugins/Extensions/backupflashe \
           $LIBPATH/enigma2/python/Plugins/Extensions/backupflashe2 \
           $LIBPATH/enigma2/python/Plugins/Extensions/dBackup; do
    if [ -d "$dir" ]; then
        echo "Removing old version: $dir"
        rm -rf "$dir"
    fi
done

# Remove broken symlinks
if [ -L "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe" ]; then
    rm -f "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe"
fi

# Download and install new version
cd /tmp || exit 1

# Download the plugin archive
echo "Downloading backupflash plugin..."
wget "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz" -O backupflash.tar.gz

# Check if download was successful
if [ ! -f "backupflash.tar.gz" ]; then
    echo "Failed to download backupflash plugin!"
    exit 1
fi

# Extract the archive
echo "Installing backupflash plugin..."
tar -xzf backupflash.tar.gz -C /

# Check if extraction was successful
if [ $? -ne 0 ]; then
    echo "Failed to extract backupflash plugin!"
    rm -f backupflash.tar.gz
    exit 1
fi

# Save plugin from BA protection
if [ -f "/media/ba/ba.sh" ] && [ -d "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe" ]; then
    echo "Moving plugin to BA protected area..."
    mv "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe" /media/ba/
    ln -sf /media/ba/backupflashe "$LIBPATH/enigma2/python/Plugins/Extensions/backupflashe"
fi

# Cleanup
rm -f backupflash.tar.gz
sync

# Completion message
echo "#########################################################"
echo "#          BackupFlash INSTALLED SUCCESSFULLY           #"
echo "#                 Raed  &  mfaraj57                     #"
echo "#########################################################"
echo "#             PLEASE RESTART YOUR STB                   #"
echo "#########################################################"

# Restart enigma2 
echo "Restarting enigma2..."
sleep 2
init 4
sleep 2
init 3

exit 0

