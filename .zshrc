#-----------------------------------------------------------------------------------------------------
#       ██╗ █████╗ ██╗  ██╗██╗   ██╗██████╗     ██╗    ██╗██╗███████╗██╗      ██████╗  ██████╗██╗  ██╗
#       ██║██╔══██╗██║ ██╔╝██║   ██║██╔══██╗    ██║    ██║██║██╔════╝██║     ██╔═══██╗██╔════╝██║  ██║
#       ██║███████║█████╔╝ ██║   ██║██████╔╝    ██║ █╗ ██║██║█████╗  ██║     ██║   ██║██║     ███████║
# ██    ██║██╔══██║██╔═██╗ ██║   ██║██╔══██╗    ██║███╗██║██║██╔══╝  ██║     ██║   ██║██║     ██╔══██║
#  ╚█████╔╝██║  ██║██║  ██╗╚██████╔╝██████╔╝    ╚███╔███╔╝██║███████╗███████╗╚██████╔╝╚██████╗██║  ██║
#   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝      ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
#-----------------------------------------------------------------------------------------------------
# 						.zshrc
#-----------------------------------------------------------------------------------------------------

# History + Vim Keybindings
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=99999
bindkey -v

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	# Include hidden files

# PS1 / Terminal promt
PS1=$'\033[36m%n\033[m@\033[32m%m:\033[33;1m%~\033[m\$ '

# Alias
alias ls='ls --color=auto'
alias ll='ls -lhA'
alias la='ls -A'
alias cp="cp -i"
alias bat='batcat'

# Editors / Export
export VISUAL=vim
export EDITOR="$VISUAL"
export MANPAGER="nvim +Man!"

# Plugins
source ~/.config/zsh/zsh-autosuggestions.zsh
#source ~/.config/zsh/zsh-syntax-highlighting.plugin.zsh

# Zoxide initialation (ZSH because this is a .zshrc config)
eval "$(zoxide init zsh)"
