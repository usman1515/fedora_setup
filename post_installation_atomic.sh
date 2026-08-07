#!/bin/bash

# link: https://rpmfusion.org/Configuration

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'

# NOTE: https://rpmfusion.org/Howto/OSTree
echo -e "${GREEN}Fedora Atomic OSTree${NC}"

echo -e "${YELLOW}Enable access to both the free and the nonfree repositories${NC}"
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo -e "${YELLOW}Enable Flathub repository${NC}"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${YELLOW}Install hardware, software, media codecs & system enhancements${NC}"
rpm-ostree install ffmpegthumbs libavcodec-freeworld

echo -e "${YELLOW}Installing intel hardware codecs${NC}"
rpm-ostree install intel-media-driver

echo -e "${YELLOW}Installing software codecs${NC}"
rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras \
    gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi --allow-inactive

rpm-ostree override remove fdk-aac-free libavcodec-free libavdevice-free libavfilter-free \
    libavformat-free libavutil-free libswresample-free libswscale-free \
    ffmpeg-free --install ffmpeg

echo -e "${GREEN}Script complete! Rebooting your system to apply rpm-ostree changes.${NC}"
sudo reboot

