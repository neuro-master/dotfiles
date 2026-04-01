# Interactive Shell Config


# Zsh History Config
HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Other Application Histories
export LESSHISTFILE="$XDG_STATE_HOME/less/less_history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/python_history"

# Completion System
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Basic shell options
unsetopt beep
unsetopt autocd extendedglob notify
bindkey -v

# Custom aliases
alias ls='ls -v --color=auto'
alias ll='ls -vlah --color=auto'
alias la='ls -vA --color=auto'
alias view='feh -FZRq -d -B black'
alias battery='cat /sys/class/power_supply/BAT*/{capacity,status}'

# Prompt
autoload -Uz promptinit
promptinit
prompt walters
