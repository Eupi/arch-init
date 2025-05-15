#!/bin/bash

echo "Please, be sure about your system is up to date!"
echo "Use command: \"sudo pacman -Syu\" for update"
echo "Also, need install YAY: \"git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si\""

read -p "Press enter to continue"

echo "Update system"
sudo pacman -Syu

echo "--- Install apps ---"
sudo pacman -Syu \
	git \
	vim \
	wget \
	rsync \
	--noconfirm
echo
echo "--- Software installed ---"
echo

echo "Start configuring"
echo
echo "Set locale"
sudo sed -i 's/#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/g' /etc/locale.gen
sudo locale-gen
echo

setxkbmap -model pc105 -layout us,ru -option grp:caps_toggle
mkdir -p $HOME/Downloads/Wallpapers
mkdir -p $HOME/.local/share/fonts/FiraCodeNerdFont

# Get fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -P /tmp 
unzip /tmp/FiraCode.zip -d $HOME/.local/share/fonts/FiraCodeNerdFont
rm /tmp/FiraCode.zip
echo "Configuring is done."
echo

echo "--- Get dotfiles ---"
rsync -a config/ $HOME/.config/
cp wallpapers/* $HOME/Downloads/Wallpapers/
chmod +x .config/polybar/launch.sh

echo "--- Install apps for environment ---"
sudo pacman -Syu \
	alacritty \
	polybar \
	rofi \
	picom \
	ranger \
	feh \
	python-pywal \
	calc \
	zip \
	unzip \
	--noconfirm
echo
echo "--- Software installed ---"
echo
