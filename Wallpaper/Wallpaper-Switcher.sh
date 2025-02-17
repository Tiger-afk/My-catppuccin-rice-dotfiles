#!/bin/bash
export wallpaper_path="/home/tiger/Pictures/Wallpapers"


#Puts all filenames into an array
wallpaper=(
    "$wallpaper_path"/*.jpg
    "$wallpaper_path"/*.jpeg
    "$wallpaper_path"/*.png
     )


#Random number generator
VAR=$(shuf -i 0-354 -n 1)

#assigns a template file to wal_tpl
wal_tpl=$(cat /home/tiger/.config/hypr/hyprpaper/hyprpaper.tpl)


#Replaces wallpaper
killall hyprpaper
output=${wal_tpl//WALLPAPER/${wallpaper[$VAR]}}
echo "$output" > $HOME/.config/hypr/hyprpaper.conf
hyprpaper

#changes terminal colours
wal -q -i "${wallpaper[$VAR]}"


