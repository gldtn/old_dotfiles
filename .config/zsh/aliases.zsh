# CD replacement - Zoxide
## https://github.com/ajeetdsouza/zoxide
alias cd=z

# CAT replacement - Bat
## https://github.com/sharkdp/bat
alias cat=bat

# Find replacement - Fd
## https://github.com/sharkdp/fd
alias find=fd

# Navigation
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."

# Get macOS Software Updates
alias update="sudo softwareupdate -i -a"

# Source/edit ~/.zshrc
alias s.zsh="echo ZSH is being sourced.. && source $ZDOTDIR/.zshrc"
alias zshrc="open -a $EDITOR $ZDOTDIR/.zshrc"

# LS replacement - Exa
## https://github.com/ogham/exa
ignoreOS=".DS_Store|.localized|.CFUserTextEncoding";
alias ls='exa -a --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'
alias ll='exa -alhH --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'
alias tr='exa -alhHT --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'

# Brew
alias bup="brew update && brew outdated && brew upgrade && brew cleanup"
alias blc="brew list --cask"
alias buc="brew update && brew upgrade --cask"
alias blf="brew list --formula"
alias buf="brew update && brew upgrade --formula" # or brew outdated | xargs brew install

# YADM/Dotfiles
alias yadm.a="yadm add -u" # Stage all modified files at once
alias yadm.c="yadm commit -m" # Commit files
alias yadm.p="yadm push -u origin main:main" # Push
alias yadm.r="yadm pull --rebase origin main" # Rebase
alias yadm.rm="yadm rm --cached" # Remove file from being tracked

# Git Aliases
# alias add="git add"
# alias commit="git commit"
# alias pull="git pull"
# alias stat="git status"
# alias gdiff="git diff HEAD"
# alias vdiff="git difftool HEAD"
# alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# alias push="git push"
# alias g="lazygit"

# Yabai/SKHD
alias yapp="yabai -m query --windows | jq '.[].app'"
alias ytitle="yabai -m query --windows | jq '.[].title'"
alias skhdrc="open -a $EDITOR $HOME/.config/skhd/skhdrc"
alias yabairc="open -a $EDITOR $HOME/.config/yabai/yabairc"
alias r.yabai="echo Restarting Yabai.. && brew services restart yabai"
alias r.sbar="echo Restarting SketchyBar.. && brew services restart sketchybar"

# Python
alias python="python3"