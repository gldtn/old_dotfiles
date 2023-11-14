#!/usr/bin/env python3

### Toggle-theme v1.0 by gldtn
## You may need to create an empty theme_loader.toml file to alacritty folder
## https://github.com/gldtn/dotfiles/tree/main/.config/alacritty

import os
import shutil
import sys
import random

# ANSI color
COLORS = {
    'RED': '\033[91m',
    'GREEN': '\033[92m',
    'CYAN': '\033[96m',
    'BOLD': '\033[1m',
    'RESET': '\033[0m',
}

# Global variables
script_name = os.path.basename(sys.argv[0]).replace('.py', '')
usage = f"{COLORS['RED']}Usage{COLORS['RESET']}: {script_name} [{COLORS['CYAN']}OPTION{COLORS['RESET']}]\n"

# Get the user's home directory
user_home = os.path.expanduser('~')
theme_directory = os.path.join(user_home, '.config/alacritty/themes')
theme_loader_path = os.path.join(user_home, '.config/alacritty/theme_loader.toml')
alacritty_config = os.path.join(user_home, '.config/alacritty/alacritty.toml')

# Function to switch themes by index or name
def toggle_theme(theme_input):
    if not theme_input:
        print("Please provide a theme index, name, or use the '-r' or '--random' option.")
        return

    if theme_input.isdigit():  # If input is a number, treat as index
        index = int(theme_input)
        if 1 <= index <= len(themes):
            theme_name = themes[index - 1]
            apply_theme(theme_name)
        else:
            print(f"{COLORS['RED']}Error{COLORS['RESET']}: Invalid index. Please provide a valid theme index.")
    elif theme_input == '-r' or theme_input == '--random':
        theme_name = random.choice(themes)
        apply_theme(theme_name)
        print(f"Random theme '{theme_name}' applied successfully!")
    else:  # Treat input as theme name
        if theme_input in themes:
            apply_theme(theme_input)
        else:
            print(f"{COLORS['RED']}Error{COLORS['RESET']}: Theme '{COLORS['BOLD']}{theme_input}{COLORS['RESET']}' not found. Please provide a valid theme name.")

# Apply the selected theme
def apply_theme(theme_name):
    theme_config = os.path.join(theme_directory, f'{theme_name}.toml')
    shutil.copy(theme_config, theme_loader_path)
    touch_file(alacritty_config)
    print(f"Theme '{theme_name}' applied successfully!")

# Function to list available themes with index
def list_themes():
    global themes
    themes = [f.replace('.toml', '') for f in os.listdir(theme_directory) if f.endswith('.toml')]
    themes.sort()  # Sort themes alphabetically
    print("Available themes:\n")
    for i, theme in enumerate(themes, start=1):
        print(f"{i}. {theme}")
    print("\nSelect by index, name, or use the '-r' or '--random' option; i.e > toggle-theme 1")

# Function to update alacritty config file
def touch_file(file_path):
    with open(file_path, 'a'):
        os.utime(file_path, None)

def underline_text(text):
    return '\033[4m' + text + '\033[0m'

# Function to display available options
def display_help():
    options = [
        f"{COLORS['CYAN']}-r, --random{COLORS['RESET']}  : Apply a random theme",
        f"{COLORS['CYAN']}-l, --list{COLORS['RESET']}    : List available themes",
        f"{COLORS['CYAN']}-h, --help{COLORS['RESET']}    : Show available command options",
        f"{COLORS['CYAN']}index/name{COLORS['RESET']}    : Select a theme by index or name",
    ]

    print(f"A simple Alacritty theme switcher written in Python\n")
    print(f"{COLORS['CYAN']}{underline_text(usage)}{COLORS['RESET']}")
    print(f"{COLORS['RED']}{underline_text('Options')}:{COLORS['RESET']}")
    for option in options:
        print(f"    {option}")

# Check arguments to switch, list themes, or display help
if len(sys.argv) < 2:
    print("Please provide a theme index, name, or use the '-r' or '--random' option.\n")
    print(f"{COLORS['CYAN']}{underline_text(usage)}{COLORS['RESET']}")
    print(f"For more information, try '--help'.")
else:
    theme_input = sys.argv[1]
    if theme_input not in ['-h', '--help', '-l', '--list']:
        themes = [f.replace('.toml', '') for f in os.listdir(theme_directory) if f.endswith('.toml')]
        themes.sort()  # Sort themes alphabetically

        if not themes:
            print("No themes available. Please add themes to /themes/ dir!")
        else:
            if theme_input == '-r' or theme_input == '--random':
                theme_name = random.choice(themes)
                apply_theme(theme_name)
                print(f"Random theme '{theme_name}' applied successfully!")
            else:
                toggle_theme(theme_input)
    elif theme_input in ['-h', '--help']:
        display_help()
    elif theme_input in ['-l', '--list']:
        list_themes()
