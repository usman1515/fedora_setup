# Fedora Setup

- [Fedora Setup](#fedora-setup)
  - [Introduction](#introduction)
  - [Download and Install Fedora](#download-and-install-fedora)
  - [First things to do post installation](#first-things-to-do-post-installation)
    - [Install `git`](#install-git)
    - [Setup `dnf` configuration](#setup-dnf-configuration)
    - [Update the system](#update-the-system)
  - [Setup the Terminal](#setup-the-terminal)
    - [Clone the dotfiles repository.](#clone-the-dotfiles-repository)
    - [Install Nerd Fonts](#install-nerd-fonts)
    - [Install Alacritty](#install-alacritty)
    - [Install Kitty](#install-kitty)
    - [Install Tmux](#install-tmux)
    - [Install NeoVim](#install-neovim)
    - [Install and customize ZSH](#install-and-customize-zsh)
    - [(Optional) Install and customize Oh my Posh](#optional-install-and-customize-oh-my-posh)
  - [Install Compilers](#install-compilers)
  - [Install CLI based tools](#install-cli-based-tools)
  - [Install GUI based applications](#install-gui-based-applications)
  - [Install FOSS toolchains for Hardware development](#install-foss-toolchains-for-hardware-development)
    - [Install OSS CAD Suite](#install-oss-cad-suite)
    - [Install NVC](#install-nvc)
    - [Install Verible](#install-verible)
    - [Install AMD Vivado + Vitis](#install-amd-vivado--vitis)
      - [Install Cable Drivers (Linux Only)](#install-cable-drivers-linux-only)
      - [Install Digilent's Board Files](#install-digilents-board-files)
      - [Download Digilent Boards Constraint Files](#download-digilent-boards-constraint-files)
      - [How to Run Vivado](#how-to-run-vivado)
    - [Install Chisel](#install-chisel)
    - [Install Platform IO](#install-platform-io)
    - [Install RISC V GNT toolchains](#install-risc-v-gnt-toolchains)

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

### Install AMD Vivado + Vitis
We are using AMD Vivado as our primary tool for FPGA project development. Ask one of the team
members for the setup. At the time of writing this tutorial we are using version 2025.1.

```bash
sudo dnf install -y git gcc g++ make autoconf automake cmake python3 ncurses-compat-libs \
    commons-compiler-jdk.noarch java-25-openjdk.x86_64 java-latest-openjdk.x86_64
```
- Update your system
```bash
sudo dnf -y update
```
- Now open the setup folder and look for the following file and run the command below.
```bash
chmod +x ./FPGAs_AdaptiveSoCs_Unified_2024.1_0522_2023_Lin64.bin
```
- Run the setup file.
```bash
sudo ./FPGAs_AdaptiveSoCs_Unified_2024.1_0522_2023_Lin64.bin
```
- An installation window opens up.
- Select the product to install: **Vitis**.
4. Accept all license agreements.
5. Select the destination directory: `/tools/Xilinx/`.
    - Allow it to create the directories if they don’t exist.
6. Click **Install**.

Grab a cup of coffee , sit back and relax. This a gonna take a while depending on your internet
connection.

#### Install Cable Drivers (Linux Only)
Once vivado is installed you need to setup the cable drivers and board definitions.
```bash
# go to directory
cd /tools/Xilinx/2025.1/Vivado/data/xicom/cable_drivers/lin64/install_script/install_drivers/

# run script
sudo ./install_drivers
```

#### Install Digilent's Board Files
Once you have installed the cable drivers we need to setup the board definitions.
```bash
mkdir -p ~/Tools/
cd ~/Tools/

# clone the repo
git clone https://github.com/Digilent/vivado-boards.git
cd vivado-boards

# copy board files
sudo cp -rv ~/Tools/vivado-boards/new/board_files /tools/Xilinx/2025.1/Vivado/data/boards/
```

#### Download Digilent Boards Constraint Files
Simply cloen this repo as it provides the IO constraint files for multiple Digilent boards. What
these are and how they work will be explained further down the bootcamp.

```bash
mkdir -p ~/Tools/
cd ~/Tools/

# clone the repo
git clone https://github.com/Digilent/digilent-xdc.git vivado_digilent_xdc_files
cd vivado_digilent_xdc_files
```

#### How to Run Vivado
Run the following command in your terminal every time you want to start Vivado.

```bash
# source run script
source /tools/Xilinx/2025.1/Vivado/settings64.sh

# run vivado
vivado &
```

### Install Chisel
Chisel (Constructing Hardware In a Scala Embedded Language) is a hardware construction language
embedded in the high-level programming language Scala. Chisel is a library of special class
definitions, predefined objects, and usage conventions within Scala, so when you write Chisel you
are actually writing a Scala program that constructs a hardware graph. Chisel is a Scala library and
compiler plugin.

```bash
# install java
sudo dnf install -y java-21-openjdk-devel
java -version

# install sbt
curl -s -L https://github.com/sbt/sbt/releases/download/v1.9.7/sbt-1.9.7.tgz | tar xvz

#cehck if verilator is insatlled
verilator --version
```

### Install Platform IO
```bash
# install dependencies
sudo dnf install -y python3 python3-pip git curl

# install platformio
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py

# This creates an isolated environment in ~/.platformio/penv.
ls $HOME/.platformio/

# Then add it to your PATH in .bashrc or .zshrc
export PATH="$HOME/.platformio/penv/bin:$PATH"

platformio --version
```

#### Install udev rules (so you can flash without sudo)
```bash
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Then add yourself to the serial-port group. On Fedora that’s dialout (and sometimes uucp):
sudo usermod -aG dialout,uucp $USER
```

Log out and back in for this to take effect.

### Install RISC V GNU toolchains








[def]: #1-download-and-install-fedora
