#!/usr/bin/env bash

# install 
sudo pacman -S git less

# install paru
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si

