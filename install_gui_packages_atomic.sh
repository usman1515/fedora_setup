#!/bin/bash

RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m'


# ==================== install using Flatpak
echo -e "${YELLOW} install using Flatpak ${NC}"

# add remote repo flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# list all flatpak packages installed
flatpak list --app

# uninstall unecessary apps
flatpak uninstall --delete-data -y org.kde.kmahjongg
flatpak uninstall --delete-data -y org.kde.kmines
flatpak uninstall --delete-data -y org.kde.kolourpaint
flatpak uninstall --delete-data -y org.kde.qrca

# ----------------------------- Text editors / IDEs
echo -e "${YELLOW} Text editors / IDEs ${NC}"

flatpak install flathub -y com.vscodium.codium
flatpak install flathub -y org.gnome.meld
flatpak install flathub -y net.cozic.joplin_desktop

flatpak install flathub -y org.libreoffice.LibreOffice
# flatpak override command to give LibreOffice access to the runtime document portal.
flatpak override --user --filesystem=xdg-run/doc org.libreoffice.LibreOffice

echo -e "${YELLOW} PDF readers ${NC}"
flatpak install flathub -y org.pwmt.zathura
flatpak install flathub -y org.kde.okular
flatpak install flathub -y com.github.jeromerobert.pdfarranger

echo -e "${YELLOW} Email and chat clients ${NC}"
flatpak install flathub -y com.discordapp.Discord
# flatpak install flathub -y us.zoom.Zoom
# slack
# pumple
flatpak install flathub -y org.mozilla.thunderbird_esr

echo -e "${YELLOW} File managers ${NC}"
flatpak install flathub -y org.kde.dolphin
# nemo
# nautilus

echo -e "${YELLOW} Remote desktop viewers ${NC}"
# putty
flatpak install flathub -y org.remmina.Remmina
flatpak install flathub -y org.kde.krdc
# vnc viewer

echo -e "${YELLOW} Torrent clients ${NC}"
flatpak install flathub -y org.qbittorrent.qBittorrent

echo -e "${YELLOW} Virtual Emulators ${NC}"
# qemu
flatpak install flathub -y org.virt_manager.virt-manager
flatpak install flathub -y io.podman_desktop.PodmanDesktop

echo -e "${YELLOW} Web browsers ${NC}"
flatpak install flathub -y app.zen_browser.zen
flatpak install flathub -y io.gitlab.librewolf-community

echo -e "${YELLOW} Cloud storage ${NC}"
# google drive
# dropbox

echo -e "${YELLOW} Media ${NC}"
# vlc
flatpak install flathub -y com.spotify.Client

echo -e "${YELLOW} Others ${NC}"
flatpak install flathub -y io.github.redddfoxxyy.samaya
flatpak install flathub -y io.github.gtkwave.GTKWave
# balena etcher
flatpak install flathub -y org.kde.isoimagewriter
flatpak install flathub -y com.jgraph.drawio.desktop
flatpak install flathub -y com.ktechpit.whatsie
flatpak install flathub -y org.kde.ktouch

# list all flatpak packages installed
flatpak list --app
# uninstall unused packages
flatpak uninstall --unused

