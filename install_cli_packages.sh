#!/bin/bash

# Essential package management plugin
sudo dnf install -y dnf-plugins-core

# Core networking and web retrieval tools
sudo dnf install -y curl
sudo dnf install -y wget

# Text processing and search utilities
sudo dnf install -y grep
sudo dnf install -y sed
sudo dnf install -y awk
sudo dnf install -y fzf
sudo dnf install -y ripgrep

# Editors
sudo dnf install -y neovim
sudo dnf install -y vim-X11

# Terminal Multiplexers
sudo dnf install -y tmux
# sudo dnf copr enable -y varlad/zellij
# sudo dnf install -y zellij

# Modern CLI tools
sudo dnf install -y bat
sudo dnf copr enable -y alternateved/eza
sudo dnf install -y eza
sudo dnf install -y tree
sudo dnf install -y ncdu

# Terminal file managers
sudo dnf copr enable -y lihaohong/yazi
sudo dnf install -y yazi
# sudo dnf copr enable -y pennbauman/ports
# sudo dnf install -y lf

# Development & Git tools
sudo dnf copr enable -y dejan/lazygit
sudo dnf install -y lazygit
sudo dnf install -y tokei

# System Monitoring & Network
sudo dnf install -y btop
sudo dnf install -y NetworkManager-tui
sudo dnf install -y qalculate

# Media processing
sudo dnf install -y ffmpeg
sudo dnf install -y ImageMagick

# Archive compression tools
sudo dnf install -y unzip
sudo dnf install -y p7zip

sudo dnf install -y fastfetch
sudo dnf install -y cmatrix
# sudo dnf install -y fortune-mod
# sudo dnf install -y cowsay
