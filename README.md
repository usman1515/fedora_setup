# Fedora Setup

- [Fedora Setup](#fedora-setup)
    - [Introduction](#introduction)
    - [1. Download and Install Fedora](#1-download-and-install-fedora)
    - [2. First things to do post installation](#2-first-things-to-do-post-installation)
        - [2.1 Connect to your local work/home WiFi](#21-connect-to-your-local-workhome-wifi)
        - [2.2 Install `git`](#22-install-git)
        - [2.2 Setup `dnf` configuration](#22-setup-dnf-configuration)
        - [2.3 Update the system](#23-update-the-system)
    - [3. Setup the Terminal](#3-setup-the-terminal)
        - [3.1 Clone the dotfiles repository](#31-clone-the-dotfiles-repository)
        - [3.2 Install Nerd Fonts](#32-install-nerd-fonts)
        - [3.3 Install Alacritty](#33-install-alacritty)
        - [3.4 Install Kitty](#34-install-kitty)
        - [3.5 Install Tmux](#35-install-tmux)
        - [3.6 Install NeoVim](#36-install-neovim)
        - [3.7 Install and customize ZSH](#37-install-and-customize-zsh)
        - [3.8 (Optional) Install and customize Oh my Posh](#38-optional-install-and-customize-oh-my-posh)
    -  [4. Install Compilers](#4-install-compilers)
    -  [5. Install CLI based tools](#5-install-cli-based-tools)
    -  [6. Install GUI based applications](#6-install-gui-based-applications)
    -  [7. Install Gtklp for remote printers](#7-install-gtklp-for-remote-printers)
    -  [8. Setup SSH](#8-setup-ssh)
    -  [9. Install FOSS toolchains for Hardware development](#9-install-foss-toolchains-for-hardware-development)
        - [9.1 Install OSS CAD Suite](#91-install-oss-cad-suite)
        - [9.2 Install other FOSS EDA tools.](#92-install-other-foss-eda-tools)
    -  [10. Optional: Upgrade Fedora](#10-optional-upgrade-fedora)


## Introduction
This repo is a guide to how I setup my desktop machine using Fedora with the Sway TWM as my distro
of choice. I use Fedora mostly for hardware and software development. If you're migrating to Linux
for the first time and don't know where to start this is the place to be.

## Download and Install Fedora
1. Download Fedora KDE Plasme Desktop from the following [link](https://fedoraproject.org/kde/).
2. Create a bootable USB using [balena etcher](https://etcher.balena.io).
3. Insert it into your PC, load the boot menu and follow the instructions to install Fedora on your local machine.

## First things to do post installation
- Once Fedora is installed successfully we need to setup the following.

<!-- ### 2.1 Connect to your local work/home WiFi -->
<!-- - Since no graphical utilities are currently installed we will be using the terminal. To connect to -->
<!--   your local WiFi run the following commands. -->
<!---->
<!-- ```bash -->
<!-- # list all available WiFi networks -->
<!-- nmcli device wifi list -->
<!---->
<!-- # connect to your WiFi network -->
<!-- nmcli device wifi connect "SSID" password "your_password" -->
<!-- ``` -->

### Install `git`
- Install git: `sudo dnf install -y git`
- Clone this [fedora_setup](https://github.com/usman1515/Fedora_Setup#) repo in the $HOME directory.
    ```bash
    cd ~
    git clone https://github.com/usman1515/Fedora_Setup.git fedora_setup
    ```

### Setup `dnf` configuration
- [Reference](https://dnf.readthedocs.io/en/latest/conf_ref.html)
- Open the file: `sudo vi /etc/dnf/dnf.conf`
- Add the following lines:
    ```bash
    # added for speed
    fastestmirror=True
    max_parallel_downloads=20
    defaultyes=True
    keepcache=False
    ```

### Update the system
- Update the system: `sudo dnf update`
```bash
sudo dnf upgrade --refresh
sudo dnf upgrade
```
- Run the script `post_installation.sh`. This will do the following:
    - enable rpm fusion
    - enable flathub
    - install media codecs
    - install preload
    - enable 3rd party repositories

## Setup the Terminal

### Clone the dotfiles repository.
- Clone this [dotfiles](https://github.com/usman1515/dotfiles) repo.
    ```bash
    cd ~
    git clone https://github.com/usman1515/dotfiles.git
    ```
- Copy the git config from the dotfiles repo into the `$HOME` dir.

### Install Nerd Fonts
- You can dowload multiple [Nerd Fonts](https://www.nerdfonts.com/font-downloads) of your choice.
However my personal favourites are
    - CascadiaCode
    - FiraCode
    - JetBrainsMono
    ```bash
    source ./install_nerd_fonts.sh
    ```

### Install Alacritty
- Install alacritty
    ```bash
    sudo dnf install -y alacritty
    ```
- Copy the alacritty config folder from the dotfiles repo into `~/.config` folder.
- Clone alacritty themes repo:
    ```bash
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
    ```

### Install Kitty
- Install kitty
    ```bash
    sudo dnf install -y kitty
    ```
- Copy the kitty config folder from the dotfiles repo into `~/.config` folder.

### Install Tmux
- Install kitty
    ```bash
    sudo dnf install -y tmux
    ```
- Copy the tmux config folder from the dotfiles repo into `~/.config` folder.

### Install NeoVim
- Install neovim. Note that the config might not work out of the box since LSP andn plugins in
neovim are always being updated.
    ```bash
    sudo dnf install -y neovim
    ```
- Refer to these [instructions](https://github.com/usman1515/dotfiles/tree/main/nvim) on how to setup neovim.
- Copy the nvim config folder from the dotfiles repo into `~/.config` folder.

### Install and customize ZSH
- Install oh my zsh for ZSH shell.
    ```bash
    source install_oh_my_zsh.sh
    # copy these config  file sin $HOME dir
    cp -rv ./shell_configs/.p10k.zsh ./shell_configs/.zsh_aliases ./shell_configs/.zshrc ~
    ```
- Reboot PC.

### (Optional) Install and customize Oh my Posh
- Install oh my posh for BASH shell.
    ```bash
    source install_oh_my_posh.sh
    ```

## Install Compilers
- [Languages & databases](https://developer.fedoraproject.org/tech.html)
    ```bash
    source install_compilers.sh
    ```

## Install CLI based tools
- To install all the CLI and TUI based applications run the following command.
    ```bash
    source install_cli_packages.sh
    ```

## Install GUI based applications
- To install all the GUI and Flathub based applications run the following command.
    ```bash
    source install_gui_packages.sh
    ```

## Install FOSS toolchains for Hardware development
**OPTIONAL**: These are some of the tools that I use for hardware development.

### Install [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build)
The OSS CAD Suite is a collection of open-source tools for digital design and FPGA development. A
binary software distribution for a number of open source software used in digital logic design.

- Download the latest Linux x86-64 release from
[here](https://github.com/YosysHQ/oss-cad-suite-build/releases). For a normal x86-64 Fedora, select
the `linux-x64` archive.

- Download the latest build and extract it in `~/Tools/`:
```bash
mkdir -p ~/Tools
cd ~/Tools

tar -zxvf ~/Downloads/oss-cad-suite-linux-x64-<build-date>.tgz \
    -C ~/Tools/oss-cad-suite-linux-x64-<build-date>

# Add the following `$PATH` in your `~/.bash_aliases` or `~/.zsh_aliases`
# PATH oss-cad-suite
export PATH="$HOME/Tools/oss-cad-suite-linux-x64-<build-date>/bin:$PATH"

# restart the shell or run:
source ~/.bashrc
source ~/.zshrc

# verify the installation:
ghdl --version
iverilog --version
verilator --version
yosys --version
nextpnr-ice40 --version
nextpnr-ecp5 --version
openFPGALoader --version
```

### Install [NVC](https://github.com/nickg/nvc)
NVC is an open-source **VHDL compiler and simulator**. It is used in this project for VHDL
simulation and is separate from the OSS CAD Suite.
```bash
source install_nvc.sh
```

### Install [Verible](https://github.com/chipsalliance/verible)
Verible is a suite of SystemVerilog developer tools, including a parser, style-linter, formatter and
language server. To start download the latest `*-linux-static-x86_64.tar.gz` file from this
[link](https://github.com/chipsalliance/verible/releases).

```bash
# after downloading the tar file
mkdir -p ~/Tools/verible
cd ~/Tools/verible

tar -zxvf ~/Downloads/verible-v0.0-4148-g1ea007ec-linux-static-x86_64.tar.gz -C ~/Tools/verible

# Add the following `$PATH` in your `~/.bashrc`
export PATH="$HOME/Tools/verible-v0.0-4148-g1ea007ec/bin:$PATH"

# restart the shell or run:
source ~/.bashrc

# verify the installation:
verible-verilog-diff --version
verible-verilog-format --version
verible-verilog-lint --version
verible-verilog-ls --version
verible-verilog-syntax --version
```

### 9.2 Install other FOSS EDA tools.
- If you want to build the following tools from source use the following scripts.
-   [GHDL](https://github.com/ghdl/ghdl) for VHDL simulation.
-   [NVC](https://github.com/nickg/nvc) for VHDL simulation.
-   [iVerilog](https://github.com/steveicarus/iverilog) for Verilog simulation.
-   [Yosys](https://github.com/YosysHQ/yosys) for Verilog synthesis.
-   [Verilator](https://github.com/verilator/verilator) for converting Verilog and SystemVerilog designs into a C++ or SystemC model.
-   [Chisel](https://github.com/chipsalliance/chisel) for designing and testing RTL using Chisel/Scala.
-   [FloPoCo](https://flopoco.org/) for generating Floating Point Cores.

    ```bash
    source install_ghdl.sh
    source install_nvc.sh
    source install_iverilog.sh
    source install_yosys.sh
    source install_verilator.sh
    source install_chisel.sh
    source install_docker_flopoco.sh
    ```

## 10. Optional: Upgrade Fedora
-   To upgrade fedora run the following script
    ```bash
    source upgrade_fedora.sh
    ```

