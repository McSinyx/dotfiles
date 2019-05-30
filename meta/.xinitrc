#!/bin/sh
xrdb -merge ~/.Xresources
xrandr --output DP1 --mode 1600x900 --primary --right-of eDP1
xsetroot -solid '#1c1b19'
redshift-gtk -l 21.028333:105.854167 &
mate-power-manager &
ibus-daemon -drx
blueman-applet &
nm-applet &
keynav &
diodon &
exec awesome
