#!/bin/bash

echo "Please, be sure about your system is up to date!"
echo "Use command: \"sudo pacman -Syu\" for update"
echo "Also, be sure AUR is enabled"

read -p "Press enter to continue"

echo "--- Install apps ---"
sudo pacman -Syu \
	vim \
	docker \
	docker-compose \
	telegram-desktop \
	ranger \
	--noconfirm
echo
echo "--- Software installed ---"
echo
echo "Start configuring"
echo "Create directory for icons"
mkdir -p $HOME/.local/share/icons/
echo "Directory is created."

#sudo usermod -aG docker $USER