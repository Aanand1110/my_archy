#!/bin/sh

#run it in the home dir of the user after first boot

result=""

#for hyperland
cd $HOME/.config/hypr

curl https://raw.githubusercontent.com/aanand1110/my_archy/main/hypr/hyprland.conf > hyprland.conf
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfull in configuring hyperland.\033[0m")
else 
    result+=$(echo -e "\033[0;32m✕ Couldnot configure hyperland for some reason.\033[0m")
fi
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
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed firefox.\033[0m")
else 
    result+=$(echo -e "\033[0;32m✕ Couldnot install firefox for some resaon (run 'sudo pacman -S firefox').\033[0m")
fi

#(for daily development workflows)
sudo pacman -S git
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed git.\033[0m")
else 
    result+=$(echo -e "\033[0;32m✕ Couldnot install git for some resaon (run 'sudo pacman -S git').\033[0m")
fi
sudo pacman -S less

# for unpacking lsps
sudo pacman -S unzip
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed unzip(for unpacking LSPs for nvim).\033[0m")
else 
    result+=$(echo -e "\033[0;32m✕ Couldnot install unzip for some resaon (run 'sudo pacman -S unzip').\033[0m")
fi

sudo pacman -S neovim
mkdir $HOME/.config/nvim
cd $HOME/.config/nvim

curl -o init.lua https://raw.githubusercontent.com/aanand1110/my_archy/main/nvim/init.lua

cd $HOME

#for installing webi
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed webi(for installing development tools[webinstall.dev]).\033[0m")
    #to update webi
    webi webi
else 
    result+=$(echo -e "\033[0;32m✕ Couldnot install webi for some resaon.\033[0m")
fi

#webi golang@latest
#sudo pacman -S gcc

#for waybar
sudo pacman -S waybar
sudo pacman -S otf-aurulent-nerd
mkdir $HOME/.config/waybar
cd $HOME/.config/waybar

curl -o config.jsonc  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/config.jsonc

curl -o poweroff.sh https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/poweroff.sh
chmod +x poweroff.sh

curl -o poweroff.sh https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/wifi.sh
if [ $? -eq 0 ]; then
    chmod +x wifi.x
else
    echo "failed to install the wifi.sh file"
fi
curl -o style.css  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/style.css

cd $HOME

echo $result
