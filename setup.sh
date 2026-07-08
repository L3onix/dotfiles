#!/bin/sh

show_help() {
  echo "Uso: $"
}

setup_alacritty() {
  echo "Configurando Alacritty..."
  rm -rf ~/.config/alacritty && ln -s $PWD/alacritty ~/.config/alacritty
}

setup_hyprland() {
  echo "Configurando Hyprland..."
  rm -rf ~/.config/hypr && ln -s $PWD/hypr ~/.config/hypr
}

setup_kitty() {
  echo "Configurando Kitty..."
  rm -rf ~/.config/kitty && ln -s $PWD/kitty ~/.config/kitty
}

setup_mako() {
  echo "Configurando Mako..."
  rm -rf ~/.config/mako && ln -s $PWD/mako ~/.config/mako
}

setup_mangohud() {
  echo "Configurando MangoHud..."
  rm -rf ~/.config/MangoHud && ln -s $PWD/MangoHud ~/.config/MangoHud
}

setup_rofi() {
  echo "Configurando Rofi..."
  rm -rf ~/.config/rofi && ln -s $PWD/rofi ~/.config/rofi
}

setup_scripts() {
  echo "Configurando Scripts..."
  rm -rf ~/.config/scripts && ln -s $PWD/scripts ~/.config/scripts
}

setup_swaync() {
  echo "Configurando SwayNC..."
  rm -rf ~/.config/swaync && ln -s $PWD/swaync ~/.config/swaync
}

setup_tmux() {
  echo "Configurando TMUX..."
  rm -rf ~/.config/tmux && ln -s $PWD/tmux ~/.config/tmux
}

setup_waybar() {
  echo "Configurando Waybar..."
  rm -rf ~/.config/waybar && ln -s $PWD/waybar ~/.config/waybar
}

setup_wofi() {
  echo "Configurando Wofi..."
  rm -rf ~/.config/wofi && ln -s $PWD/wofi ~/.config/wofi
}

setup_tilling_configs() {
  echo "Configurando ambiente para TWMs..."

  setup_alacritty
  setup_hyprland
  setup_kitty
  # setup_mako
  setup_mangohud
  setup_rofi
  setup_scripts
  setup_swaync
  setup_tmux
  setup_waybar
  # setup_wofi
}

setup_nix() {
  echo "Copiando arquivos de configuração Nix para /etc/nixos"
  sudo cp -rf ./nixos/* /etc/nixos/
}

setup_lavyvim() {
  echo "Configurando LazyVIM..."

  echo "\t> Setup plugins..."
  cp $PWD/lazyvim/plugins/* ~/.config/nvim/lua/plugins/
}

if [ $# -eq 0 ]; then
  show_help
  exit 0
fi

DO_TWM=false
DO_NIX=false
DO_LAZYVIM=false

for arg in "$@"; do
  case "$arg" in
  -h) show_help ;;
  -l) setup_lavyvim ;;
  -n) setup_nix ;;
  -t) setup_tilling_configs ;;
  esac
done
