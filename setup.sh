sudo apt update
sudo apt upgrade


sudo apt install zsh vim neovim curl neofetch qt5-style-kvantum latte-dock


# font
curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
sudo unzip Mononoki.zip
sudo mkdir /usr/share/fonts/mononoki
sudo mv Mononoki* /usr/share/fonts/mononoki/
fc-cache


#starship
curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init zsh)"' >> .zshrc
mkdir -p ~/.config && touch ~/.config/starship.toml
source .zshrc

# https://store.kde.org/p/1905813
