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
#baseurl="https://github.com/fastfetch-cli/fastfetch/releases"
#ver=$(basename "$(curl -w "%{url_effective}\n" -I -L -s -S $baseurl/latest -o /dev/null)")
#curl -fLO "https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.32.1.tar.gz" 

# Decompressing, Extracting & Changing Directories.
gunzip fastfetch-*.tar.gz
tar -xf fastfetch-*.tar
cd fastfetch-*/

# Download Build-dependancies
if which apt-get &> /dev/null; then
	$PRIVILEGES apt-get update
	$PRIVILEGES apt-get install -y cmake pkg-config build-essential 
else
    echo "Package manager not supported. Please install required programs & dependencies manually."
fi

# Compiling
$PRIVILEGES cmake .
$PRIVILEGES cmake --build . --target fastfetch -j$(nproc)

# Replacing old fastfetch binary & manual page
$PRIVILEGES mv -v fastfetch /usr/bin
$PRIVILEGES mv -v fastfetch.1 /usr/share/man/man1

echo "
▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▄ 
▐▌     █  ▐▛▚▖▐▌  █  ▐▌   ▐▌ ▐▌▐▌   ▐▌  █
▐▛▀▀▘  █  ▐▌ ▝▜▌  █   ▝▀▚▖▐▛▀▜▌▐▛▀▀▘▐▌  █
▐▌   ▗▄█▄▖▐▌  ▐▌▗▄█▄▖▗▄▄▞▘▐▌ ▐▌▐▙▄▄▖▐▙▄▄▀
"

# ToDo: 1. Add Build-dependancies, 2. Download newest Fastfetch source code automaticly
