export ZSH="/home/nico/.oh-my-zsh"

export DENO_INSTALL="/home/nico/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/home/nico/.local/bin:$PATH"
export PATH="/home/nico/.yarn/bin:$PATH"

# Set default editor
export EDITOR="/usr/bin/nvim"

# Zsh theme and plugins definition
ZSH_THEME="custom-alanpeabody"
plugins=(git)

# Source oh-my-zsh config
source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"

# Custom shortcuts and functions
c() {
    clear
}
zshrc() {
    $EDITOR $HOME/.zshrc
}

# Enable vi bindings
bindkey -v

# Enable history search with up and down arrows for vi bindings
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end

# Enable CTRL+Backspace to delete the last word
bindkey '^H' backward-kill-word
