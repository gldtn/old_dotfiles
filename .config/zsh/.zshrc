export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# Source configs
source "$ZDOTDIR/userconfig.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"

# Case Insensitive Tab Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# fzf - Fuzzy finder
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh
