#!/bin/sh
xrdb -merge ~/.Xresources
xrandr --output DP1 --mode 1600x900 --primary --right-of eDP1
redshift-gtk -l 21.028333:105.854167 &
mate-power-manager &
ibus-daemon -drx
blueman-applet &
nm-applet &
urxvtd -q -f -o
keynav &
diodon &
exec awesome
