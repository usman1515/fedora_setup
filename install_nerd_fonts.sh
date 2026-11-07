#!/bin/bash

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'

echo -e "${YELLOW} Download nerd fonts zip archive and extrach them ${NC}"

wget -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/CascadiaCode.zip
wget -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/FiraCode.zip
wget -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip

mkdir -p $HOME/new_fonts/

unzip ~/Downloads/CascadiaCode.zip -d $HOME/new_fonts/CascadiaCode/
unzip ~/Downloads/FiraCode.zip -d $HOME/new_fonts/FiraCode/
unzip ~/Downloads/JetBrainsMono.zip -d $HOME/new_fonts/JetBrainsMono/

sudo fc-cache -fv

echo -e "${YELLOW} install generic fonts ${NC}"
dnf search fonts
sudo dnf install -y libreoffice-opensymbol-fonts

echo -e "${YELLOW} install Microsoft fonts (Calibri, Times New Roman etc) ${NC}"

# URL: https://mscorefonts2.sourceforge.net/
# install pre req packages
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig-devel

# install fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# update font cache
sudo fc-cache -fv

