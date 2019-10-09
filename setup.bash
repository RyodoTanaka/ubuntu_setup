#!/bin/bash

root_pwd_dir=$(pwd)

# ディレクトリを英語に
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Caps を Ctrl に
dconf reset /org/gnome/settings-daemon/plugins/keyboard/active
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"

#レポジトリの追加
#gimp
yes | sudo add-apt-repository ppa:otto-kesselgulasch/gimp
#Oracle Java 8
yes | sudo add-apt-repository ppa:webupd8team/java

#indicator-sensor
yes | sudo apt-add-repository ppa:alexmurray/indicator-sensors

#Update
sudo apt update

#必須のアプリインストール
sudo apt -yV install terminator
sudo apt -yV install ubuntu-tweak
sudo apt -yV install compizconfig-settings-manager
sudo apt -yV install unity-tweak-tool
sudo apt -yV install gnome-tweak-tool
sudo apt -yV install nkf
sudo apt -yV install gimp
sudo apt -yV install inkscape
sudo apt -yV install gnuplot-x11
sudo apt -yV install vlc
sudo apt -yV install unrar rar
sudo apt -yV install gparted
sudo apt -yV install oracle-java8-installer
sudo apt -yV install python-software-properties
sudo apt -yV install git
sudo apt -yV install git-flow
sudo apt -yV install openssh-server
sudo apt -yV install build-essential
sudo apt -yV install xdotool
sudo apt -yV install libgif-dev
sudo apt -yV install cython
sudo apt -yV install cython3

sudo apt -yV install fontforge
sudo apt -yV install indicator-sensors
sudo apt -yV install wine
sudo apt -yV install dropbox
sudo apt -yV install keepass2

#terminator設定
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
sudo update-alternatives --config x-terminal-emulator

# Bash Extend
cd ~
git clone https://github.com/RyodoTanaka/.bash_extend.git
git clone https://github.com/RyodoTanaka/.rosaddress.git
echo "source ~/.bash_extend/ros.bash melodic" >> ~/.bashrc
echo "source ~/.rosaddress/rosaddress.bash" >> ~/.bashrc
echo "source ~/.bash_extend/ud.bash" >> ~/.bashrc
cd ${root_pwd_dir}
# Emacs
source ${root_pwd_dir}/Emacs/installer.bash --auto
# OpenCV
# source ${root_pwd_dir}/OpenCV/installer.bash 2.4.11 --auto
# PCL
source ${root_pwd_dir}/PCL/installer.bash --auto
# ROS
source ${root_pwd_dir}/ROS/installer.bash melodic --auto
# TeX
source ${root_pwd_dir}/TeX/installer.bash --auto
