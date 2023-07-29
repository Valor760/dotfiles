#!/bin/sh

# Some constants
CONFIG="$HOME/.config"
CURR_DIR=$(pwd)

HYPRLAND_CONF="$CONFIG/hypr"
KITTY_CONF="$CONFIG/kitty"

# Hypland config
if [[ -d $HYPRLAND_CONF && ! -L $HYPRLAND_CONF ]]
then
	rm -rf $HYPRLAND_CONF
fi
ln -sf $CURR_DIR/.config/hypr $HYPRLAND_CONF

# Kitty config
if [[ -d $KITTY_CONF && ! -L $KITTY_CONF ]]
then
	rm -rf $KITTY_CONF
fi
ln -sf $CURR_DIR/.config/kitty $KITTY_CONF

