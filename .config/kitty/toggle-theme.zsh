#!/bin/zsh
## kitty toggle-theme
### https://github.com/gldtn

toggle-theme() {

    name="kitty toggle-theme"
    version="1.1"
    owner="gldtn - https://github.com/gldtn"

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

    # Theme files
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
        echo -e "\e[1m$name\e[0m - \e[96m$version\e[0m"
        echo ""
        echo -e "\e[1mUsage:\e[0m \e[92mtoggle-theme command\e[0m"
        echo -e "\e[92m#\e[0m               - Change theme to a specific index, i.e. > \e[92mtoggle-theme 3\e[0m"
        echo -e "\e[92m-r --random\e[0m     - Change to a random theme specified in your toggle-theme.zsh"
        echo -e "\e[92m-l --list\e[0m       - List all available themes with their specific index"
        echo ""
        echo "To add a theme, edit toggle-theme.zsh and add your theme to a new line under theme_names & theme_files"
        return
    fi

    # List themes
    if [ "$1" = "-l" ] || [ "$1" = "--list" ]; then
        for ((index = 1; index <= ${#theme_names[@]}; index++)); do
            echo "\e[92m$index\e[0m : \e[96m${theme_names[index]}\e[0m - \e[94m${theme_files[index]}\e[0m"
        done
        return
    fi

    if [ "$1" = "-r" ] || [ "$1" = "--random" ]; then
        # Select a random index within the range of available themes
        index=$(( RANDOM % ${#theme_files} + 1 ))
        # If the randomly selected theme matches the current theme, switch to the next theme
        if [ "$current_theme" = "${themes[index]}" ]; then
            index=$(( (index % ${#theme_files}) + 1 ))  # Change to the next theme
        fi
    elif [ -n "$1" ] && [ "$1" -ge 1 ] && [ "$1" -le ${#theme_files} ]; then
        # Use the provided index if it's valid
        index=$1
    else
        # Display usage instructions for invalid selections
        echo "Usage:" 
        echo "'\e[92mtoggle-theme index\e[0m'"
        echo "'\e[92mtoggle-theme --help\e[0m'"
        echo "'\e[92mtoggle-theme --list\e[0m'"
        echo "'\e[92mtoggle-theme --random\e[0m'"
        return
    fi

    new_theme="${theme_files[index]}"  # Set the new theme based on the selected index

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