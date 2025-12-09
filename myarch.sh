#!/bin/sh

#run it in the home dir of the user after first boot

result=""

#for hyperland
cd $HOME/.config/hypr

curl https://raw.githubusercontent.com/aanand1110/my_archy/main/hypr/hyprland.conf > hyprland.conf
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfull in configuring hyperland.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot configure hyperland for some reason.\e[0m\n")
fi
cd $HOME

#for basic kitty config
kitty=0
#mkdir $HOME/.config/kitty
cd $HOME/.config/kitty

curl -o current-theme.conf https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/current-theme.conf
if [ $? -ne 0 ]; then
    kitty=1
fi

curl -o kitty.conf https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/kitty.conf
if [ $? -ne 0 ]; then
    kitty=1
fi

curl -o kitty.conf.bak https://raw.githubusercontent.com/aanand1110/my_archy/main/kitty/kitty.conf.bak
if [ $? -ne 0 ]; then
    kitty=1
fi

if [ "$kitty" -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfull in configuring kitty.\033[0m\n")
else
    result+=$(echo -e "\e[31m✕ Could not configure kitty for some reson.(check the bash file)\e[0m\n")
fi
cd $HOME

#installing firefox
sudo pacman -S firefox
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed firefox.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install firefox for some resaon (run 'sudo pacman -S firefox').\e[0m\n")
fi

#(for daily development workflows)
sudo pacman -S git
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed git.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install git for some resaon (run 'sudo pacman -S git').\e[0m\n")
fi
sudo pacman -S less
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed less(for git branching).\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install less for some resaon (run 'sudo pacman -S less').\e[0m\n")
fi

# for unpacking lsps
sudo pacman -S unzip
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed unzip(for unpacking LSPs for nvim).\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install unzip for some resaon (run 'sudo pacman -S unzip').\e[0m\n")
fi

# nvim
nvim=0
sudo pacman -S neovim
if [ $? -ne 0 ]; then
    nvim=1
    result+=$(echo -e "\033[0;32m✕ pacman couldnot install neoviem for somereason.(run 'sudo pacman -S neovim').\033[0m\n")
fi

mkdir $HOME/.config/nvim
if [ $? -ne 0 ]; then
    nvim=1
fi

cd $HOME/.config/nvim
if [ $? -ne 0 ]; then
    nvim=1
fi

curl -o init.lua https://raw.githubusercontent.com/aanand1110/my_archy/main/nvim/init.lua
if [ $? -ne 0 ]; then
    nvim=1
fi

if [ "$nvim" -eq 0 ]; then 
    result+=$(echo -e "\033[0;32m✓ Successfully installed and configured nvim.\033[0m\n")
else
    result+=$(echo -e "\e[31m✕ Couldnot configure nvim for some reason.\e[0m\n")
fi
cd $HOME

#for installing webi
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed webi(for installing development tools[webinstall.dev]).\033[0m\n")
    #to update webi
    webi webi
else 
    result+=$(echo -e "\e[31m✕ Couldnot install webi for some resaon.\e[0m\n")
fi

#webi golang@latest
#sudo pacman -S gcc

#for waybar
waybar=0
sudo pacman -S waybar
if [ $? -ne 0 ]; then
    waybar=1 
    result+=$(echo -e "\e[31m✕ pcaman couldnot install waybar for some resaon.(run 'pacman -S waybar')\e[0m\n") 
fi
sudo pacman -S otf-aurulent-nerd

mkdir $HOME/.config/waybar
if [ $? -ne 0 ]; then
   waybar=1 
fi

cd $HOME/.config/waybar

curl -o config.jsonc  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/config.jsonc
if [ $? -ne 0 ]; then
   waybar=1 
fi

curl -o poweroff.sh https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/poweroff.sh
if [ $? -ne 0 ]; then
   waybar=1 
else
    chmod +x poweroff.sh
fi

curl -o style.css  https://raw.githubusercontent.com/aanand1110/my_archy/main/waybar/style.css
if [ $? -ne 0 ]; then
   waybar=1 
fi

if [ "$nvim" -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed and configured nvim.\033[0m\n")
else
    result+=$(echo -e "\e[31m✕ Couldnot configure nvim for some reason(check the bash file).\e[0m\n")
fi
cd $HOME

sudo pacman -S swaybg
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed and swaybg.\033[0m\n")
else
    result+=$(echo -e "\e[31m✕ Couldnot install swaybg(run 'sudo pacman -S swaybg).\e[0m/n")
fi
echo $result
