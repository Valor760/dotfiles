#!/bin/sh

# Some constants
CONFIG="$HOME/.config"
HYPRLAND_CONF="$CONFIG/hypr"
CURR_DIR=$(pwd)

# Hypland config
if [ -d $HYPRLAND_CONF ]
then
	rm -rf $HYPRLAND_CONF
fi
sudo ln -s $CURR_DIR/.config/hypr $HYPRLAND_CONF
