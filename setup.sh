#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y zsh vim neovim curl neofetch qt5-style-kvantum python3-pip pipx

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
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Docker install
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Exegol install
pipx install exegol
pipx ensurepath
echo "alias exegol='sudo -E $(which exegol)'" >> ~/.zshrc
source ~/.zshrc
exegol install
