#!/bin/sh

options="Desligar\nReiniciar\nSuspender\nSair"

selection=$(echo -e "$options" | rofi -dmenu -p "Power Menu: ")

case "$selection" in
  "Desligar")
    systemctl poweroff
    ;;
  "Reiniciar")
    systemctl reboot
    ;;
  "Suspender")
    systemctl suspend
    ;;
  "Sair")
    hyprctl dispatch exit
    ;;
esac

