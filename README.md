```
M"""""`'"""`YM             M""""""'YMM            dP   .8888b oo dP                   
M  mm.  mm.  M             M  mmmm. `M            88   88   "    88                   
M  MMM  MMM  M dP    dP    M  MMMMM  M .d8888b. d8888P 88aaa  dP 88 .d8888b. .d8888b. 
M  MMM  MMM  M 88    88    M  MMMMM  M 88'  `88   88   88     88 88 88ooood8 Y8ooooo. 
M  MMM  MMM  M 88.  .88    M  MMMM' .M 88.  .88   88   88     88 88 88.  ...       88 
M  MMM  MMM  M `8888P88    M       .MM `88888P'   dP   dP     dP dP `88888P' `88888P' 
MMMMMMMMMMMMMM      .88    MMMMMMMMMMM                                                
                d8888P                                                                
```

**An automated symlink script is included!** *Though for the time being it's Hardcoded to be located & run from `$HOME/Github/dotfiles`!*
It's installing the needed programs & dependencies in a Unix & Linux Distro-agnostic way, btw.

**Currently Supported Operating Systems:** 
- Linux: *Debian, Arch, Fedora, OpenSUSE, Voidlinux & all there derivatives.*
- MacOS: *with BREW installed.*
- BSD's: *Full support comming soon. (Symlinks work, but packages need to be installed manually)*

*Note: If you're running Gentoo or any other Linux Distobution with a differant package-manager & know the packages, feel free to contribute.*

This Repository stores my dotfiles & some random scripts I use often like the Fastfetch Autocompile one :-)
But other than that, I don't have anything of value to add besides that automation & scripts are BASED.

## Installation

Just run this:

```sh
git clone https://github.com/rockpat/dotfiles.git ~/Github/dotfiles
cd ~/Github/dotfiles
./setup.sh
```

**Btw, you might need to install git and/or create $HOME/Github/dotfiles directory before!**

## Documentation

- .bashrc                   -   My almost Unmodified .bashrc
- .zshrc                    -   My simple but powerful .zshrc config that I use
- .vitetris                 -   My 2Player vitetris config
- setup.sh                  -   My script to Automatically setup the Dotfiles
- config.jsonc              -   My (basic) fastfetch config
- fastfetch-autocompile.sh  -   A little script to make compiling fastfetch much easier
- /ventoy                   -   A Drop in Black-Ventoy Grub-theme
