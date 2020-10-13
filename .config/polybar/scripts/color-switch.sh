#!/bin/bash

## Author : Aditya Shakya
## Github : adi1090x
# Custom Rofi Script


SDIR="$HOME/.config/polybar/scripts"

COLORS="material-dark/amber
material-dark/blue
material-dark/blue_grey
material-dark/brown
material-dark/cyan
material-dark/deep_orange
material-dark/deep_purple
material-dark/green
material-dark/grey
material-dark/indigo
material-dark/light_blue
material-dark/light_green
material-dark/lime
material-dark/orange
material-dark/pink
material-dark/purple
material-dark/red
material-dark/teal
material-dark/yellow
material-light/amber
material-light/blue
material-light/blue_grey
material-light/brown
material-light/cyan
material-light/deep_orange
material-light/deep_purple
material-light/green
material-light/grey
material-light/indigo
material-light/light_blue
material-light/light_green
material-light/lime
material-light/orange
material-light/pink
material-light/purple
material-light/red
material-light/teal
material-light/yellow"


# Launch Rofi
MENU="$(echo "$COLORS" |rofi -no-lazy-grab \
-theme themes/menu.rasi \
-dmenu -i -p 'Style' \
-hide-scrollbar true \
-bw 0 \
-lines 5 \
-line-padding 10 \
-padding 20 \
-width 30 \
-xoffset 0 -yoffset -46 \
-location 7 \
-columns 2 \
-show-icons -icon-theme "Papirus")"

if [ "$MENU" != "" ]; then
	MENU2=$(echo "$MENU" | sed 's/\//\\\//g')
	res=$(sed -i -e "s/@import \"colorschemes\/.*\"/@import \"colorschemes\/$MENU2\"/g" $HOME/.config/rofi/themes/colors.rasi)
	$HOME/.config/polybar/scripts/update-color.sh
fi

