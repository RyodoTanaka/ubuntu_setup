#!/bin/bash

pwd_dir=$(pwd)

if [ "$1" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

echo "
                    ██████╗  ██████╗██╗                               
                    ██╔══██╗██╔════╝██║                               
                    ██████╔╝██║     ██║                               
                    ██╔═══╝ ██║     ██║                               
                    ██║     ╚██████╗███████╗                          
                    ╚═╝      ╚═════╝╚══════╝                          
                                                                      
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝


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
yes | sudo add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt install -yV libpcl-all
sudo apt insstall -yV pcl-tools
