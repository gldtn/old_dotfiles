## PRIMARY DISPLAY SPACES
# SPACE 1: HOME ICON
space1=(
    icon=
    associated_display=1
    associated_space=1
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 1"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space1 left
sketchybar -m --set space1 "${space1[@]}"

# SPACE 2: WEB ICON
space2=(
    icon=󰶚
    associated_display=1
    associated_space=2
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 2"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space2 left
sketchybar -m --set space2 "${space2[@]}"

# SPACE 3: CHAT ICON
space3=(
    icon=
    associated_display=1
    associated_space=3
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 3"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space3 left
sketchybar -m --set space3 "${space3[@]}"

# SPACE 4: MUSIC ICON
space4=(
    icon=
    associated_display=1
    associated_space=4
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 4"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space4 left
sketchybar -m --set space4 "${space4[@]}"

# SPACE 5: OTHER ICON
space5=(
    icon=
    associated_display=1
    associated_space=5
    label.padding_right=0
    label.padding_left=0
    background.padding_left=7
    click_script="yabai -m space --focus 5"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space5 left
sketchybar -m --set space5 "${space5[@]}"

## SECONDARY DISPLAY SPACES
# SPACE 6: CODE ICON
space6=(
    icon=
    associated_display=2
    associated_space=6
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 6"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space6 left
sketchybar -m --set space6 "${space6[@]}"

# SPACE 7: EDITOR ICON
space7=(
    icon=
	associated_display=2
	associated_space=7
	label.padding_right=0
	label.padding_left=0
	click_script="yabai -m space --focus 7"
	script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space7 left
sketchybar -m --set space7 "${space7[@]}"


# SPACE 8: MAIL ICON
space8=(
    icon=
    associated_display=2
    associated_space=8
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 8"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space8 left
sketchybar -m --set space8 "${space8[@]}"

# SPACE 9: READ ICON
space9=(
    icon=󱚚
    associated_display=2
    associated_space=9
    label.padding_left=0
    label.padding_right=0
    click_script="yabai -m space --focus 9"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space9 left
sketchybar -m --set space9 "${space9[@]}"

# SPACE 10: ETC ICON
space10=(
    icon=
    associated_display=2
    associated_space=10
    label.padding_right=0
    label.padding_left=0
    click_script="yabai -m space --focus 10"
    script="~/.config/sketchybar/plugins/space.sh"
)
sketchybar -m --add space space10 left
sketchybar -m --set space10 "${space10[@]}"

# WINDOW TITLE
WINDOWTITLE=(
    icon=
    update_freq=0
    label.padding_right=10
    label.padding_left=0
    script="~/.config/sketchybar/plugins/window_title.sh"
)
sketchybar -m --add item title left
sketchybar -m --set title "${WINDOWTITLE[@]}"
sketchybar -m --subscribe title window_focus front_app_switched space_change title_change
