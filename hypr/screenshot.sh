#!/bin/bash

FILE_PATH=$(hyprshot -m region)

if [ -n "$FILE_PATH" ]; then
  nohup spectacle -E "$FILE_PATH" &
fi
