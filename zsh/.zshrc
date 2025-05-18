zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)


source $ZSH/oh-my-zsh.sh
eval "$(oh-my-posh init zsh --config "/home/idriss/dotfiles/zsh/zen.toml")"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice wait"0" silent
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait"0" silent
zinit light zsh-users/zsh-completions

zinit ice wait"0" silent
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" silent
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
# zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit -C

zinit cdreplay -q

# Keybindings
# bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zcompcache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='lsd --color=auto'
alias l='lsd -l'
alias ll='lsd -la --color=auto'
alias c='clear'
alias v='nvim'
alias venv='source .venv/bin/activate'
alias conda='micromamba'
alias ff='fastfetch --logo ~/dotfiles/fastfetch/logo.txt'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Load Angular CLI autocompletion.
# source <(ng completion script)

# Created by `pipx` on 2024-09-07 12:49:59
export PATH="$PATH:/home/idriss/.local/bin"

# For GoLang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Zathura inverse search config
# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/usr/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/idriss/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
