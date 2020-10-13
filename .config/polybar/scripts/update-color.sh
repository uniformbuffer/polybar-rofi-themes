#!/bin/bash

function set_color (){
if [[ "$1" =~ ([a-zA-Z0-9\-]+)":".*("#"[a-zA-Z0-9]+)";" ]] ;  
then
	sed  -i -e "s/theme-${BASH_REMATCH[1]} = .*/theme-${BASH_REMATCH[1]} = ${BASH_REMATCH[2]}/g" $HOME/.config/polybar/config.ini
fi
}

raw=$(cat $HOME/.config/rofi/themes/colors.rasi | grep "@import")
if [[ "$raw" =~ "@import \""([a-zA-Z/_\-]+)"\"" ]]; then
path="$HOME/.config/rofi/themes/${BASH_REMATCH[1]}.rasi"
fi

color=$(cat "$path")

accent_raw=$(echo "$color" | grep "accent:")
set_color "$accent_raw"
background_raw=$(echo "$color" | grep "background:")
set_color "$background_raw"
background_light_raw=$(echo "$color" | grep "background-light:")
set_color "$background_light_raw"
foreground_raw=$(echo "$color" | grep "foreground:")
set_color "$foreground_raw"
on_raw=$(echo "$color" | grep "on:")
set_color "$on_raw"
off_raw=$(echo "$color" | grep "off:")
set_color "$off_raw"

#Restart polybar
polybar-msg cmd restart
