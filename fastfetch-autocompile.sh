#!/bin/sh

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

# Download the newest releases source code in .tar.gz form for the time being.

# Decompressing, Extracting & Changing Directories.
gunzip fastfetch-*.tar.gz
tar -xf fastfetch-*.tar
cd fastfetch-*/

# Download Build-dependancies
if which apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y cmake 
else
    echo "Package manager not supported. Please install required programs & dependencies manually."
fi

# Compiling
sudo cmake .
sudo cmake --build . --target fastfetch -j$(nproc)

# Replacing old fastfetch binary & man-page
sudo mv fastfetch /usr/bin
sudo mv fastfetch.1 /usr/share/man/man1

echo "Finished :-)"

# ToDo: 1. Add Build-dependancies, 2. Download newest Fastfetch source code automaticly
