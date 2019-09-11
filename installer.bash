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

sudo apt -yV install emacs24
sudo apt -yV install emacs-mozc emacs-mozc-bin
cd ~
git clone https://github.com/RyodoTanaka/.emacs.d.git
cd ${pwd_dir}
