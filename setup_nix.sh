#!/bin/bash

echo "Copiando arquivos de configuração Nix para /etc/nixos"
sudo cp -rf ./nixos/* /etc/nixos/