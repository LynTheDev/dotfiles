#!/bin/bash

echo "This script has been made for arch ONLY. All this does is install dependencies."
echo -n "Continue? (Y/n)"
read -r ANSWER

case $ANSWER in
	y)
		echo "Continuing."
	;;
	Y)
		echo "Continuing."
	;;
	*)
		echo "Aborting."
		exit 0
	;;
esac

echo "Installing packages.."
sudo pacman -S rofi flameshot feh picom arandr pcmanfm xarchiver i3 polybar dunst lxappearance 

echo "Would you like to install xfce4-terminal, or konsole? (1/2)"
read -r TERM

case $TERM in
    1)
		sudo pacman -S xfce4-terminal
    ;;
    2)
		sudo pacman -S konsole
    ;;
    *)
		echo "Unknown, continuing without a terminal."
    ;;
esac

echo "Installing fonts..."
sudo pacman -S ttf-font-awesome ttf-agave-nerd

echo "Setting up rofi.."
git clone --depth 1 https://github.com/adi1090x/rofi
cd rofi
chmod +x ./setup.sh

./setup.sh

cd ..
rm -rf rofi

echo "Done. Please run arandr and replace screen_layout.sh with your current setup."
echo "dont forget to cp the contents of the base folder to your .config!"
echo "Install firefox if you do not have it, and a display manager of your choice."
echo "Do not forget to install a gtk3 theme and icons! Happy new system~"
