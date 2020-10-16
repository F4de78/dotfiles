#upgrade

sudo dnf update -y
sudo dnf upgrade -y


#dnf install

sudo dnf install spacefm openbox vlc flatpak zsh chsh -y

#oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

#vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y

#theme dnf install qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
rpm -i /path/to/ocs-url*.rpm

#copy files 
sudo cp -r openbox ~/.config
cp  .zshrc ~/
cp  .bashrc ~/

