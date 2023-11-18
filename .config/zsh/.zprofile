# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Color scripts
$XDG_CONFIG_HOME/colorscripts/crunchbang.sh

# Source files
. "$HOME/.cargo/env"

# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# eza completions
export FPATH="$HOME/.config/eza/completions/zsh:$FPATH"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin":$PATH

# Laravel HERD
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"
