#!/bin/sh
##
setup_command="wget https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.sh -O - | /bin/sh"
############################################
version="12.1"
# Detect device architecture
if [ ! -d '/usr/lib64' ]; then
	LIBPATH='/usr/lib'
else
	LIBPATH='/usr/lib64'
fi

# Determine OS type
DreamOS=/var/lib/dpkg/status

# Detect architecture using multiple methods
ARCH=$(uname -m)
KERNEL_VERSION=$(uname -r)

echo "========================================="
echo "Detected Architecture: $ARCH"
echo "Kernel Version: $KERNEL_VERSION"
echo "========================================="

# Check for Enigma2
if [ -f "/usr/bin/enigma2" ] || [ -f "/usr/bin/enigma2.sh" ] || [ -d "/usr/lib/enigma2" ] || [ -d "/usr/lib64/enigma2" ]; then
    echo "[✓] Enigma2 system detected"
else
    echo "[!] This does not appear to be an Enigma2 system"
    echo "Proceeding anyway, but may encounter issues..."
fi

# Determine device type more broadly
if echo "$KERNEL_VERSION" | grep -qi "dm7080\|dm820\|dm520\|dm525\|dm7020"; then
    echo "[Your device is MIPS based]"
elif echo "$KERNEL_VERSION" | grep -qi "dm900\|dm920\|dm8000\|dm800se\|dm500hd\|dm800hd"; then
    echo "[Your device is ARM based]"
elif echo "$ARCH" | grep -qi "mips"; then
    echo "[Your device is MIPS based]"
elif echo "$ARCH" | grep -qi "arm"; then
    echo "[Your device is ARM based]"
elif echo "$ARCH" | grep -qi "aarch64"; then
    echo "[Your device is AArch64 based]"
elif [ -e "/dev/ci0" ]; then
    echo "[Your device is ARM64 with CI slot]"
else
    echo "[Your device architecture: $ARCH]"
    echo "Continuing with generic installation..."
fi

# Check Python version
if command -v python3 >/dev/null 2>&1 && python3 --version 2>&1 | grep -q '^Python 3\.'; then
    echo "You have Python3 image"
    PYTHON=PY3
    CRYPT=python3-crypt
elif command -v python >/dev/null 2>&1 && python --version 2>&1 | grep -q '^Python 3\.'; then
    echo "You have Python3 image"
    PYTHON=PY3
    CRYPT=python3-crypt
elif command -v python >/dev/null 2>&1; then
    echo "You have Python2 image"
    PYTHON=PY2
    CRYPT=python-crypt
else
    echo "[!] Python not found, trying to install..."
    PYTHON=PY3
    CRYPT=python3-crypt
fi

# Determine package manager
if [ -f "$DreamOS" ]; then
    STATUS="$DreamOS"
    OS_TYPE="dream"
    echo "[DreamOS detected]"
else
    STATUS="/var/lib/opkg/status"
    OS_TYPE="opkg"
    echo "[OPKG based system detected]"
fi

# Check for installed packages
missing_pkg=0
echo "Checking required packages..."

# Create list of packages based on OS type and Python version
if [ "$OS_TYPE" = "dream" ]; then
    REQUIRED_PKGS="wget pigz xz flash-scripts python-requests $CRYPT"
else
    if [ "$PYTHON" = "PY3" ]; then
        REQUIRED_PKGS="wget pigz xz python3-twisted-web flash-scripts python3-requests $CRYPT"
    else
        REQUIRED_PKGS="wget pigz xz flash-scripts python-requests $CRYPT"
    fi
fi

for pkg in $REQUIRED_PKGS; do
    if [ "$OS_TYPE" = "dream" ]; then
        if dpkg -l 2>/dev/null | grep -q "^ii.*$pkg "; then
            echo "[✓] $pkg is installed"
        else
            echo "[!] Missing $pkg"
            missing_pkg=1
        fi
    else
        if opkg list-installed 2>/dev/null | grep -q "^$pkg - "; then
            echo "[✓] $pkg is installed"
        elif opkg list-installed 2>/dev/null | grep -q "^$pkg "; then
            echo "[✓] $pkg is installed"
        else
            echo "[!] Missing $pkg"
            missing_pkg=1
        fi
    fi
done

# Install missing packages
if [ "$missing_pkg" = "1" ]; then
    echo "Installing missing packages..."
    if [ "$OS_TYPE" = "dream" ]; then
        dpkg --configure -a
        apt-get update
        apt-get install wget pigz xz bzip2 gzip flash-scripts python-requests $CRYPT -y
    elif [ "$PYTHON" = "PY3" ]; then
        opkg update
        opkg install wget pigz xz bzip2 gzip python3-twisted-web flash-scripts python3-requests $CRYPT
    else
        opkg update
        opkg install wget pigz xz flash-scripts python-requests $CRYPT
    fi
    
    # Check if installation was successful
    if [ $? -ne 0 ]; then
        echo "[!] Failed to install some packages. Trying to continue anyway..."
        sleep 2
    fi
