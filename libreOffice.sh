#!/bin/sh

# If you want to set up libre office. Run this script.
# This script also sets up the menu for office options.

result=""
sudo pacman -S libreoffice-fresh
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfull installed libre office suit.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install libre office for some reason try again.\e[0m\n")
fi

mkdir $HOME/.local/share/applications
cd $HOME/.local/share/applications

curl -o chatgpt.desktop https://github.com/Aanand1110/my_archy/blob/main/menu/chatgpt.desktop
if [ $? -ne 0 ]; then
    result+=$(echo -e "\e[31m✕ One file not fetched. Run the script again.\e[0m\n")
fi
curl -o powerpoint.desktop https://github.com/Aanand1110/my_archy/blob/main/menu/powerpoint.desktop
if [ $? -ne 0 ]; then
    result+=$(echo -e "\e[31m✕ One file not fetched. Run the script again.\e[0m\n")
fi
curl -o calc.desktop https://github.com/Aanand1110/my_archy/blob/main/menu/calc.desktop
if [ $? -ne 0 ]; then
    result+=$(echo -e "\e[31m✕ One file not fetched. Run the script again.\e[0m\n")
fi
curl -o writer.desktop https://github.com/Aanand1110/my_archy/blob/main/menu/writer.desktop
if [ $? -ne 0 ]; then
    result+=$(echo -e "\e[31m✕ One file not fetched. Run the script again.\e[0m\n")
fi

echo $result