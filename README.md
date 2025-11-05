## About the project
**This project is all about making the process of setting up a fresh Arch Linux install a bit easier. It provides a simple guide and scripts to help you get your system configured with:**
* Neovim
* A Basic Hyperland config
* Basic Kitty configs
* Waybar

*The scope of the project might expand in the future.*

## Prerequisites
* Only run the script if you are using hyperland.
* Choose NetworkManager while installing Arch(Optional).

# Steps
**Better to run the following in the home dir. of a user after the first boot.**<br>
*copy past this file from the repo or clone this repo and than run it.*<br>
1) *Do not forget to:*
```
~ chmod +x myarch.sh
```
2) Run the myarch.sh script from this repository.
```
~ sudo ./myarch.sh
```

3) Reboot the system
```
~ reboot
```
4) Check if everything is configured properly.
### To configure waybar time.
**You need to change the waybar config**
```
~ cd $HOME/.config/waybar
```
```
nvim config.jsonc
```
*change the timezone argument in the clock object.*
```
"clock":{
    "timezone: "<country>/<city>"
}
/*
Example:
India/Kolkata
*/
```
