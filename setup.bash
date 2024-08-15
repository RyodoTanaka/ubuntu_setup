#!/bin/bash

root_pwd_dir=$(pwd)

# ディレクトリを英語に
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Caps を Ctrl に
dconf reset /org/gnome/settings-daemon/plugins/keyboard/active
dconf write /org/gnome/desktop/input-sources/xkb-options "['ctrl:nocaps']"

#Update
sudo apt update

#必須のアプリインストール
sudo apt -yV install terminator
sudo apt -yV install nkf
sudo apt -yV install gimp
sudo apt -yV install inkscape
sudo apt -yV install gnuplot-x11
sudo apt -yV install vlc
sudo apt -yV install unrar rar
sudo apt -yV install gparted
sudo apt -yV install git
sudo apt -yV install git-lfs
sudo apt -yV install git-flow
sudo apt -yV install openssh-server
sudo apt -yV install openssh-client
sudo apt -yV install build-essential
sudo apt -yV install xdotool
sudo apt -yV install libgif-dev
sudo apt -yV install cython3
sudo apt -yV install python3
sudo apt -yV install python3-pip
sudo apt -yV install python-is-python3
sudo apt -yV install fontforge
sudo apt -yV install keepassxc
sudo apt -yV install emacs
sudo apt -yV install emacs-mozc
# TeX
sudo apt -yV install texlive-full


# ROS


#terminator設定
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator
gsettings set org.gnome.desktop.default-applications.terminal exec-arg "-x"
sudo update-alternatives --config x-terminal-emulator

# TeX
source ${root_pwd_dir}/TeX/installer.bash yes

source ${root_pwd_dir}/ROS/humble_installer.bash
