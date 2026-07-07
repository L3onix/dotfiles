#!/bin/sh

echo " << Iniciando setup LazyVim >>"

echo "Setup plugins..."
cp $PWD/lazyvim/plugins/* ~/.config/nvim/lua/plugins/

echo "Setup concluído!"
