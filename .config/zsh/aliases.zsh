# My config dir
configDIR='$HOME/.config'

# alacritty toggle-theme function
toggle-theme() {
    python3 $HOME/.config/alacritty/toggle-theme.py "$@"
}
# toggle-theme short alias
alias tt="toggle-theme"

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
alias s.zsh="echo ZSH is being sourced.. && source $ZDOTDIR/.zshrc"
alias zshrc="open -a $EDITOR $ZDOTDIR/.zshrc"

# Server -> Kitana
alias kitana="ssh gldtn@170.187.162.31"
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
alias ls='eza -a --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias ll='eza -alhH --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias tr='eza -alhHT --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'

# Brew
alias blc="brew list --cask"
alias blp="brew list --pinned"
alias blf="brew list --formula"
alias buc="brew update && brew upgrade --cask"
alias buf="brew update && brew upgrade --formula" # or brew outdated | xargs brew install
alias bup="brew update && brew outdated && brew upgrade && brew upgrade --cask && brew cleanup"

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
alias skhdrc="open -a $EDITOR $configDIR/skhd/skhdrc"
alias yabairc="open -a $EDITOR $configDIR/yabai/yabairc"
alias yabai.up='echo Updating Yabai HEAD.. && $HOME/.config/yabai/./update.sh'
