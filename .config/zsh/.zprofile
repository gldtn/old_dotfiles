eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Color scripts 
$HOME/.config/colorscripts/crunchbang.sh

# Environment variables set everywhere
export LANG=en_US.UTF-8
export TERMINAL="kitty"
export TERM="xterm-256color"
export BROWSER="Google Chrome"
export EDITOR="/Applications/Sublime\ Text.app/Contents/MacOS/sublime_text"