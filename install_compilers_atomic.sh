#!/bin/bash

# install git
rpm-ostree install git
# install C/C++
rpm-ostree install gcc gcc-c++
# install autoconf
rpm-ostree install autoconf automake
# install cmake
rpm-ostree install cmake
# install python
rpm-ostree install python3 python3-pip
rpm-ostree install python3-virtualenv
# install lua
rpm-ostree install lua
# install java
rpm-ostree install java-openjdk
# install rust
rpm-ostree install rustup
rustup-init
# install latex
rpm-ostree install texlive-scheme-full
# install nodejs
rpm-ostree install nodejs

sudo dnf install -y rustup
rustup-init
# install typst
sudo dnf copr enable claaj/typst
sudo dnf install -y typst
# install latex
sudo dnf install -y texlive-scheme-full
# install nodejs
sudo dnf install -y nodejs


# # ----- install docker
# sudo dnf install dnf-plugins-core
# # add the docker-ce repository
# sudo dnf config-manager addrepo --from-repofile="https://download.docker.com/linux/fedora/docker-ce.repo"
# # install the docker engine
# sudo dnf install docker-ce docker-ce-cli containerd.io
# # start the docker service
# sudo systemctl start docker
# # verify docker was correctly installed
# sudo docker run hello-world
# # start docker when system boots up
# sudo systemctl enable docker
#
# # setting up running run docker without sudo
# # create docker group
# sudo groupadd docker
# # add your user to docker group
# sudo gpasswd -a ${USER} docker
# # activate changes and restart docker
# sudo systemctl restart docker
#
# # running docker commands without sudo
# echo "Running hello-world without sudo"
# echo " "
# docker run hello-world
# echo " "
# echo "Reboot computer to run docker without sudo"
