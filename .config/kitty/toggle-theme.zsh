#!/bin/zsh

toggle-theme() {
    # Retrieve the currently set theme in the kitty config file
    current_theme=$(awk '$1=="include" {print $2}' "$HOME/.config/kitty/kitty.conf")

    # Theme names
    theme_names=(
        "nord"
        "dracula"
        "kanagawa"
        "embark-theme"
        "rose-pine-moon"
        "tokyonight-night"
        "catppuccin-mocha"
        "monokai-pro-spectrum"
    )

    # Theme files, aligned by index with theme_names
    theme_files=(
        "themes/nord.conf"
        "themes/dracula.conf"
        "themes/kanagawa.conf"
        "themes/embark-theme.conf"
        "themes/rose-pine-moon.conf"
        "themes/tokyonight-night.conf"
        "themes/catppuccin-mocha.conf"
        "themes/monokai-pro-spectrum.conf"
    )

    # Display usage instructions when -h or --help is used
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Toggle theme v1.0 create by gldtn - https://github.com/gldtn"
        echo ""
        echo "Usage:"
        echo "'toggle-theme list' - List all available themes with their specific index"
        echo "'toggle-theme index' - Change theme to specific index, i.e > toggle-theme 3"
        echo "'toggle-theme random' - Change to a random theme specified in your toggle-theme.zsh"
        return
    fi

    # List themes
    if [ "$1" = "list" ]; then
        for ((index = 1; index <= ${#theme_names[@]}; index++)); do
            echo "$index: ${theme_names[index]} - ${theme_files[index]}"
        done
        return
    fi

    if [ "$1" = "random" ]; then
        # Select a random index within the range of available themes
        index=$(( RANDOM % ${#themes} + 1 ))
        # If the randomly selected theme matches the current theme, switch to the next theme
        if [ "$current_theme" = "${themes[index]}" ]; then
            index=$(( (index % ${#themes}) + 1 ))  # Change to the next theme
        fi
    elif [ -n "$1" ] && [ "$1" -ge 1 ] && [ "$1" -le ${#themes} ]; then
        # Use the provided index if it's valid
        index=$1
    else
        # Display usage instructions for invalid selections
        echo "Usage:" 
        echo "'toggle-theme list'"
        echo "'toggle-theme index'"
        echo "'toggle-theme random'"
        return
    fi

    new_theme="${themes[index]}"  # Set the new theme based on the selected index

    if ! grep -q "^include" "$HOME/.config/kitty/kitty.conf"; then
        # Check if the 'include' directive exists in the kitty config file
        echo "include directive not found in kitty.conf."
        return
    fi

    result=$(kitty @ set-colors --all --configured "$HOME/.config/kitty/$new_theme" 2>&1)
    if [[ $result == "Error"* ]]; then
        # Report any errors encountered while setting the theme
        echo "Error applying the theme: $result"
    else
        # Apply the new theme and update the kitty config file
        sed -i '' -e "s|include.*|include $new_theme|" "$HOME/.config/kitty/kitty.conf"
        echo "Successfully applied $new_theme"
    fi
}