fi

# Remove old versions
echo "Cleaning old versions..."
for dir in /media/ba/backupflashe \
           /usr/lib/enigma2/python/Plugins/Extensions/backupflashe \
           /usr/lib64/enigma2/python/Plugins/Extensions/backupflashe \
           /usr/lib/enigma2/python/Plugins/Extensions/backupflashe2 \
           /usr/lib64/enigma2/python/Plugins/Extensions/backupflashe2 \
           /usr/lib/enigma2/python/Plugins/Extensions/dBackup \
           /usr/lib64/enigma2/python/Plugins/Extensions/dBackup; do
    if [ -d "$dir" ]; then
        echo "Removing: $dir"
        rm -rf "$dir"
    fi
done

# Remove broken symlinks
for link in /usr/lib/enigma2/python/Plugins/Extensions/backupflashe \
            /usr/lib64/enigma2/python/Plugins/Extensions/backupflashe; do
    if [ -L "$link" ]; then
        echo "Removing broken symlink: $link"
        rm -f "$link"
    fi
done

# Download and install new version
echo "Downloading backupflash plugin..."
cd /tmp 2>/dev/null || cd / 2>/dev/null || (echo "Cannot change directory!" && exit 1)

# Try multiple download methods
if command -v wget >/dev/null 2>&1; then
    wget "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz" -O backupflash.tar.gz
elif command -v curl >/dev/null 2>&1; then
    curl -L "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz" -o backupflash.tar.gz
else
    echo "[!] No download tool found! Trying to install wget..."
    if [ "$OS_TYPE" = "dream" ]; then
        apt-get install wget -y
        wget "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz" -O backupflash.tar.gz
    else
        opkg install wget
        wget "https://github.com/emil237/download-plugins/raw/refs/heads/main/backupflash/backupflash.tar.gz" -O backupflash.tar.gz
    fi
fi

# Check if download was successful
if [ ! -f "backupflash.tar.gz" ]; then
    echo "[!] Failed to download backupflash plugin!"
    echo "Trying alternative URL..."
    wget "https://raw.githubusercontent.com/emil237/download-plugins/main/backupflash/backupflash.tar.gz" -O backupflash.tar.gz
fi

if [ ! -f "backupflash.tar.gz" ]; then
    echo "[!] Download failed! Please check your internet connection."
    exit 1
fi

# Extract the archive
echo "Installing backupflash plugin..."
if tar -xzf backupflash.tar.gz -C / 2>/dev/null; then
    echo "[✓] Extraction successful"
else
    echo "[!] Failed to extract. Trying alternative extraction..."
    gzip -d backupflash.tar.gz 2>/dev/null && tar -xf backupflash.tar -C / 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "[!] Extraction failed!"
        rm -f backupflash.tar.gz backupflash.tar 2>/dev/null
        exit 1
    fi
fi

# Save plugin from BA protection
if [ -f "/media/ba/ba.sh" ]; then
    echo "BA protection detected..."
    # Find where the plugin was installed
    for plugin_dir in /usr/lib/enigma2/python/Plugins/Extensions/backupflashe \
                      /usr/lib64/enigma2/python/Plugins/Extensions/backupflashe \
                      /usr/local/lib/enigma2/python/Plugins/Extensions/backupflashe; do
        if [ -d "$plugin_dir" ]; then
            echo "Moving plugin to BA protected area..."
            mv "$plugin_dir" /media/ba/ 2>/dev/null
            # Create symlink back
            if [ -d "/media/ba/backupflashe" ]; then
                ln -sf /media/ba/backupflashe "$(dirname "$plugin_dir")/backupflashe"
            fi
            break
        fi
    done
fi

# Cleanup
rm -f backupflash.tar.gz backupflash.tar 2>/dev/null
sync

# Completion message
echo ""
echo "#########################################################"
echo "#          BackupFlash INSTALLED SUCCESSFULLY           #"
echo "#                 Raed  &  mfaraj57                     #"
echo "#########################################################"
echo "#             Restarting STB in 5 seconds...            #"
echo "#########################################################"
echo ""

# Countdown before restart
echo "Restarting Enigma2 in:"
for i in 5 4 3 2 1
do
    echo "$i..."
    sleep 1
done

# Restart enigma2 forcefully
echo "Restarting enigma2 now..."

# Try multiple restart methods
if command -v systemctl >/dev/null 2>&1; then
    systemctl restart enigma2
elif [ -f "/etc/init.d/enigma2" ]; then
    /etc/init.d/enigma2 restart
elif [ -f "/etc/init.d/enigma" ]; then
    /etc/init.d/enigma restart
else
    # Force kill and restart enigma2
    killall -9 enigma2
    sleep 2
    # Try to restart enigma2
    if [ -f "/usr/bin/enigma2.sh" ]; then
        /usr/bin/enigma2.sh &
    elif [ -f "/usr/bin/enigma2" ]; then
        /usr/bin/enigma2 &
    fi
fi

exit 0


