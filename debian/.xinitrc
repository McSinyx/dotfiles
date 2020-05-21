#!/bin/sh
xrdb -merge ~/.Xresources
$HOME/.screenlayout/dual.sh
redshift-gtk -l 21.028333:105.854167 &
mate-power-manager &
ibus-daemon -drx
blueman-applet &
nm-applet &
keynav &
diodon &
exec awesome
