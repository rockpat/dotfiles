#!/bin/sh -e

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
        $PRIVILEGES apt-get update
        $PRIVILEGES apt-get install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting tealdeer
    elif which pacman &> /dev/null; then
        $PRIVILEGES pacman -Syu --noconfirm
        $PRIVILEGES pacman -S --noconfirm neovim git curl zsh zoxide bat zsh-syntax-highlighting tealdeer
    elif which dnf &> /dev/null; then
        $PRIVILEGES dnf update
        $PRIVILEGES dnf install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting tealdeer
    elif which xbps-install &> /dev/null; then
        $PRIVILEGES xbps-install -Su
        $PRIVILEGES xbps-install -S neovim git curl zsh zoxide bat zsh-syntax-highlighting tealdeer
    elif which zypper &> /dev/null; then
        $PRIVILEGES zypper refresh
        $PRIVILEGES zypper install -y neovim git curl zsh zoxide bat zsh-syntax-highlighting tealdeer
    elif which brew &> /dev/null; then
        brew update
        brew install neovim zoxide bat fastfetch zsh-syntax-highlighting tealdeer
    else
        echo "Package manager not supported. Please install required programs & dependencies manually."
    fi
}

install_plugins() {
    mkdir -p $HOME/.config/zsh
    curl -sSLo "$HOME/.config/zsh/zsh-autosuggestions.zsh" https://github.com/zsh-users/zsh-autosuggestions/raw/master/zsh-autosuggestions.zsh
    #curl -sSLo "$HOME/.config/zsh/zsh-history-substring-search.zsh" https://github.com/zsh-users/zsh-history-substring-search/raw/master/zsh-history-substring-search.zsh
}

create_symlinks() {
	ln -sf $HOME/Github/dotfiles/.bashrc $HOME/.bashrc
  	ln -sf $HOME/Github/dotfiles/.zshrc $HOME/.zshrc
	mkdir -p $HOME/.config/fastfetch/
	ln -sf $HOME/Github/dotfiles/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
	ln -sf $HOME/Github/dotfiles/.vitetris $HOME/.vitetris
	ln -sf $HOME/Github/dotfiles/btop.conf $HOME/.config/btop/btop.conf
}

install_finish() {
    	# $PRIVILEGES chsh -s $USER /bin/zsh ### This method doesn't work, you have to change the /etc/passwd login shell to zsh
	tldr --update # Cache for tealdeer ;-)
    	echo "Setup completed!"
}


# Where the REAL Magic happens ;-)

case "$(whoami)" in
  root) PRIVILEGES="" ;;
  *) PRIVILEGES="sudo" ;;
esac

install_dependencies
install_plugins
create_symlinks
install_finish

# ToDo: 1. Fix ZSH autosuggestions differant locations, 2. Don't Hardcode directory (for Symlinking), 3. Add Uninstall flag, 4. Add Colours ;-) 
