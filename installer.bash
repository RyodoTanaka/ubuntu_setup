#!/bin/bash

pwd_dir=$(pwd)

if [ "$1" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

echo "
  ______                                 
 |  ____|                                
 | |__   _ __ ___   __ _  ___ ___        
 |  __| | '_ ' _ \ / _' |/ __/ __|       
 | |____| | | | | | (_| | (__\__ \       
 |______|_| |_| |_|\__,_|\___|___/       
 |_   _|         | |      | | |          
   | |  _ __  ___| |_ __ _| | | ___ _ __ 
   | | | '_ \/ __| __/ _' | | |/ _ \ '__|
  _| |_| | | \__ \ || (_| | | |  __/ |   
 |_____|_| |_|___/\__\__,_|_|_|\___|_|   
                                         
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


sudo apt-get remove emacs
sudo apt-get remove emacs23
sudo apt-get build-dep emacs24
                                       
# Emacs
if [ ! -e  ${pwd_dir}/source/emacs* ];then
    mkdir -p ${pwd_dir}/source
    cd ${pwd_dir}/source
    wget http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.4.tar.gz
    tar -xf emacs-24.4.tar.gz
fi
cd ${pwd_dir}/source/emacs-24.4/
./configure
make
sudo make install
cd ${pwd_dir}
