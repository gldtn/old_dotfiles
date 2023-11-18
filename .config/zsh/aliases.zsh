# alacritty toggle-theme function
tt() { python3 $XDG_CONFIG_HOME/alacritty/toggle-theme.py "$@" }

#kitty
alias st="switch-theme $1"

# CD replacement - Zoxide
## https://github.com/ajeetdsouza/zoxide
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."

# Get macOS Software Updates
alias update="sudo softwareupdate -i -a"

# Source/edit ~/.zshrc
alias s.zsh="source $ZDOTDIR/.zshrc"
alias zshrc="open -a $EDITOR $ZDOTDIR/.zshrc"

# Python
alias python="python3"

# CAT replacement - Bat
## https://github.com/sharkdp/bat
alias cat="bat"

# Find replacement - Fd
## https://github.com/sharkdp/fd
alias find="fd"

# LS replacement - eza
## https://github.com/eza-community/eza
macIgnore=$(<$ZDOTDIR/macignore.zsh)
alias l.='eza -a --git-ignore | egrep "^\."'
alias ls='eza -a --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias ll='eza -alhH --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias tr='eza -alhHT --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Brew
alias brew.lc="brew list --cask"
alias brew.lp="brew list --pinned"
alias brew.lf="brew list --formula"
alias brew.uc="brew update && brew upgrade --cask"
alias brew.uf="brew update && brew upgrade --formula" # or brew outdated | xargs brew install
alias brew.up="brew update && brew outdated && brew upgrade && brew upgrade --cask && brew cleanup"

# YADM/Dotfiles
alias yadm.s="yadm status"
alias yadm.a="yadm add -u" # Stage all modified files at once
alias yadm.c="yadm commit -m" # Commit files
alias yadm.p="yadm push -u origin main:main" # Push
alias yadm.r="yadm pull --rebase origin main" # Rebase
alias yadm.rm="yadm rm --cached" # Remove file from being tracked

# Yabai/SKHD
alias yabai.a="yabai -m query --windows | jq '.[].app'"
alias yabai.t="yabai -m query --windows | jq '.[].title'"
alias skhdrc="$EDITOR $XDG_CONFIG_HOME/skhd/skhdrc"
alias yabairc="$EDITOR $XDG_CONFIG_HOME/yabai/yabairc"
alias yabai.up="$HOME/.config/yabai/./update.sh"

# Alacritty
alias alacritty-new="alacritty msg create-window; open -a Alacritty"
