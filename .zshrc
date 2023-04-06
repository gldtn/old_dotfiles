export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH
export EDITOR="/Applications/Sublime\ Text.app/Contents/MacOS/sublime_text"
export LANG=en_US.UTF-8

# Auto completion
## add zsh/site-functions path into FPATH
#FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
if type brew &>/dev/null; then
     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

     autoload -Uz compinit
     compinit
    fi

# Starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Plugins
plugins=(git)

# source antidote
#source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
#antidote load

# History
HISTFILE=$HOME/.zsh_histfile	# file to save history
HISTSIZE=100000             	# history size in-memory
SAVEHIST=1000000           		# history size in the file
HISTORY_IGNORE="(ls|ls *|pwd|exit|clear|cd|cd *|..|...|....|.....)"

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  		# do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  			# do not save duplicated command
setopt HIST_REDUCE_BLANKS  			# remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  	# append command to history file immediately after execution
#setopt EXTENDED_HISTORY  			# record command start time

#function zshaddhistory() {
#  emulate -L zsh
#  ## uncomment if HISTORY_IGNORE
#  ## should use EXTENDED_GLOB syntax
#  setopt extendedglob
#  [[ $1 != ${~HISTORY_IGNORE} ]]
#}

# clear with fastfetch
#alias clear="clear && fastfetch"

# CD replacement - Zoxide
## https://github.com/ajeetdsouza/zoxide
alias cd=z

# CAT replacement - Bat
## https://github.com/sharkdp/bat
alias cat=bat

# Find replacement - Fd
## https://github.com/sharkdp/fd
alias find=fd

# LS replacement - Exa
## https://github.com/ogham/exa
ignoreOS=".DS_Store|.localized|.CFUserTextEncoding";
alias ls='exa -a --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'
alias ll='exa -alhH --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'
alias tr='exa -alhHT --icons --git --git-ignore -I="$ignoreOS" -s=type --color=always'

# Source/edit ~/.zshrc
alias s.zsh="source $HOME/.zshrc; clear"
alias e.zsh="open -a $EDITOR $HOME/.zshrc"

# Navigation
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."

# Get macOS Software Updates, update installed Homebrew and their installed packages
alias update="sudo softwareupdate -i -a"

# Brew
alias bup="brew update && brew outdated && brew upgrade && brew cleanup"
alias blc="brew list --cask"
alias buc="brew update && brew upgrade --cask"
alias blf="brew list --formula"
alias buf="brew update && brew upgrade --formula"

# Bare Git Repo 
REPO="https://github.com/gldtn/dotfiles"
DOTFILES="$HOME/.dotfiles"

alias dtf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# dotfiles () {
#   git --git-dir="$DOTFILES" --work-tree="$HOME" "$@"
# }

# Git Aliases
alias add="git add"
alias commit="git commit"
alias pull="git pull"
alias stat="git status"
alias gdiff="git diff HEAD"
alias vdiff="git difftool HEAD"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cfg="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias push="git push"
alias g="lazygit"

# Yabai/SKHD
alias e.skhd="open -a $EDITOR $HOME/.config/skhd/skhdrc"
alias e.yabai="open -a $EDITOR $HOME/.config/yabai/yabairc"
alias yapp="yabai -m query --windows | jq '.[].app'"
alias r.yabai="echo Restarting Yabai.. && brew services restart yabai"
alias r.sbar="echo Restarting SketchyBar.. && brew services restart sketchybar"

# Update sha256 hash for scripting edition
function suyabai () {
  SHA256=$(shasum -a 256 $(which yabai) | awk "{print \$1;}")
  if [ -f "/private/etc/sudoers.d/yabai" ]; then
    sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
    echo "sudoers > yabai > sha256 hash added"
  else
    echo "sudoers file does not exist yet"
  fi
}

# Python
alias python="python3"

# fzf (Auto inserted)
##
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
