#!/bin/sh

# Source directories
DIR1=~/fastfetch
DIR2=~/kitty
DIR3=~/mouse-cursors

# Destination directories
DEST1=~/.config
DEST2=~/.config
DEST3=~/.icons

# Move directories
mv "$DIR1" "$DEST1"
mv "$DIR2" "$DEST2"
mv "$DIR3" "$DEST3"

echo "Setup done!"
