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
RUN wget wget https://github.com/yuru7/HackGen/releases/download/v1.2.1/HackGen_v1.2.1.zip -P /home/$user_name/.fonts/
RUN unzip /home/$user_name/.fonts//HackGen_v1.2.1.zip -d /home/$user_name/.fonts
# CMakeのインストール
RUN mkdir /home/$user_name/.emacs.d/lib
RUN git clone -b release --depth=1 https://github.com/Kitware/CMake.git /home/$user_name/.emacs.d/lib/CMake
RUN /home/$user_name/.emacs.d/lib/CMake/bootstrap
RUN make -j`nproc` -C /home/$user_name/.emacs.d/lib/CMake
RUN make -j`nproc` -C /home/$user_name/.emacs.d/lib/CMake install
RUN echo "alias cmake=/usr/local/bin/cmake" >> /home/$user_name/.bashrc
# gcc>=7.2のインストール
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt update
RUN apt -y install gcc7
# cclsのインストール
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls /home/$user_name/.emacs.d/lib/ccls
RUN wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -P /home/$user_name/.emacs.d/lib/ccls
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
