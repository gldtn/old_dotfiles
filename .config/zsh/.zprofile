# Homebrew stuff
eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Environment variables set everywhere
export LANG=en_US.UTF-8
export TERMINAL="kitty"
export TERM="xterm-256color"
export BROWSER="Firefox"
export EDITOR="zed --wait"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS

# Set current theme for kitty
# current_theme=$(awk '$1=="include" {print $2}' "$HOME/.config/kitty/kitty.conf")
# kitty @ set-colors --all --configured "$HOME/.config/kitty/themes/$current_theme"
# Color scripts
$HOME/.config/colorscripts/crunchbang.sh

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
