#!/bin/bash

if [ "$2" = "--auto" ]; then
	auto_flg=1
else
	auto_flg=0
fi

echo "
 ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗██╗   ██╗                      
██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝██║   ██║                      
██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║     ██║   ██║                      
██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║     ╚██╗ ██╔╝                      
╚██████╔╝██║     ███████╗██║ ╚████║╚██████╗ ╚████╔╝                       
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚═══╝                        
                                                                          
    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝"

# インストールするOpenCVのバージョン(Default)
OPENCV_VERSION="3.0.0"

# 現在のディレクトリを記憶しておく
pwd_dir=$(pwd)

# OpenCVのバージョンチェック & インストールの意思確認
if [ -e /usr/local/include/opencv2/core/version.hpp ]; then
	cv_epoch_num=$(less /usr/local/include/opencv2/core/version.hpp | grep "#define CV_VERSION_EPOCH" | sed -e "s/#define CV_VERSION_EPOCH    //g")
	cv_major_num=$(less /usr/local/include/opencv2/core/version.hpp | grep "#define CV_VERSION_MAJOR" | sed -e "s/#define CV_VERSION_MAJOR    //g")
	cv_minor_num=$(less /usr/local/include/opencv2/core/version.hpp | grep "#define CV_VERSION_MINOR" | sed -e "s/#define CV_VERSION_MINOR    //g")
	cv_revision_num=$(less /usr/local/include/opencv2/core/version.hpp | grep "#define CV_VERSION_REVISION" | sed -e "s/#define CV_VERSION_REVISION //g")

	# epoch, revision が有るかどうか
	if [ -n "${cv_epoch_num}" ]; then
		cv_epoch_num=${cv_epoch_num}.
		cv_revision_num=""
	fi
	if [ -n "${cv_revision_num}" ]; then
		cv_revision_num=.${cv_revision_num}
	fi
	
	cv_version=${cv_epoch_num}${cv_major_num}.${cv_minor_num}${cv_revision_num}
	echo "You already have OpenCV "${cv_version}
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
	echo "There is no OpenCV environment ... Install it."
fi

# 引数によるバージョン確認
if [ -e $1 ]; then
	echo "Install : OpenCV "${OPENCV_VERSION}" (Default)"
else
	echo "Install : OpenCV "$1
	OPENCV_VERSION=$1
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
	
# 最初は前提ソフトウェアのインストール
sudo apt-get -yV install build-essential
sudo apt-get -yV install opencl-headers
sudo apt-get -yV install libjpeg-dev
sudo apt-get -yV install libopenjpeg-dev
sudo apt-get -yV install jasper
sudo apt-get -yV install libjasper-dev libjasper-runtime
sudo apt-get -yV install libpng12-dev
sudo apt-get -yV install libpng++-dev libpng3
sudo apt-get -yV install libpnglite-dev libpngwriter0-dev libpngwriter0c2
sudo apt-get -yV install libtiff-dev libtiff-tools pngtools
sudo apt-get -yV install zlib1g-dev zlib1g-dbg
sudo apt-get -yV install v4l2ucp
sudo apt-get -yV install python
sudo apt-get -yV install autoconf
sudo apt-get -yV install libtbb2 libtbb-dev
sudo apt-get -yV install libeigen2-dev
sudo apt-get -yV install cmake
sudo apt-get -yV install openexr
sudo apt-get -yV install gstreamer-plugins-*
sudo apt-get -yV install freeglut3-dev
sudo apt-get -yV install libglui-dev
sudo apt-get -yV install libavc1394-dev libdc1394-22-dev libdc1394-utils
sudo apt-get -yV install libgtk2.0-dev
sudo apt-get -yV install pkg-config
# Eigen (読み方：アイガン)
sudo apt-get -yV install libeigen3-dev
# OpenNI
sudo apt-get -yV install libopenni-dev
# Python Lib
sudo apt-get -yV install libpython2.7-dev
# ビデオ関係のパッケージ
sudo apt-get -yV install libxine-dev
sudo apt-get -yV install libxvidcore-dev
sudo apt-get -yV install libva-dev
sudo apt-get -yV install libssl-dev
sudo apt-get -yV install libv4l-dev
sudo apt-get -yV install libvo-aacenc-dev
sudo apt-get -yV install libvo-amrwbenc-dev
sudo apt-get -yV install libvorbis-dev
sudo apt-get -yV install libvpx-dev
sudo apt-get -yV install libavcodec-dev
sudo apt-get -yV install libavformat-dev
sudo apt-get -yV install libavutil-dev
sudo apt-get -yV install libswscale-dev

cd ~/Downloads/
if [ -e ~/Downloads/opencv-${OPENCV_VERSION} ]; then
	echo "File opencv-${OPENCV_VERSION} exists"
else
	wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/${OPENCV_VERSION}/opencv-${OPENCV_VERSION}.zip
	A | unzip opencv-${OPENCV_VERSION}.zip
fi
cd opencv-${OPENCV_VERSION}

cmake -DBUILD_DOCS=ON -DBUILD_EXAMPLES=ON -DCMAKE_BUILD_TYPE=RELEASE -DWITH_TBB=ON -DINSTALL_C_EXAMPLES=ON -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_OPENNI=ON -DWITH_UNICAP=ON -DWITH_V4L=ON -DWITH_XINE=ON -DWITH_OPENEXR=ON -DBUILD_OPENEXR=ON .

core_num=$(less /proc/cpuinfo | grep "cpu cores" | sed "s/cpu cores\t: //g")

make -j${core_num: -1} -l
sudo make install
sudo ldconfig

cd ${pwd_dir}
echo "OpenCV "${OPENCV_VERSION}" install finished !!"
