#!/bin/sh

#
# This script installs the fonts I use in my rice
#

# Fallback font
sudo pacman -S ttf-dejavu --noconfirm

# Apple San Francisco font for polybar
git clone https://aur.archlinux.org/otf-san-francisco.git
cd otf-san-francisco
makepkg -sri --noconfirm
cd ..
rm -rf otf-san-francisco

# Adobe Source Han Sans for non-Latin characters
sudo pacman -S adobe-source-han-sans-otc-fonts --noconfirm

# Google Noto emoji fonts
sudo pacman -S noto-fonts-emoji --noconfirm

# Google Noto fonts (needed for correct rendering of Google web apps)
sudo pacman -S noto-fonts --noconfirm
