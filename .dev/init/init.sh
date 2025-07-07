#!/usr/bin/env bash

# install 
sudo pacman -S git less

# install paru
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si


## fixes
sudo ln -s /usr/bin/kitty /usr/bin/xterm


# install additional dependencies
flatpak install flathub com.usebottles.bottles
flapak install flatseal
flatpak install flatseal

sudo pacman -S gnome-characters

# node:
npm install -g typescript typescript-language-server
npm i -g vscode-langservers-extracted

