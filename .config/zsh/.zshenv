# PATH
export PATH="$PATH:${HOME}/.local/bin:${HOME}/bin:${HOME}/.composer/vendor/bin"

# zsh config dir
export ZDOTDIR=${HOME}/.config/zsh
export ZSH_COMPDUMP=${ZDOTDIR:-$HOME}/.cache/.zcompdump

# XDG Paths
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# Environment variables set everywhere
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export BROWSER="Firefox"
export EDITOR="zed --wait"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS

### Programs related PATH ###

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin":$PATH

# Laravel HERD
export PATH="${HOME}/Library/Application Support/Herd/bin/":$PATH
export PHP_INI_SCAN_DIR="${HOME}/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export HERD_PHP_82_INI_SCAN_DIR="${HOME}/Library/Application Support/Herd/config/php/82/"
