#!/bin/sh
##
setup_command="wget https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.sh -O - | /bin/sh"
############################################
version="13.3"

# Detect device architecture
if [ ! -d '/usr/lib64' ]; then
	LIBPATH='/usr/lib'
else
	LIBPATH='/usr/lib64'
fi

# Check package manager
if command -v apt-get >/dev/null 2>&1; then
    INSTALL="apt-get install -y"
    CHECK_INSTALLED="dpkg -l | grep"
    STATUS='/var/lib/dpkg/status'
    OS='DreamOS'
    apt-get update >/dev/null 2>&1
elif command -v opkg >/dev/null 2>&1; then
    INSTALL="opkg install --force-reinstall --force-depends"
    CHECK_INSTALLED="opkg list-installed | grep"
    STATUS='/var/lib/opkg/status'
    OS='Opensource'
else
    exit 1
fi

echo "##############################################"
echo "#           Installing BackupFlash           #"
echo "##############################################"

# Check Python version
if python --version 2>&1 | grep -q '^Python 3\.'; then
    echo "You have Python3 image"
    PYTHON='PY3'
    CRYPT='python3-crypt'
else
    echo "You have Python2 image"
    PYTHON='PY2'
    CRYPT='python-crypt'
fi

# Define packages based on Python version
if [ "$PYTHON" = 'PY3' ]; then
    packages="p7zip python3-rarfile libavformat58 libavcodec58 python3-cryptography \
              libgcc1 libc6 libavcodec61 libavformat61 libasound2 enigma2 \
              alsa-plugins tar wget zip ar curl python3-lxml \
              python3-requests bzip2 tar pigz \
              python3-six python3-sqlite3 python3-pycrypto f4mdump python3-image \
              unrar python3-pysocks gzip \
              xz enigma2-plugin-systemplugins-serviceapp ffmpeg exteplayer3 \
              gstplayer python3-twisted-web"
elif [ "$PYTHON" = 'PY2' ]; then
    packages="wget tar zip ar curl pigz bzip2 python-requests \
              python-twisted-web python-rarfile flash-scripts xz \
              python-six python-sqlite3 python-pycrypto f4mdump python-image \
              enigma2-plugin-systemplugins-serviceapp ffmpeg exteplayer3"
fi

# Install packages silently
for package in $packages; do
    if ! $CHECK_INSTALLED "$package" >/dev/null 2>&1; then
        echo "Installing $package..."
        $INSTALL "$package" >/dev/null 2>&1
    fi
done

# Remove old versions
for dir in /media/ba/backupflashe \
           $LIBPATH/enigma2/python/Plugins/Extensions/backupflashe \
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
if [ "$OS" = "DreamOS" ]; then
    wget -q "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/dreambox/backupflash.tar.gz" -O backupflash.tar.gz
else
    wget -q "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/opensurce/backupflash.tar.gz" -O backupflash.tar.gz
fi

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

