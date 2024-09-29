#!/bin/bash

#-----------------------------------------------------------------------------------------------------
#       ██╗ █████╗ ██╗  ██╗██╗   ██╗██████╗     ██╗    ██╗██╗███████╗██╗      ██████╗  ██████╗██╗  ██╗
#       ██║██╔══██╗██║ ██╔╝██║   ██║██╔══██╗    ██║    ██║██║██╔════╝██║     ██╔═══██╗██╔════╝██║  ██║
#       ██║███████║█████╔╝ ██║   ██║██████╔╝    ██║ █╗ ██║██║█████╗  ██║     ██║   ██║██║     ███████║
# ██    ██║██╔══██║██╔═██╗ ██║   ██║██╔══██╗    ██║███╗██║██║██╔══╝  ██║     ██║   ██║██║     ██╔══██║
#  ╚█████╔╝██║  ██║██║  ██╗╚██████╔╝██████╔╝    ╚███╔███╔╝██║███████╗███████╗╚██████╔╝╚██████╗██║  ██║
#   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
#-----------------------------------------------------------------------------------------------------
# 					Dotfiles Install Script
#-----------------------------------------------------------------------------------------------------

# Function to install required dependencies & programs
install_dependencies() {
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y neovim git zsh zoxide bat
    elif command -v pacman &> /dev/null; then
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm neovim git zsh zoxide bat
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y neovim git zsh zoxide bat
    elif command -v xbps-install &> /dev/null; then
        sudo xbps-install -S neovim git zsh zoxide bat
    elif command -v brew &> /dev/null; then
        brew update
        brew install neovim git zoxide bat
    else
        echo "Package manager not found. Please install required programs & dependencies manually."
    fi
}

# Function to create symlinks
create_symlinks() {
	# ZSH Shell Setup
	ln -s $HOME/Github/dotfiles/.zshrc $HOME/.zshrc

	# Just Symlinks (Fastfetch, ViTetris, etc)
	ln -s $HOME/Github/dotfiles/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
	ln -s $HOME/Github/dotfiles/.vitetris $HOME/.vitetris
}

# Main script execution
install_dependencies
create_symlinks

echo "Setup completed!"

# ToDo: add ZSH Plugins! Don't Hardcoded directory (for Symlinking)
