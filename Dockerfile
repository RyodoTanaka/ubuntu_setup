FROM osrf/ros:melodic-desktop-full
LABEL maintainer "RyodoTanaka"

##################
## 初期設定関係 ##
##################
# 引数でユーザー名を指定
ARG user_name="ryodo"
# ROOTにパスワードをセット
RUN echo 'root:root' | chpasswd
# sudoをインストール
RUN apt update
RUN apt install -y sudo
# ユーザを作成
RUN useradd $user_name
RUN echo "$user_name:$user_name" | chpasswd
RUN echo "$user_name    ALL=(ALL)       ALL" >> /etc/sudoers
# インストール済みのパッケージをアップデート
RUN apt update && apt -y upgrade && sudo apt -y dist-upgrade
# apt-add-repository出来るようにするために追加
RUN apt -y install software-properties-common

#################################
## 各種パッケージのインストール ##
#################################
# git
RUN apt -y install git
# network-tool
RUN apt -y install net-tools
# rar unrar
RUN apt -y install unrar
RUN apt -y install rar
# openssh
RUN apt -y install openssh-server
# build-essential
RUN apt -y install build-essential
# wget
RUN apt -y install wget

#########################
## Emacsのインストール ##
#########################
# 最新Emacsのインストール
RUN add-apt-repository ppa:kelleyk/emacs
RUN apt update
RUN apt -y install emacs26 emacs26-common
# Emacsの設定のインストール
RUN git clone https://github.com/RyodoTanaka/.emacs.d.git /home/$user_name/.emacs.d
# 各種必要パッケージのインストール
# HackGenのインストール（フォント）
RUN mkdir /home/$user_name/.fonts
RUN wget https://github.com/yuru7/HackGen/releases/download/v1.2.1/HackGen_v1.2.1.zip -P /home/$user_name/.fonts
RUN unzip /home/$user_name/.fonts//HackGen_v1.2.1.zip -d /home/$user_name/.fonts

