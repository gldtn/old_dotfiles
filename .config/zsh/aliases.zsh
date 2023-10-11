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

# LS replacement - Exa
## https://github.com/ogham/exa
macIgnore=$(<$ZDOTDIR/macignore.zsh)
alias ls='exa -a --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias ll='exa -alhH --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'
alias tr='exa -alhHT --icons --git --git-ignore -I="$macIgnore" -s=type --color=always'

# Brew
alias blc="brew list --cask"
alias blp="brew list --pinned"
alias blf="brew list --formula"
alias buc="brew update && brew upgrade --cask"
alias buf="brew update && brew upgrade --formula" # or brew outdated | xargs brew install
alias bup="brew update && brew outdated && brew upgrade && brew upgrade --cask && brew cleanup"

# YADM/Dotfiles
alias yadm.a="yadm add" # Add files
alias yadm.s="yadm add -u" # Stage all modified files at once
alias yadm.c="yadm commit -m" # Commit files
alias yadm.p="yadm push -u origin main:main" # Push
alias yadm.r="yadm pull --rebase origin main" # Rebase
alias yadm.rm="yadm rm --cached" # Remove file from being tracked

# Yabai/SKHD
configDIR='$HOME/.config'
alias yapp="yabai -m query --windows | jq '.[].app'"
alias ytitle="yabai -m query --windows | jq '.[].title'"
alias skhdrc="open -a $EDITOR $configDIR/skhd/skhdrc"
alias yabairc="open -a $EDITOR $configDIR/yabai/yabairc"
alias r.sbar="echo Restarting SketchyBar.. && brew services restart sketchybar"
alias upyabai='echo Updating Yabai HEAD.. && $HOME/.config/yabai/./update.sh'