#!/bin/sh

# Source directories
DIR1=~/All-in-one-rice/fastfetch
DIR2=~/All-in-one-rice/kitty
DIR3=~/All-in-one-rice/'Mouse Cursors'/'Bibata Modern Ice [Cursor]'
DIR4=~/All-in-one-rice/topgrade.toml
DIR5=~/All-in-one-rice/'Mouse Cursors'/'Adwaita [Cursor]'

# Destination directories
DEST1=~/.config
DEST2=~/.config
DEST3=~/.icons
DEST4=~/.config
DEST5=~/.icons

# Move directories
mv "$DIR1" "$DEST1"
mv "$DIR2" "$DEST2"
mv "$DIR3" "$DEST3"
mv "$DIR4" "$DEST4"
mv "$DIR5" "$DEST5"

echo "Setup done!"
