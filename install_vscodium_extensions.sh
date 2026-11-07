#!/bin/bash

# python
flatpak run com.vscodium.codium --install-extension ms-python.python
flatpak run com.vscodium.codium --install-extension ms-python.debugpy
flatpak run com.vscodium.codium --install-extension ms-python.vscode-python-envs
flatpak run com.vscodium.codium --install-extension kevinrose.vsc-python-indent
flatpak run com.vscodium.codium --install-extension ms-toolsai.jupyter
flatpak run com.vscodium.codium --install-extension ms-toolsai.jupyter-renderers
flatpak run com.vscodium.codium --install-extension ms-toolsai.jupyter-keymap
flatpak run com.vscodium.codium --install-extension njpwerner.autodocstring
flatpak run com.vscodium.codium --install-extension oderwat.indent-rainbow

# c/c++
flatpak run com.vscodium.codium --install-extension llvm-vs-code-extensions.vscode-clangd
flatpak run com.vscodium.codium --install-extension jeff-hykin.better-cpp-syntax

# verilog
flatpak run com.vscodium.codium --install-extension mshr-h.veriloghdl
# flatpak run com.vscodium.codium --install-extension hudson-river-trading.vscode-slang
flatpak run com.vscodium.codium --install-extension vhdlwhiz.vhdl-by-vhdlwhiz

# docker
# flatpak run com.vscodium.codium --install-extension ms-azuretools.vscode-docker

# rust
flatpak run com.vscodium.codium --install-extension rust-lang.rust-analyzer

# git
flatpak run com.vscodium.codium --install-extension mhutchie.git-graph

# markdown
flatpak run com.vscodium.codium --install-extension yzhang.markdown-all-in-one
flatpak run com.vscodium.codium --install-extension bierner.markdown-preview-github-styles
flatpak run com.vscodium.codium --install-extension bierner.markdown-shiki

# themes
flatpak run com.vscodium.codium --install-extension pkief.material-icon-theme
flatpak run com.vscodium.codium --install-extension catppuccin.catppuccin-vsc
# flatpak run com.vscodium.codium --install-extension fabiospampinato.vscode-monokai-night
# flatpak run com.vscodium.codium --install-extension solarliner.linux-themes

# beautiful code
flatpak run com.vscodium.codium --install-extension esbenp.prettier-vscode
flatpak run com.vscodium.codium --install-extension aaron-bond.better-comments
flatpak run com.vscodium.codium --install-extension streetsidesoftware.code-spell-checker

# others
flatpak run com.vscodium.codium --install-extension redhat.vscode-yaml

# list all installed extensions
echo -e "\t Listing all currently installed extensions"
flatpak run com.vscodium.codium --list-extensions
