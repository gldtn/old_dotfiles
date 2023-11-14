# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# eza completions
export FPATH="$HOME/.config/eza/completions/zsh:$FPATH"

# Laravel HERD
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"

# Source configs
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"

# Source end of files configs
source "$ZDOTDIR/userconfig.zsh"
fpath+=${ZDOTDIR:-~}/.zsh_functions
