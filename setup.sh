#!/bin/sh

# Some constants
CONFIG_DIR=".config"
CURR_DIR=$(pwd)

HYPRLAND_CONF="$CONFIG_DIR/hypr"
KITTY_CONF="$CONFIG_DIR/kitty"
EASYEFFECTS_CONF="$CONFIG_DIR/easyeffects"

for cfg in $HYPRLAND_CONF $KITTY_CONF $EASYEFFECTS_CONF
do
	if [[ -d $HOME/$cfg && ! -L $HOME/$cfg ]]
	then
		echo "Applying config: $cfg"
		rm -rf "$HOME/$cfg"
	fi
	ln -sf "$CURR_DIR/$cfg" "$HOME/$cfg"
done

