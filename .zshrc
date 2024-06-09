# History + Vim Keybindings
HISTFILE=~/.zsh_history
HISTSIZE=4444
SAVEHIST=4444
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
alias ll='ls -lh'
alias la='ls -a'
alias bat='batcat'

# Plugins
source ~/.config/.zsh/plugins/zsh-autosuggestions.zsh
#source ~/.config/.zsh/plugins/zsh-syntax-highlighting.plugin.zsh
