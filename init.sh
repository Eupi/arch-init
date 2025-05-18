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
	pacman-contrib \
	--noconfirm

sudo yay -S lxsession-gtk3 --noconfirm
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
mkdir -p $HOME/.local/share/fonts

# Get fonts
cp fonts/.*  $HOME/.local/share/fonts/
echo "Configuring is done."
echo

echo "--- Get dotfiles ---"
rsync -a config/ $HOME/.config/
cp config/.Xresources $HOME/
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
