#!/bin/bash

SAVE_DIR="$HOME/Imagens/Screenshots"
mkdir -p "$SAVE_DIR"

FILE_NAME="screenshot_$(date +%Y%m%d_%H%M%S).png"
FILE_PATH="$SAVE_DIR/$FILE_NAME"

hyprshot -m output -m HDMI-A-3 -f "$FILE_NAME" -o $SAVE_DIR
# satty --save-after-copy --filename "Screenshots/$FILE_NAME"
satty --save-after-copy --filename "$FILE_PATH" --fullscreen



