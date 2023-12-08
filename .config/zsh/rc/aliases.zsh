# alacritty toggle-theme function
tat() { python3 ${XDG_CONFIG_HOME}/alacritty/toggle-theme.py "$@" }

#kitty
tkt() { python3 ${XDG_CONFIG_HOME}/kitty/toggle-kitty-theme.py "$@" }

# CD replacement - Zoxide
## https://github.com/ajeetdsouza/zoxide
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."

# Get macOS Software Updates
alias update="sudo softwareupdate -i -a"

# path manipulation
alias :lp="/usr/libexec/path_helper" # list path
alias :le="printenv" # list set environment

# Python
alias python="python3"

# browser-sync
alias :bs="browser-sync start --config bs-config.js"

# CAT replacement - Bat
## https://github.com/sharkdp/bat
alias cat="bat"

# Find replacement - Fd
## https://github.com/sharkdp/fd
alias find="fd"

# LS replacement - eza
## https://github.com/eza-community/eza
ezargs="--icons --git-ignore -I='$(awk '{$1=$1} NF{printf "%s|", $0}' "${ZDOTDIR}/.ezaignore" | sed 's/|$//')' --group-directories-first"

alias ls="eza -alh $ezargs" # all files and dirs; long format/grid
alias la="eza -a $ezargs" # all files and dirs
alias tr="eza -aT $ezargs" # tree listing
alias ll='eza -ld .* | grep "^l"' # list links
alias l.='eza -a --git-ignore | egrep "^\."'


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

# zsh manipulation
alias :ez="${EDITOR} \${ZDOTDIR}"
alias :sz="source \${ZDOTDIR}/.zshrc"
alias :ea="cat \${ZDOTDIR}/rc/aliases.zsh"
alias :sa="source \${ZDOTDIR}/rc/aliases.zsh"

# YADM/Dotfiles
alias :yast="yadm status"
alias :yadd="yadm add $@"
alias :yadda="yadm add -u" # Stage all
alias :yaco="yadm commit -m" # Commit files
alias :yarm="yadm rm --cached" # Remove file
alias :yapu="yadm push -u origin main:main" # Push
alias :yare="yadm pull --rebase origin main" # Rebase

# Yabai/SKHD
alias :eya="${EDITOR} \${XDG_CONFIG_HOME}/yabai"
alias :uya="${XDG_CONFIG_HOME}/yabai/./update.sh"
alias :esk="${EDITOR} \${XDG_CONFIG_HOME}/skhd/skhdrc"
alias :yaapp="yabai -m query --windows | jq '.[].app'"
alias :yatitle="yabai -m query --windows | jq '.[].title'"

# Jankyborders
alias r.borders="brew services restart felixkratz/formulae/borders"

# Alacritty
alias alacritty-new='alacritty msg create-window; open -a Alacritty'
