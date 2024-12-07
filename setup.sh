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

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
mkdir -p ~/.config && touch ~/.config/starship.toml
source ~/.zshrc


# Set up Utterly Nord theme for KDE
# Install Utterly Nord theme dependencies
sudo apt install -y gtk2-engines-murrine gtk3-engines-unico

# Download the Utterly Nord theme for Plasma
git clone https://github.com/HimDek/Utterly-Nord-Plasma.git ~/.themes/utterly-nord

# Set the Plasma theme
kwriteconfig5 --file kwinrc ActiveTheme "utterly-nord"
kwriteconfig5 --file kwinrc Theme "Breeze Dark"

# Set GTK theme for applications
gsettings set org.gnome.desktop.interface gtk-theme "utterly-nord"
gsettings set org.gnome.desktop.interface icon-theme "utterly-nord"

# Set Qt theme for KDE apps (using Kvantum)
kwriteconfig5 --file kwinrc QtStyle "kvantum"
kwriteconfig5 --file kvantumrc Theme "UtterlyNord"

# Set the Plasma color scheme to Nord
kwriteconfig5 --file plasma-rc ColorScheme "Nord"


# Restart plasma to apply the theme changes
kquitapp5 plasmashell
kstart5 plasmashell

# Finish setup
echo "Utterly Nord theme applied successfully!"
