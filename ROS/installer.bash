#!/bin/bash

pwd_dir=$(pwd)

Version="indigo"

if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi



echo "
     ██████╗  ██████╗  ██████╗                                        
    ██╔═══██╗██╔═══██╗██╔═══██╗                                       
    ██║   ██║██║   ██║██║   ██║                                       
    ██║   ██║██║   ██║██║   ██║                                       
    ╚██████╔╝╚██████╔╝╚██████╔╝                                       
     ╚═════╝  ╚═════╝  ╚═════╝                                        
                                                                      
     ██████╗  ██████╗  ██████╗         ██████╗  ██████╗ ███████╗      
    ██╔═══██╗██╔═══██╗██╔═══██╗        ██╔══██╗██╔═══██╗██╔════╝      
    ██║   ██║██║██╗██║██║   ██║        ██████╔╝██║   ██║███████╗      
    ██║   ██║██║██║██║██║   ██║        ██╔══██╗██║   ██║╚════██║      
    ╚██████╔╝╚█║████╔╝╚██████╔╝        ██║  ██║╚██████╔╝███████║      
     ╚═════╝  ╚╝╚═══╝  ╚═════╝         ╚═╝  ╚═╝ ╚═════╝ ╚══════╝      
                                                                      
     ██████╗  ██████╗  ██████╗                                        
    ██╔═══██╗██╔═══██╗██╔═══██╗                                       
    ██║   ██║██║   ██║██║   ██║                                       
    ██║   ██║██║   ██║██║   ██║                                       
    ╚██████╔╝╚██████╔╝╚██████╔╝                                       
     ╚═════╝  ╚═════╝  ╚═════╝                                        
                                                                                                                                           "

pre_version=$(ls /opt/ros/ > /dev/null)

if [ -n "$pre_version" ]; then
	echo "Yor already have ROS : "${pre_version}
	echo ""
	if [ ${auto_flg} -eq 0 ]; then
		printf "Continue to install ? (yes/no) : "
		read -r response
		if [ ${response} = "y" -o ${response} = "yes" ];then
			echo "OK. Continue to install."
		else
			echo "OK. Stoop to install."
			cd ${pwd_dir}
			return 0
		fi
	fi
else
	echo "There is no ROS environment ... Install it."
fi

# 引数によるバージョン確認
if [ -e $1 ]; then
	echo "Install : ROS "${Version}" (Default)"
else
	echo "Install : ROS "$1
	Version=$1
fi

if [ ${auto_flg} -eq 0 ]; then
	printf "Ready to Install. Start ? (yes/no) : "
	read -r start_flg
	if [ ${start_flg} != "y" -a ${start_flg} != "yes" ]; then
		echo "OK. Stop to install."
		cd ${pwd_dir}
		return 0
	fi
fi

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
yes | sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update

sudo apt-get install --force-yes -yV ros-${Version}-desktop-full
sudo apt-get install -yV python-catkin-tools
sudo rosdep init
rosdep update

sudo apt-get install --force-yes -yV python-rosinstall

echo "ROS Installer Finished !!"
