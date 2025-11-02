#!/bin/sh

nmcli dev wifi list

echo -e "What network from the above one would you like to connect to?"
read name

echo -e "Enter passowrd"
read pass

nmcli dev wifi connect "$name" password "$pass"

if [ $? -eq 0 ]; then
	echo -e "\033[0;32mConnection established successfully\033[0m"
else
	echo "incorrect password or SSID"
fi
