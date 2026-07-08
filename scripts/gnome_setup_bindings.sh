#!/bin/bash

# Aumenta o número de espaços de trabalho para 10
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

# Libera as teclas Super+1 a Super+9 que eram usadas para abrir aplicativos
for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings "switch-to-application-$i" "[]"
done

# Cria os atalhos Super+Número para ir ao workspace e Super+Shift+Número para mover janelas
for ws in {1..10}; do
    if [ "$ws" -eq 10 ]; then
        gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-10" "['<Super>0']"
        gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-10" "['<Super><Shift>0']"
    else
        gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$ws" "['<Super>$ws']"
        gsettings set org.gnome.desktop.wm.keybindings "move-to-workspace-$ws" "['<Super><Shift>$ws']"
    fi
done

echo "Setup de key bindings concluído!"