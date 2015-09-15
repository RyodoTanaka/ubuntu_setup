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
tar -xvzf ${pwd_dir}/data/install-tl-unx.tar.gz 
cd install-tl-*

echo "Start Installer"
sudo ./install-tl << EOF
I
EOF

echo "Set Path & Environments"

echo "# TeX Live" >> ~/.bashrc
echo "export INFOPATH=\$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info" >> ~/.bashrc
echo "export MANPATH=\$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/local/texlive/2015/bin/x86_64-linux" >> ~/.bashrc

cd ${pwd_dir}
sudo /usr/local/texlive/2015/bin/x86_64-linux/tlmgr path add
sudo mkdir -p /usr/local/texlive/texmf-local/web2c
sudo cp ./texmf.cnf /usr/local/texlive/texmf-local/web2c/texmf.cnf
sudo mktexlsr
sudo kanji-config-updmap-sys ipaex
cp latexmkrc ~/.latexmkrc
echo "Tex Install Finished !!"
