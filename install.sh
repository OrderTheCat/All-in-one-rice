#!/bin/sh

REPO_DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
HOME_DIR="${HOME:-$(getent passwd "$(id -un)" 2>/dev/null | cut -d: -f6)}"

# Source paths in this repository
SRC1="$REPO_DIR/fastfetch/config.jsonc"
SRC2="$REPO_DIR/kitty"
SRC3="$REPO_DIR/mouse-cursors/Bibata-Modern-Ice"
SRC4="$REPO_DIR/mouse-cursors/Adwaita"
SRC5="$REPO_DIR/icons/Catppuccin-Mocha"
SRC6="$REPO_DIR/shell/config.fish"

# Destination directories
DEST1="$HOME_DIR/.config/fastfetch"
DEST2="$HOME_DIR/.config"
DEST3="$HOME_DIR/.icons"
DEST4="$HOME_DIR/.icons"
DEST5="$HOME_DIR/.local/share/icons"
DEST6="$HOME_DIR/.config/fish"

# Move directories safely. Prompt once if any destination targets already exist.
prompt_once_delete() {
  should_prompt=0
  delete_existing=0

  for pair in "$SRC1:$DEST1" "$SRC2:$DEST2" "$SRC3:$DEST3" "$SRC4:$DEST4" "$SRC5:$DEST5" "$SRC6:$DEST6"; do
    src=${pair%%:*}
    dest=${pair#*:}
    target="$dest/$(basename "$src")"

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
  target="$dest/$(basename "$src")"

  mkdir -p "$dest"

  if [ -e "$target" ]; then
    if [ "$delete_existing" -eq 1 ]; then
      rm -rf "$target"
    else
      echo "Skipping move of '$src' because '$target' already exists. Try rm -rf'ing it"
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

move_clean "$SRC1" "$DEST1"
move_clean "$SRC2" "$DEST2"
move_clean "$SRC3" "$DEST3"
move_clean "$SRC4" "$DEST4"
move_clean "$SRC5" "$DEST5"
move_clean "$SRC6" "$DEST6"

# Set wallpaper

echo "Available wallpapers:"
echo "1. cabin-3.png"
echo "2. cat-vibin.png"
echo "3. cottages-river.png"
echo "4. cabin-4.png"
echo "5. cabin.png"
echo "6. call-it-a-day.jpg"
echo "You can find the wallpapers in the wallpapers folder of the repository."
echo "Enter the number of the wallpaper to apply:"
read choice
case "$choice" in
  1) wallpaper="cabin-3.png" ;;
  2) wallpaper="cat-vibin.png" ;;
  3) wallpaper="cottages-river.png" ;;
  4) wallpaper="cabin-4.png" ;;
  5) wallpaper="cabin.png" ;;
  6) wallpaper="call-it-a-day.jpg" ;;
  *) echo "Wrong choice. Please run the script again and select a valid option."; exit 1 ;;
esac

plasma-apply-wallpaperimage "$REPO_DIR/wallpapers/$wallpaper"

## SDDM Theme

bash -c "$(curl -fsSL https://raw.githubusercontent.com/OrderTheCat/sddm-astronaut-theme/master/setup.sh)"
