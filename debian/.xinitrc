#!/bin/sh
xrdb -merge ~/.Xresources
setxkbmap -option caps:ctrl_modifier
xrandr --output DP-1 --mode 1600x900 --primary --right-of eDP-1
xsetroot -solid '#282828'
xfishtank -df 42 &
redshift-gtk -l 21.028333:105.854167 &
mate-power-manager &
ibus-daemon -drx
blueman-applet &
nm-applet &
keynav &
diodon &
exec awesome
