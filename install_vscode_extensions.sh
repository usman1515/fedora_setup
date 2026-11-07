#!/bin/bash

# python
flatpak run com.visualstudio.code --install-extension ms-python.python
flatpak run com.visualstudio.code --install-extension ms-python.vsflatpak run com.visualstudio.code-pylance
flatpak run com.visualstudio.code --install-extension ms-toolsai.jupyter
flatpak run com.visualstudio.code --install-extension ms-toolsai.jupyter-renderers
flatpak run com.visualstudio.code --install-extension ms-toolsai.jupyter-keymap
flatpak run com.visualstudio.code --install-extension kevinrose.vsc-python-indent
flatpak run com.visualstudio.code --install-extension njpwerner.autodocstring
flatpak run com.visualstudio.code --install-extension oderwat.indent-rainbow

# c/c++
flatpak run com.visualstudio.code --install-extension ms-vsflatpak run com.visualstudio.code.cpptools
flatpak run com.visualstudio.code --install-extension jeff-hykin.better-cpp-syntax

# verilog
flatpak run com.visualstudio.code --install-extension mshr-h.veriloghdl

# docker
flatpak run com.visualstudio.code --install-extension ms-azuretools.vsflatpak run com.visualstudio.code-docker

# git
flatpak run com.visualstudio.code --install-extension mhutchie.git-graph

# markdown
flatpak run com.visualstudio.code --install-extension yzhang.markdown-all-in-one
flatpak run com.visualstudio.code --install-extension bierner.markdown-preview-github-styles
flatpak run com.visualstudio.code --install-extension bierner.markdown-shiki

# themes
flatpak run com.visualstudio.code --install-extension pkief.material-icon-theme
flatpak run com.visualstudio.code --install-extension fabiospampinato.vsflatpak run com.visualstudio.code-monokai-night
# flatpak run com.visualstudio.code --install-extension solarliner.linux-themes

# beautiful flatpak run com.visualstudio.code
flatpak run com.visualstudio.code --install-extension esbenp.prettier-vsflatpak run com.visualstudio.code
# flatpak run com.visualstudio.code --install-extension CoenraadS.bracket-pair-colorizer
flatpak run com.visualstudio.code --install-extension aaron-bond.better-comments
flatpak run com.visualstudio.code --install-extension visualstudioexptteam.vsflatpak run com.visualstudio.codeintelliflatpak run com.visualstudio.code
flatpak run com.visualstudio.code --install-extension streetsidesoftware.flatpak run com.visualstudio.code-spell-checker

# others
flatpak run com.visualstudio.code --install-extension ms-vsflatpak run com.visualstudio.code-remote.remote-ssh
flatpak run com.visualstudio.code --install-extension redhat.vsflatpak run com.visualstudio.code-xml
flatpak run com.visualstudio.code --install-extension redhat.vsflatpak run com.visualstudio.code-yaml

# list all installed extensions
echo -e "\t Listing all currently installed extensions"
flatpak run com.visualstudio.code --list-extensions
