sudo apt update
sudo apt upgrade


sudo apt install zsh vim neovim curl neofetch qt5-style-kvantum


# font
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Mononoki.zip
unzip Mononoki.zip
mkdir /usr/share/fonts/mononoki
mv Mononoki* /usr/share/fonts/mononoki/
fc-cache


#starship
curl -sS https://starship.rs/install.sh | sh

echo "eval \"$(starship init zsh)\"" >> .zshrc
mkdir -p ~/.config && touch ~/.config/starship.toml
source .zshrc
