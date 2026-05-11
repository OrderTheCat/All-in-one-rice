#!/bin/sh

# Source directories
DIR1=~/All-in-one-rice/fastfetch
DIR2=~/All-in-one-rice/kitty
DIR3=~/All-in-one-rice/mouse-cursors
DIR4=~/All-in-one-rice/topgrade.toml

# Destination directories
DEST1=~/.config
DEST2=~/.config
DEST3=~/.icons
DEST4=~/.config

# Move directories
mv "$DIR1" "$DEST1"
mv "$DIR2" "$DEST2"
mv "$DIR3" "$DEST3"
mv "$DIR4" "$DEST4"

echo "Setup done!"
