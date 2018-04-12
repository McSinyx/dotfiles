#!/bin/sh
cd $HOME
xrdb -merge ~/.Xresources
setxkbmap -option caps:ctrl_modifier
xrandr --output VGA-0 --mode 1600x900 --primary --right-of LVDS
synclient TapButton1=1 VertEdgeScroll=1 HorizEdgeScroll=1 VertTwoFingerScroll=0
keynav &
redshift-gtk &
ibus-daemon -drx
connman-ui-gtk &
clipit &
emacs --daemon
exec awesome
cd -
