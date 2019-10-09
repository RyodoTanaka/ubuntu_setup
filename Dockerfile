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

# emacsのインストール
RUN add-apt-repository ppa:kelleyk/emacs
RUN apt update
RUN apt -y install emacs26 emacs26-common
RUN git clone https://github.com/RyodoTanaka/.emacs.d.git /home/ryodo/.emacs.d

