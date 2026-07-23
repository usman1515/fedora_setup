#!/bin/bash

# python
codium --install-extension ms-python.python
codium --install-extension ms-python.debugpy
codium --install-extension ms-python.vscode-python-envs
codium --install-extension kevinrose.vsc-python-indent
codium --install-extension ms-toolsai.jupyter
codium --install-extension ms-toolsai.jupyter-renderers
codium --install-extension ms-toolsai.jupyter-keymap
codium --install-extension njpwerner.autodocstring
codium --install-extension oderwat.indent-rainbow

# c/c++
codium --install-extension llvm-vs-code-extensions.vscode-clangd
codium --install-extension jeff-hykin.better-cpp-syntax

# verilog
codium --install-extension mshr-h.veriloghdl
codium --install-extension hudson-river-trading.vscode-slang
codium --install-extension vhdlwhiz.vhdl-by-vhdlwhiz

# docker
# codium --install-extension ms-azuretools.vscode-docker

# rust
codium --install-extension rust-lang.rust-analyzer

# git
codium --install-extension mhutchie.git-graph

# markdown
codium --install-extension yzhang.markdown-all-in-one
codium --install-extension bierner.markdown-preview-github-styles
codium --install-extension bierner.markdown-shiki

# themes
codium --install-extension pkief.material-icon-theme
# codium --install-extension fabiospampinato.vscode-monokai-night
# codium --install-extension solarliner.linux-themes

# beautiful code
codium --install-extension esbenp.prettier-vscode
# codium --install-extension CoenraadS.bracket-pair-colorizer
codium --install-extension aaron-bond.better-comments
codium --install-extension visualstudioexptteam.vscodeintellicode
codium --install-extension streetsidesoftware.code-spell-checker

# others
codium --install-extension ms-vscode-remote.remote-ssh
codium --install-extension redhat.vscode-xml
codium --install-extension redhat.vscode-yaml

# list all installed extensions
echo -e "\t Listing all currently installed extensions"
codium --list-extensions
