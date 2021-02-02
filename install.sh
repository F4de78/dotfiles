#upgrade

sudo dnf update -y
sudo dnf upgrade -y

#dnf install

sudo dnf install -y spacefm #file mangaer
sudo dnf install -y openbox
sudo dnf install -y ob-conf
sudo dnf install -y vlc
sudo dnf install -y flatpak
sudo dnf install -y zsh
sudo dnf install -y chsh
sudo dnf install -y feh
sudo dnf install -y go
sudo dnf install -y git
sudo dnf install -y qpdf #pdf
sudo dnf install -y leafpad
#openbox set as default
openbox --replace & exit .

#set default applications

xdg-mime default spacefm.desktop inode/directory
xdg-mime default qpdf.desktop application/pdf
xdg-mime default feh.desktop image/*

#vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install -y codium

#theme 
sudo dnf install -y qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
#https://www.opendesktop.org/p/1136805/

#gdb GEF
touch ~/.gdbinit #not sure if needed
sudo dnf install -y curl
sh -c "$(curl -fsSL http://gef.blah.cat/sh)"

#copy files 
cp -r openbox ~/.config
cp -r xfce4 ~/.config
cp -r .zshrc ~/
cp -r .bashrc ~/
cp -r .vimrc ~/
cp -r .gdbinit

#oh-my-zsh & set zsh as default
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

#todo
echo "to install manualy: qrcp, arc-theme from opendesktop"

