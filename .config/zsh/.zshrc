export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# Laravel HERD
export PATH="/Users/gldtn/Library/Application Support/Herd/bin/":$PATH
export PHP_INI_SCAN_DIR="/Users/gldtn/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/gldtn/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/gldtn/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/gldtn/Library/Application Support/Herd/config/php/81/"

# Source configs
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"

# Source end of files configs
source "$ZDOTDIR/userconfig.zsh"
