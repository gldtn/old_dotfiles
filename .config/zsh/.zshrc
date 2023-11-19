# Source configs
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/histconf.zsh"

# Add .zsh_functions to path
autoload -Uz compinit && compinit
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Explicitly source all files in .zsh_functions
for file in "${ZDOTDIR:-~}"/.zsh_functions/*(.); do
    source "$file"
done

# fzf - Fuzzy finder
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

# Case Insensitive Tab Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

## Load zoxide
eval "$(zoxide init zsh)"

## Load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
