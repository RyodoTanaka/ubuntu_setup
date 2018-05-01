#!/bin/bash

pwd_dir=$(pwd)

if [ "$1" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi


echo "          
       _____     __ __             
      |_   _|___|  |  |            
        | | | -_|-   -|            
        |_| |___|__|__|            
                                   
                                   
 _____         _       _ _         
|     |___ ___| |_ ___| | |___ ___ 
|-   -|   |_ -|  _| .'| | | -_|  _|
|_____|_|_|___|_| |__,|_|_|___|_|  
                                                                                               "

if [ ${auto_flg} -eq 0 ]; then
	printf "Ready to Install. Start ? (yes/no) : "
	read -r start_flg
	if [ ${start_flg} != "y" -a ${start_flg} != "yes" ]; then
		echo "OK. Stop to install."
		cd ${pwd_dir}
		return 0
	fi
fi

echo "Get depend packages"
# Tex Live Installer のためのパッケージ
sudo apt-get install -yV perl
sudo apt-get install -yV perl-tk

echo "Start unpack"
sudo apt-get install -yV texlive-full
sudo apt-get install -yV texlive-lang-cjk
sudo apt-get install -yV texlive-science
sudo apt-get install -yV texlive-math-extra 
sudo apt-get install -yV xdvik-ja

echo "Start Installer"
sudo cp ./texmf.cnf /usr/local/texlive/texmf-local/web2c/texmf.cnf
sudo mktexlsr
sudo kanji-config-updmap-sys ipaex
cp latexmkrc ~/.latexmkrc
echo "Tex Install Finished !!"
