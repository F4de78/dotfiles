sudo dnf update
sudo dnf upgrade

sudo dnf install zsh oh-my-zsh spacefm openbox vlc -y

#vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y

#theme
dnf install qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
rpm -i /path/to/ocs-url*.rpm

sudo cp -r openbox ~/.config