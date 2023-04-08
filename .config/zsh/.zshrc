export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# Basic configs
source "$HOME/.config/zsh/aliases.zsh"

# History
HISTFILE=$HOME/.config/zsh/.zsh_histfile  # file to save history
HISTSIZE=100000               # history size in-memory
SAVEHIST=1000000              # history size in the file
HISTORY_IGNORE="(ls|ls *|pwd|exit|clear|cd|cd *|..|...|....|.....)"
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME    # append command to history file immediately after execution
#setopt EXTENDED_HISTORY        # record command start time

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
plugins=()

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

# Case Insensitive Tab Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# fzf - Fuzzy finder
[ -f $HOME/.config/zsh/.fzf.zsh ] && source $HOME/.config/zsh/.fzf.zsh

# ZSH plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
