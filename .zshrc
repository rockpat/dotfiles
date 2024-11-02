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
alias tree='tree -C'
alias ls='ls --color=auto'
alias ll='ls -lhA'
alias la='ls -A'
alias cp="cp -i"
alias bat='batcat'

# Editors / Exports / Paths
export VISUAL=vim
export EDITOR="$VISUAL"
export MANPAGER="nvim +Man!"
export PATH="$HOME/.local/bin:$PATH"

# Plugins
source ~/.config/zsh/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide initialation (ZSH because this is a .zshrc config)
eval "$(zoxide init zsh)"

# ToDo: 1. Make autocompletion better, 2. Add Git Info (branch) to Prompt & 3. Get zsh-syntax-highlighting to work cross-platform.
# 3. Arch Path: /usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh, Brew Path: $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh, Debian Path: /|\
