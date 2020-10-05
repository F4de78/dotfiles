#upgrade
echo '\033[1;31;1m===========update repository==========='
sudo dnf update -y
sudo dnf upgrade -y
echo '\033[1;31;1m===========done.==========='

#dnf install
echo '\033[1;31;1m===========install package==========='
sudo dnf install zsh oh-my-zsh spacefm openbox vlc -y

echo '\033[1;31;1m===========vscodium==========='
#vscodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg 
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium -y
echo '\033[1;31;1m===========theme installer==========='
#theme installer
dnf install qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
rpm -i /path/to/ocs-url*.rpm
echo '\033[1;31;1m===========done.==========='

echo '\033[1;31;1m===========copy files==========='
#copy files 
sudo cp -r openbox ~/.config
cp  .zshrc ~/
cp  .bashrc ~/
echo '\033[1;31;1m===========done.==========='