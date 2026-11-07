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

echo -e "${YELLOW} Text editors / IDEs ${NC}"

# flatpak install flathub -y com.visualstudio.code
# source ./install_vscode_extensions.sh

flatpak install flathub -y com.vscodium.codium
source ./install_vscodium_extensions.sh

flatpak install flathub -y org.gnome.meld
flatpak install flathub -y net.cozic.joplin_desktop
flatpak install flathub io.github.nokse22.asciidraw
flatpak install flathub -y com.jgraph.drawio.desktop

echo -e "${YELLOW} Email and chat clients ${NC}"
flatpak install flathub -y org.mozilla.thunderbird
flatpak install flathub -y com.discordapp.Discord
flatpak install flathub us.zoom.Zoom
flatpak install flathub -y com.ktechpit.whatsie

echo -e "${YELLOW} PDF readers ${NC}"
flatpak install flathub -y org.pwmt.zathura
# flatpak install flathub -y org.kde.okular

echo -e "${YELLOW} File managers ${NC}"
sudo dnf install -y nemo

echo -e "${YELLOW} Torrent clients ${NC}"
flatpak install flathub -y org.qbittorrent.qBittorrent

echo -e "${YELLOW} Virtual Emulators ${NC}"
sudo dnf install -y qemu
sudo dnf install -y virt-manager
# check if daemon is running
sudo systemctl status virtqemud
# enable and start it
sudo systemctl enable --now virtqemud.socket
sudo systemctl enable --now virtqemud
# install full virtualization stack
sudo dnf install @virtualization
# confirm if socket exists
ls -la /var/run/libvirt/virtqemud-sock
# add yourself to libvirt group
sudo usermod -aG libvirt $(whoami)

echo -e "${YELLOW} Games ${NC}"
flatpak install flathub -y com.valvesoftware.Steam

echo -e "${YELLOW} Web browsers ${NC}"
flatpak install flathub -y app.zen_browser.zen
# flatpak install flathub -y io.gitlab.librewolf-community
# sudo dnf install -y chromium

echo -e "${YELLOW} Media ${NC}"
flatpak install flathub -y com.spotify.Client
flatpak install flathub -y org.videolan.VLC

echo -e "${YELLOW} Cloud storage ${NC}"
# install dropbox
# wget -P ~/Downloads https://linux.dropbox.com/packages/fedora/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm
# sudo dnf install -y ~/Downloads/nautilus-dropbox-2022.12.05-1.fedora.x86_64.rpm

echo -e "${YELLOW} Others ${NC}"
flatpak install flathub -y io.github.redddfoxxyy.samaya
flatpak install flathub -y org.kde.isoimagewriter
flatpak install flathub -y org.kde.ktouch
flatpak install flathub org.kde.kgraphviewer

# install balena etcher
wget -P ~/Downloads https://github.com/balena-io/etcher/releases/download/v1.18.8/balena-etcher-1.18.8.x86_64.rpm
sudo dnf install -y ~/Downloads/balena-etcher-1.18.8.x86_64.rpm
# install key pass XC
# sudo dnf install -y keepassxc



# list all flatpak packages installed
flatpak list --app
# uninstall unused packages
flatpak uninstall --unused
