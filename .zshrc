# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

. ~/.profile

# Path to your oh-my-zsh installation.
export ZSH=/Users/pss/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mitsuhiko"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/Users/pss/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-prompt better-virtualenv transportstatus multirust fzf)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

# bind esc + ,
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey '\e,' copy-earlier-word

# added by travis gem
[ -f /Users/pss/.travis/travis.sh ] && source /Users/pss/.travis/travis.sh
export VOLTA_HOME="/Users/pss/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(direnv hook zsh)"

export HOMEBREW_NO_AUTO_UPDATE=1

source ~/.myprofile

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/pss/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# bun completions
[ -s "/Users/pss/.bun/_bun" ] && source "/Users/pss/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GO_INSTALL="$HOME/go"
export PATH="$GO_INSTALL/bin:$PATH"


if type eza > /dev/null; then
  alias ls="eza"  
  alias ll="eza -l"  
  alias la="eza -la"  
fi

alias lg="lazygit"
if type nvim > /dev/null; then
  alias vim="nvim"
fi

# bat
if type bat > /dev/null; then
  export BAT_THEME="TwoDark"
  alias cat="bat"
fi

# zoxide
eval "$(zoxide init zsh)"
