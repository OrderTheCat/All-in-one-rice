#!/bin/sh

# Source directories

DIR1=~/Simple-Rice/fastfetch/config.jsonc
DIR2=~/Simple-Rice/kitty/kitty.conf
DIR3=~/Simple-Rice/mouse-cursors/'Bibata Modern Ice [Cursor]'
DIR4=~/Simple-Rice/topgrade.toml
DIR5=~/Simple-Rice/mouse-cursors/'Adwaita [Cursor]'
DIR6=~/Simple-Rice/icons/Catppuccin-Mocha
DIR7=~/Simple-Rice/shell/starship.toml  
DIR8=~/Simple-Rice/shell/config.fish      

# Destination directories

DEST1=~/.config
DEST2=~/.config
DEST3=~/.icons
DEST4=~/.config
DEST5=~/.icons
DEST6=~/.local/share/icons/
DEST7=~/.config
DEST8=~/.config/fish

# Move directories safely. Prompt once if any destination targets already exist.
prompt_once_delete() {
  should_prompt=0
  delete_existing=0

  for pair in "$DIR1:$DEST1" "$DIR2:$DEST2" "$DIR3:$DEST3" "$DIR4:$DEST4" "$DIR5:$DEST5" "$DIR6:$DEST6"; do
    src=${pair%%:*}
    dest=${pair#*:}
    if [ -d "$dest" ]; then
      target="$dest/$(basename "$src")"
    else
      target="$dest"
    fi

    if [ -e "$target" ]; then
      should_prompt=1
      break
    fi
  done

  if [ "$should_prompt" -eq 1 ]; then
    printf 'Some targets already exist. Delete all existing targets and continue? [y/N]: '
    read answer
    case "$answer" in
      [Yy]*) delete_existing=1 ;;
      *) delete_existing=0 ;;
    esac
  fi

  return $delete_existing
}

move_clean() {
  src="$1"
  dest="$2"

  if [ -d "$dest" ]; then
    target="$dest/$(basename "$src")"
  else
    target="$dest"
  fi

  if [ -e "$target" ]; then
    if [ "$delete_existing" -eq 1 ]; then
      rm -rf "$target"
    else
      echo "Skipping move of '$src' because '$target' already exists."
      return
    fi
  fi

  mv "$src" "$dest"
}

if prompt_once_delete; then
  delete_existing=1
else
  delete_existing=0
fi

move_clean "$DIR1" "$DEST1"
move_clean "$DIR2" "$DEST2"
move_clean "$DIR3" "$DEST3"
move_clean "$DIR4" "$DEST4"
move_clean "$DIR5" "$DEST5"
move_clean "$DIR6" "$DEST6"


# Set wallpaper

echo "Available wallpapers:"
echo "1. cabin-3.png"
echo "2. cat-vibin.png"
echo "3. cottages-river.png"
echo "4. cabin-4.png"
echo "5. cabin.png"
echo "6. call-it-a-day.png"
echo "You can find the wallpapers in the wallpapers folder of the repository."
echo "Enter the number of the wallpaper to apply:"
read choice
case $choice in
1) wallpaper="cabin-3.png" ;;
2) wallpaper="cat-vibin.png" ;;
3) wallpaper="cottages-river.png" ;;
4) wallpaper="cabin-4.png" ;;
5) wallpaper="cabin.png" ;;
6) wallpaper="call-it-a-day.png" ;;
*) echo "Wrong choice. Please run the script again and select a valid option."; exit 1 ;;
esac
plasma-apply-wallpaperimage ~/All-in-one-rice/wallpapers/$wallpaper   

## SDDM Theme

bash -c "$(curl -fsSL https://raw.githubusercontent.com/OrderTheCat/sddm-astronaut-theme/master/setup.sh)"
