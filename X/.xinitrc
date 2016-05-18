#!/bin/sh
setxkbmap -option caps:swapescape
xrandr --output VGA-0 --mode 1600x900 --primary --right-of LVDS
synclient TapButton1=1 VertEdgeScroll=1 HorizEdgeScroll=1 VertTwoFingerScroll=0
ibus-daemon -drx
nm-applet &
clipit &
mate-power-manager &
exec awesome
