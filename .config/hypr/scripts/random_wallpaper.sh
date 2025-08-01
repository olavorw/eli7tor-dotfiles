#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers/All/"

# Kill any existing mpvpaper processes to prevent overlaps
pkill mpvpaper

# Find a random file (image or video) in the directory
RANDOM_FILE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using mpvpaper for ANY file type
# The options loop the file, remove audio, and set it to fill the screen
# mpv handles both images and videos perfectly with these settings
mpvpaper -o "--loop --no-audio --panscan=1.0" "*" "$RANDOM_FILE"

echo "Wallpaper set to: $RANDOM_FILE"
