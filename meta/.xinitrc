#!/bin/sh
cd $HOME
xrdb -merge ~/.Xresources
setxkbmap -option caps:swapescape
xrandr --output VGA-0 --mode 1600x900 --primary --right-of LVDS
synclient TapButton1=1 VertEdgeScroll=1 HorizEdgeScroll=1 VertTwoFingerScroll=0
keynav &
redshift-gtk &
ibus-daemon -drx
connman-ui-gtk &
clipit &
exec awesome
cd -
