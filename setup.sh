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
 				      Dotfiles Installation Script
-----------------------------------------------------------------------------------------------------
"

install_dependencies() {
    if which apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting
    elif which pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm neovim git curl zsh zoxide bat zsh-syntax-highlighting
    elif which dnf &> /dev/null; then
        sudo dnf install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting
    elif which xbps-install &> /dev/null; then
        sudo xbps-install -S neovim git curl zsh zoxide bat zsh-syntax-highlighting
    elif which zypper &> /dev/null; then
        sudo zypper refresh
        sudo zypper install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting
    elif which brew &> /dev/null; then
        brew update
        brew install neovim zoxide bat fastfetch zsh-syntax-highlighting
    else
        echo "Package manager not supported. Please install required programs & dependencies manually."
    fi
}

install_plugins() {
	mkdir $HOME/.config/zsh
	curl -sSLo "$HOME/.config/zsh/zsh-autosuggestions.zsh" https://github.com/zsh-users/zsh-autosuggestions/raw/master/zsh-autosuggestions.zsh
}

create_symlinks() {
	ln -s $HOME/Github/dotfiles/.bashrc $HOME/.bashrc
	ln -s $HOME/Github/dotfiles/.zshrc $HOME/.zshrc
	mkdir $HOME/.config/fastfetch/
	ln -s $HOME/Github/dotfiles/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
	ln -s $HOME/Github/dotfiles/.vitetris $HOME/.vitetris
}

# Main script execution
install_dependencies
install_plugins
create_symlinks

echo "Setup completed!"

# ToDo: 1. Don't Hardcode directory (for Symlinking), 2. Add Uninstall flag, 3. Add Colours ;-) 
