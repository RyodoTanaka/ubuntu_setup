#!/bin/bash
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

script_path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
pwd_path=$(pwd)

version = 26.1 

# Check installation version
if [ -e $1 ]; then
	echo "Install : Emacs "${version}" (Default)"
else
	echo "Install : Emacs "$1
	version=$1
fi

# Check auto install
if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

if [ ${auto_flg} -eq 0 ]; then
    printf "Ready to Install. ? (yes/no) : "
    read -r start_flg
    if [ ${start_flg} != "y" -a ${start_flg} != "yes" ]; then
	echo "OK. Stop to install."
	return 0
    fi
fi

# install emacs${version}
# install dependencies
sudo apt -yV install libgnutls28-dev
sudo apt -yV install libxpm-dev


cd ${script_path}/source
wget https://ftp.gnu.org/pub/gnu/emacs/emacs-${version}.tar.gz
tar -xvzf emacs-${version}.tar.gz
cd ${script_path}/source/emacs-${version}
./configure
make -j`nproc`
sudo make -j`nproc` install 
cd ${pwd_path}

# set ~/.emacs.d
cd ~
git clone -b master https://github.com/RyodoTanaka/.emacs.d.git
cd ${pwd_path}
