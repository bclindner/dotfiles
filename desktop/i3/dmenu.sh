#!/usr/bin/env bash
# get some props from the currently loaded xresources
xresources=$(xrdb -query)
nb=$(echo "$xresources" | grep color0 | awk '{print $2}')
sb=$(echo "$xresources" | grep color8 | awk '{print $2}')
fn=$(echo "$xresources" | grep dmenu.font | awk '{$1="";print}')
# run dmenu
dmenu_run -nb "$nb" -sb "$sb" -p ">" -fn "$fn" -l 15
