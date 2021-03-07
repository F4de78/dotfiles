#!/bin/bash

$DISTROINFO
$DISTRO
$PM

#get distro name
DISTROINFO=$( (lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null| head -n1);

if [[ $DISTROINFO == *"Fedora"* ]]; then
  PM="dnf"
  DISTRO="Fedora"
elif [[ $DISTROINFO == *"Debian"* ]]; then
  PM="apt"
  DISTRO="Debian"
else
  echo "Distro not supported"
  exit 
fi

sudo $PM -y update 
sudo $PM -y upgrade

sudo $PM install -y terminator spacefm openbox ob-conf vlc flatpak zsh chsh feh go git qpdf leafpad

#openbox set as default
openbox --replace & exit .

#set default applications

xdg-mime default spacefm.desktop inode/directory
xdg-mime default qpdf.desktop application/pdf
xdg-mime default feh.desktop image/*

#vscodium
if (( DISTRO == "Fedora" )); then
  sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
  printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
  sudo dnf install -y codium
elif (( DISTRO == "Debian" )); then
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dear
  echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
  sudo apt update && sudo apt install codium 
fi

#theme 
sudo $PM install -y qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
sudo $PM install arc-theme

#gdb GEF
touch ~/.gdbinit #not sure if needed
sudo $PM install -y curl
sh -c "$(curl -fsSL http://gef.blah.cat/sh)"

#copy files 
cp -r openbox ~/.config
cp -r xfce4 ~/.config
cp -r terminator ~/.config
cp -r rofi ~/.config
cp -r .zshrc ~/
cp -r .bashrc ~/
cp -r .vimrc ~/
cp -r .gdbinit ~/

#oh-my-zsh & set zsh as default
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

#todo
echo "to install manualy: qrcp, arc-theme from opendesktop"


 
