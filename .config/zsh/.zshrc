export PATH=$PATH:$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH

# Source configs
source "$ZDOTDIR/userconfig.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"

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
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh
