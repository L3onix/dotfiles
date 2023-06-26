# Como instalar alacritty
Primeiramente é necessário instalar as dependências necessárias para a
instalação correta:
```
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 cargo
```
Após a instalação das dependências é possível instalar o alacritty com o
**cargo** utilizando o comando abaixo:
```
cargo install alacritty
```
Depois de finalizar o processo de instalação do alacritty será necessário
mover o binário do programa para a pasta **/usr/local/bin/** dessa forma
será possível chamar o comando alacritty para abrir o terminal
```
sudo cp ~/.cargo/bin/alacritty /usr/local/bin/alacritty
```
Para criar o atalho no menu do gnome é necessário baixar o repositório
do projeto alacritty e dentro da pasta do projeto executar os comandos
abaixo:
```
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```
As configurações do alacritty podem ser entradas no arquivo **.config/alacritty/alacritty.yml**
