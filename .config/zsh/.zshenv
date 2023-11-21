# PATH
export PATH="$PATH:${HOME}/.local/bin:${HOME}/bin:${HOME}/.composer/vendor/bin"

# zsh config dir
ZDOTDIR=${HOME}/.config/zsh
export ZSH_COMPDUMP=${ZDOTDIR}/.cache/.zcompdump-$HOST

# XDG Paths
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# Environment variables set everywhere
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export BROWSER="Firefox"
export EDITOR="zed --wait"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS
# Mostly for neofetch
export WM="Yabai $(yabai --version | awk -F'[- ]' '{print $2}')"
export CPU="$(sysctl -n machdep.cpu.brand_string) - $(smctemp -c)c"
export TERMINAL="Alacritty v$(alacritty --version | awk '{print $2}')"
export TERM_FONT=$(grep 'normal.family' ${XDG_CONFIG_HOME}/alacritty/alacritty.toml | awk -F'"' '{print $2}')


### Programs related PATH ###
# eza completions
export FPATH="${HOME}/.config/eza/completions/zsh:$FPATH"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin":$PATH

# Laravel HERD
export PATH="${HOME}/Library/Application Support/Herd/bin/":$PATH
export PHP_INI_SCAN_DIR="${HOME}/Library/Application Support/Herd/config/php/":$PHP_INI_SCAN_DIR
export HERD_PHP_82_INI_SCAN_DIR="${HOME}/Library/Application Support/Herd/config/php/82/"
