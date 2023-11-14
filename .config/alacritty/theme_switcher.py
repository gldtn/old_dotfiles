#!/usr/bin/env python3

import os
import shutil
import sys

# Get the user's home directory
user_home = os.path.expanduser('~')
theme_directory = os.path.join(user_home, '.config/alacritty/themes')
theme_loader_path = os.path.join(user_home, '.config/alacritty/theme_loader.toml')
alacritty_config = os.path.join(user_home, '.config/alacritty/alacritty.toml')

# Function to switch themes by index or name
def switch_theme(theme_input):
    if theme_input.isdigit():  # If input is a number, treat as index
        index = int(theme_input)
        if 1 <= index <= len(themes):
            theme_name = themes[index - 1]
            apply_theme(theme_name)
        else:
            print("Invalid index.")
    else:  # Treat input as theme name
        if theme_input in themes:
            apply_theme(theme_input)
        else:
            print("Theme not found.")

# Apply the selected theme
def apply_theme(theme_name):
    theme_config = os.path.join(theme_directory, f'{theme_name}.toml')
    shutil.copy(theme_config, theme_loader_path)
    touch_file(alacritty_config)

# Function to list available themes with index
def list_themes():
    global themes
    themes = [f.replace('.toml', '') for f in os.listdir(theme_directory) if f.endswith('.toml')]
    themes.sort()  # Sort themes alphabetically
    print("Available themes:\n      select by index or name")
    for i, theme in enumerate(themes, start=1):
        print(f"{i}. {theme}")

# Function to update alacritty config file
def touch_file(file_path):
    with open(file_path, 'a'):
        os.utime(file_path, None)

def underline_text(text):
    return '\033[4m' + text + '\033[0m'

# Function to display available options
def display_help():
    usage = "Usage: theme_switcher.py [OPTION]"
    options = [
        "-h, --help    : Show available command options",
        "-l, --list    : List available themes",
        "index/name    : Select a theme by index or name"
    ]

    print(f"A simple Alacritty theme switcher written in Python\n")
    print(f"{underline_text('Usage')}: theme_switcher.py [OPTION]\n")
    print(f"{underline_text('Options')}:")
    for option in options:
        print(f"    {option}")

# Check arguments to switch, list themes, or display help
if len(sys.argv) < 2 or sys.argv[1] in ['-h', '--help']:
    display_help()
elif sys.argv[1] in ['-l', '--list']:
    list_themes()
else:
    theme_input = sys.argv[1]
    list_themes()  # Refresh the themes list
    switch_theme(theme_input)
