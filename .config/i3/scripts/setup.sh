#!/bin/bash

# Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\33[0;36m'
NC='\033[0m'

printf "${RED}This script has been made for arch ONLY. All this does is install dependencies.${NC}"
echo ""
echo -n "Continue? (Y/n) "
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

printf "${GREEN}Installing base packages..${RED}"
echo ""
sudo pacman -S rofi flameshot feh picom arandr pcmanfm xarchiver xautolock xfce4-terminal i3 i3lock polybar dunst lxappearance 

printf "${GREEN}Installing font packages...${NC}"
sudo pacman -S ttf-font-awesome ttf-agave-nerd ttf-dejavu

printf "${GREEN}Installing external mounting packages...${NC}"
echo ""
sudo pacman -S udisks2 udiskie

printf "${GREEN}Setting up rofi..${NC}"
echo ""
git clone --depth 1 https://github.com/adi1090x/rofi
cd rofi
chmod +x ./setup.sh

./setup.sh

cd ..
rm -rf rofi

printf "${BLUE}Do you want to install yay? (Y/n)"
echo ""
read -r YAY

case $YAY in
    y)
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd ..
		rm -rf yay
	;;
	Y)
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd ..
		rm -rf yay
    ;;
    *)
		printf "${RED}Skipping yay installation..${NC}"
		echo ""
    ;;
esac

printf "${GREEN}Done. Please run arandr and replace screen_layout.sh with your current setup."
echo ""
echo "dont forget to cp the contents of the base folder to your .config!"
echo "Install firefox if you do not have it, and a display manager of your choice."
printf "Do not forget to install a gtk3 theme and icons! Happy new system~${NC}"
