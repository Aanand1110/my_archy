#!/bin/bash

read -p "Do you want to switch off the pc? [Y/n]: " ans

if [[ "$ans" == "y" || "$ans" == "Y" || "$ans" == "" ]]; then
	poweroff
else
	exit 0
fi
