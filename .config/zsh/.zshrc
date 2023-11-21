# Source configs
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/histconf.zsh"

# Add custom functions directory to fpath
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Load and initialize the Zsh completion system
autoload -Uz compinit && compinit

### THESE MUST BE PLACED AFTER 'compinit' ###

# Explicitly source all files in .zsh_functions
for file in "${ZDOTDIR:-~}"/.zsh_functions/*(.); do
    source "$file"
done

# Case Insensitive Tab Completion (must be placed after 'autload -Uz')
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Load zoxide
# https://github.com/ajeetdsouza/zoxide
export _ZO_FZF_OPTS='1' # must be set before eval
eval "$(zoxide init zsh)"

### END: THESE MUST BE PLACED AFTER 'autload -Uz' ###

# fzf - Fuzzy finder
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

## Load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
