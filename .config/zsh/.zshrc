# Configs files
files=(
    "aliases.zsh"
    "plugins.zsh"
    "histconf.zsh"
)

# Source configs files
for file in "${files[@]}"; do
    full_path="${ZDOTDIR:-~}/rc/${file}"
    if [[ -r "$full_path" ]]; then
        . "$full_path"
    fi
done

# Mostly for neofetch
export WM="Yabai $(yabai --version | awk -F'[- ]' '{print $2}')"
export CPU="$(sysctl -n machdep.cpu.brand_string) - $(smctemp -c)c"
export TERMINAL="Kitty v$(kitty --version | awk '{print $2}')"
export TERM_FONT=$(awk '/font_family/ {print $2}' "${XDG_CONFIG_HOME}/kitty/kitty.conf")

# Add custom functions directory to fpath
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Load and initialize the Zsh completion system
autoload -Uz compinit && compinit -d "${ZDOTDIR:-$HOME}/.cache/.zcompdump"

### THESE MUST BE PLACED AFTER 'compinit' ###

# Explicitly source all files in .zsh_functions
for file in "${ZDOTDIR:-~}"/.zsh_functions/*(.); do
    source "$file"
done

# Case Insensitive Tab Completion (must be placed after 'autload -Uz')
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Load zoxide
# https://github.com/ajeetdsouza/zoxide
export _ZO_FZF_OPTS='1' # must be set before eval
eval "$(zoxide init zsh)"

# eza completions
export FPATH="${HOME}/.config/eza/completions/zsh:$FPATH"

### END: THESE MUST BE PLACED AFTER 'autload -Uz' ###

# fzf - Fuzzy finder
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

## Load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
