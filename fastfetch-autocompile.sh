#!/bin/bash

echo "
-----------------------------------------------------------------------------------------------------
       ██╗ █████╗ ██╗  ██╗██╗   ██╗██████╗     ██╗    ██╗██╗███████╗██╗      ██████╗  ██████╗██╗  ██╗
       ██║██╔══██╗██║ ██╔╝██║   ██║██╔══██╗    ██║    ██║██║██╔════╝██║     ██╔═══██╗██╔════╝██║  ██║
       ██║███████║█████╔╝ ██║   ██║██████╔╝    ██║ █╗ ██║██║█████╗  ██║     ██║   ██║██║     ███████║
 ██    ██║██╔══██║██╔═██╗ ██║   ██║██╔══██╗    ██║███╗██║██║██╔══╝  ██║     ██║   ██║██║     ██╔══██║
  ╚█████╔╝██║  ██║██║  ██╗╚██████╔╝██████╔╝    ╚███╔███╔╝██║███████╗███████╗╚██████╔╝╚██████╗██║  ██║
   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
-----------------------------------------------------------------------------------------------------
     			         Automated Fastfetch Compile script
-----------------------------------------------------------------------------------------------------
"

# Permissions ;-) (sudo or not) # Including Bashisms?
if [ "$UID" = 1000 ]; then         
	PRIVILEGES="sudo"
elif [ "${UID}" -ne 0 ]; then 
	PRIVILEGES=""
fi

# Download the newest releases source code in .tar.gz form for the time being.
baseurl="https://github.com/fastfetch-cli/fastfetch/releases"
ver=$(basename "$(curl -w "%{url_effective}\n" -I -L -s -S $baseurl/latest -o /dev/null)")
curl -fL "https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/$ver.tar.gz" -o "fastfetch-$ver.tar.gz"

# Decompressing, Extracting & Changing Directories.
gunzip fastfetch-*.tar.gz
tar -xf fastfetch-*.tar
cd fastfetch-*/

# Download Build-dependencies
if which apt-get &> /dev/null; then
	$PRIVILEGES apt-get update
	$PRIVILEGES apt-get install -y cmake pkg-config build-essential 
else
    echo "Package manager not supported. Please install required programs & dependencies manually."
fi

# Compiling
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
cmake --build build -j$(nproc)

# Installing
$PRIVILEGES cmake --install build

echo "
▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▄ 
▐▌     █  ▐▛▚▖▐▌  █  ▐▌   ▐▌ ▐▌▐▌   ▐▌  █
▐▛▀▀▘  █  ▐▌ ▝▜▌  █   ▝▀▚▖▐▛▀▜▌▐▛▀▀▘▐▌  █
▐▌   ▗▄█▄▖▐▌  ▐▌▗▄█▄▖▗▄▄▞▘▐▌ ▐▌▐▙▄▄▖▐▙▄▄▀
"

# ToDo: 1. Add Build-dependencies
