#!/bin/sh

# NOTE: ensure that 'xf86-input-wacom' package is installed

# Enable scrolling and make scrolling more sensitive than default
xsetwacom --set "Wacom One by Wacom M Pen stylus" Button 2 "pan"
xsetwacom --set "Wacom One by Wacom M Pen stylus" "PanScrollThreshold" 500

