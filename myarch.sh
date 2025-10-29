#!/bin/sh

#run it in the home dir of the user after first boot

#for hyperland
cd $HOME/.config/hypr

curl https://raw.githubusercontent.com/aanand1110/my_archy/main/hypr/hyprland.conf > hyprland.conf

cd $HOME

#for basic kitty config

mkdir $HOME/.config/kitty
cd $HOME/.config/kitty

curl -o current-theme.conf https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/current-theme.conf

curl -o kitty.conf https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/kitty.conf

curl -o kitty.conf.bak https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/kitty.conf.bak

cd $HOME

#installing firefox
sudo pacman -S firefox

#(for daily development workflows)
sudo pacman -S git

# for unpacking lsps
sudo pacman -S unzip

sudo pacman -S neovim
mkdir $HOME/.config/nvim
cd $HOME/.config/nvim

curl -o init.lua https://raw.githubusercontent.com/aanand1110/my_archy/main/nvim/init.lua

cd $HOME

#for installing webi
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
#to update webi
webi webi

#webi golang@latest
#sudo pacman -S gcc

#for waybar
sudo pacman -S waybar
sudo pacman -S otf-aurulent-nerd
mkdir $HOME/.config/waybar
cd $HOME/.config/waybar

curl -o config.jsonc  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/config.jsonc

curl -o poweroff.sh https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/poweroff.sh

curl -o style.css  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/style.css

cd $HOME

echo "everything successfull"

