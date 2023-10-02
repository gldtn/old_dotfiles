#! /bin/bash

# scripting-addition; update sudoers file
function suyabai () {
    SHA256=$(shasum -a 256 $(which yabai) | awk "{print \$1;}")
    if [ -f "/private/etc/sudoers.d/yabai" ]; then
        sudo sed -i '' -e 's/sha256:[[:alnum:]]*/sha256:'${SHA256}'/' /private/etc/sudoers.d/yabai
        echo "sudoers > yabai > sha256 hash added"
    else
        echo "sudoers file does not exist yet"
    fi
}

# the update script
export YABAI_CERT=yabai-cert   
yabai --stop-service 
brew reinstall koekeishiya/formulae/yabai
codesign -fs "${YABAI_CERT:-yabai-cert}" "$(brew --prefix yabai)/bin/yabai"
suyabai
yabai --start-service