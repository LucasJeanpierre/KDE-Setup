#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y zsh vim neovim curl neofetch qt5-style-kvantum

# Install fonts (Mononoki for Nerd Fonts)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
sudo unzip Mononoki.zip
sudo mkdir /usr/share/fonts/mononoki
sudo mv Mononoki* /usr/share/fonts/mononoki/
cd /usr/share/fonts/mononoki
fc-cache
cd ~

# Global theme https://github.com/HimDek/Utterly-Nord-Plasma
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