# CMake3.15.4のインストール
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4-Linux-x86_64.sh -P /usr/local/share 
RUN cd /usr/local/share/ && yes | bash cmake-3.15.4-Linux-x86_64.sh
RUN cd /usr/local/share/ && ln -s cmake-3.15.2-Linux-x86_64/bin/* /usr/local/bin/

# gcc>=7.2のインストール
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update
RUN apt -y install gcc-7
# cclsのインストール
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls /home/$user_name/.emacs.d/lib/ccls
RUN wget http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -P /home/$user_name/.emacs.d/lib/ccls
RUN tar xf /home/$user_name/.emacs.d/lib/ccls/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -C /home/$user_name/.emacs.d/lib/ccls
RUN cd /home/$user_name/.emacs.d/lib/ccls && cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
RUN cd /home/$user_name/.emacs.d/lib/ccls/ cmake --build Release --target install

###################################
## bash関係のコマンドインストール ##
###################################
RUN git clone https://github.com/RyodoTanaka/.bash_extend.git /home/$user_name/.bash_extend
RUN echo "source /home/$user_name/.bash_extend/ud.bash" >> /home/$user_name/.bashrc
RUN echo "source /home/$user_name/.bash_extend/ros.bash melodic" >> /home/$user_name/.bashrc
RUN echo "source /home/$user_name/.bash_extend/rosaddress.bash" >> /home/$user_name/.bashrc

#######################
## Qt5のインストール ##
#######################
RUN add-apt-repository ppa:beineri/opt-qt-5.12.0-bionic
RUN apt update
RUN apt -y install qt512base
RUN apt -y install qt5-default
RUN apt -y install qt5-qmake-bin
RUN apt -y install qt512gamepad
RUN apt -y install qt5-gtk-platformtheme
RUN apt -y install qt5-qmltooling-plugins
RUN apt -y install qt5-assistant
RUN apt -y install qt5-qmake
RUN apt -y install qt5-style-plugins
RUN apt -y install libqt5concurrent5
RUN apt -y install libqt5opengl5
RUN apt -y install libqt5sensors5
RUN apt -y install libqt5webkit5
RUN apt -y install libqt5core5a
RUN apt -y install libqt5opengl5-dev
RUN apt -y install libqt5sql5
RUN apt -y install libqt5webkit5-dev
RUN apt -y install libqt5dbus5
RUN apt -y install libqt5positioning5
RUN apt -y install libqt5sql5-sqlite
RUN apt -y install libqt5widgets5
RUN apt -y install libqt5designer5
RUN apt -y install libqt5printsupport5
RUN apt -y install libqt5svg5
RUN apt -y install libqt5x11extras5
RUN apt -y install libqt5designercomponents5
RUN apt -y install libqt5qml5
RUN apt -y install libqt5test5
RUN apt -y install libqt5x11extras5-dev
RUN apt -y install libqt5gui5
RUN apt -y install libqt5quick5
RUN apt -y install libqt5webchannel5
RUN apt -y install libqt5xml5
RUN apt -y install libqt5help5
RUN apt -y install libqt5quickparticles5
RUN apt -y install libqt5webenginecore5       
RUN apt -y install libqt5keychain1
RUN apt -y install libqt5quicktest5
RUN apt -y install libqt5webengine-data       
RUN apt -y install libqt5network5
RUN apt -y install libqt5quickwidgets5
RUN apt -y install libqt5webenginewidgets5 

#######################
## PCLのインストール ##
######################
RUN add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
RUN apt update
RUN apt install -y libpcl-all
RUN apt install -y pcl-tools

#######################
## TeXのインストール ##
#######################
RUN apt install -y asymptote 
RUN apt install -y biber 
RUN apt install -y cm-super
RUN apt install -y cm-super-minimal
RUN apt install -y context
RUN apt install -y context-modules
RUN apt install -y dvipng
RUN apt install -y feynmf
RUN apt install -y fragmaster
RUN apt install -y latex-cjk-all
RUN apt install -y latex-cjk-chinese
RUN apt install -y latex-cjk-chinese-arphic-bkai00mp 
RUN apt install -y latex-cjk-chinese-arphic-bsmi00lp
RUN apt install -y latex-cjk-chinese-arphic-gbsn00lp
RUN apt install -y latex-cjk-chinese-arphic-gkai00mp
RUN apt install -y latex-cjk-common
RUN apt install -y latex-cjk-japanese
RUN apt install -y latex-cjk-japanese-wadalab
RUN apt install -y latex-cjk-korean
RUN apt install -y latex-cjk-thai
RUN apt install -y latexmk
RUN apt install -y libtext-bibtex-perl
RUN apt install -y lmodern
RUN apt install -y prerex
RUN apt install -y preview-latex-style
RUN apt install -y purifyeps
RUN apt install -y tex-common
RUN apt install -y tex-gyre
RUN apt install -y texinfo
RUN apt install -y texlive
RUN apt install -y texlive-base
RUN apt install -y texlive-bibtex-extra
RUN apt install -y texlive-binaries
RUN apt install -y texlive-extra-utils
RUN apt install -y texlive-font-utils
RUN apt install -y texlive-fonts-extra
RUN apt install -y texlive-fonts-extra-doc
RUN apt install -y texlive-fonts-extra-links
RUN apt install -y texlive-fonts-recommended
RUN apt install -y texlive-fonts-recommended-doc
RUN apt install -y texlive-formats-extra
RUN apt install -y texlive-full
RUN apt install -y texlive-games
RUN apt install -y texlive-generic-recommended
RUN apt install -y texlive-humanities
RUN apt install -y texlive-humanities-doc
RUN apt install -y texlive-lang-arabic
RUN apt install -y texlive-lang-chinese
RUN apt install -y texlive-lang-cjk
RUN apt install -y texlive-lang-cyrillic
RUN apt install -y texlive-lang-czechslovak
RUN apt install -y texlive-lang-english
RUN apt install -y texlive-lang-european
RUN apt install -y texlive-lang-french
RUN apt install -y texlive-lang-german
RUN apt install -y texlive-lang-greek
RUN apt install -y texlive-lang-italian
RUN apt install -y texlive-lang-japanese
RUN apt install -y texlive-lang-korean
RUN apt install -y texlive-lang-other
RUN apt install -y texlive-lang-polish
RUN apt install -y texlive-lang-portuguese
RUN apt install -y texlive-lang-spanish
RUN apt install -y texlive-latex-base
RUN apt install -y texlive-latex-base-doc
RUN apt install -y texlive-latex-extra
RUN apt install -y texlive-latex-extra-doc
RUN apt install -y texlive-latex-recommended
RUN apt install -y texlive-latex-recommended-doc
RUN apt install -y texlive-luatex
RUN apt install -y texlive-metapost
RUN apt install -y texlive-metapost-doc
RUN apt install -y texlive-music
RUN apt install -y texlive-pictures
RUN apt install -y texlive-pictures-doc
RUN apt install -y texlive-plain-generic
RUN apt install -y texlive-pstricks
RUN apt install -y texlive-pstricks-doc
RUN apt install -y texlive-publishers
RUN apt install -y texlive-publishers-doc
RUN apt install -y texlive-science
RUN apt install -y texlive-science-doc
RUN apt install -y texlive-xetex
RUN apt install -y tipa vprerex
RUN apt install -y xdvik-ja 
COPY latexmkrc /home/$user_name/.latexmkrc
