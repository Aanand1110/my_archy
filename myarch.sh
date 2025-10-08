#!/bin/sh

#(for image viewing)
sudo pacman -S feh 
#(for kickstarter nvim)
sudo pacman -S git
sudo pacman -S neovim
#copy the nvim binary to the local destination
sudo cp /usr/bin/nvim /usr/local/bin/
mkdir ~/.config/nvim

# for unpacking lsps
sudo pacman -S unzip

# copy and paste the init.lua from https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
touch ~/.config/nvim/init.lua

#installing firefox
sudo pacman -S firefox

#for installing webi
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
#to update webi
webi webi

webi golang@latest
sudo pacman -S gcc

echo "everything successfull"
