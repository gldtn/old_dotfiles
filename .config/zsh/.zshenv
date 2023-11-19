# zsh config dir
ZDOTDIR=${HOME}/.config/zsh
export ZSH_COMPDUMP=${HOME}/.cache/zsh/.zcompdump-$HOST

# XDG Paths
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# Environment variables set everywhere
export LANG=en_US.UTF-8
export TERMINAL="Alacritty"
export TERM="xterm-256color"
export BROWSER="Firefox"
export EDITOR="zed --wait"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS
