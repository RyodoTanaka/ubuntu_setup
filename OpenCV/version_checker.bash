#!/bin/bash

echo "
 ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗██╗   ██╗            
██╔═══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝██║   ██║            
██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║     ██║   ██║            
██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║     ╚██╗ ██╔╝            
╚██████╔╝██║     ███████╗██║ ╚████║╚██████╗ ╚████╔╝             
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚═══╝              
                                                                
    ██╗   ██╗███████╗██████╗ ███████╗██╗ ██████╗ ███╗   ██╗     
    ██║   ██║██╔════╝██╔══██╗██╔════╝██║██╔═══██╗████╗  ██║     
    ██║   ██║█████╗  ██████╔╝███████╗██║██║   ██║██╔██╗ ██║     
    ╚██╗ ██╔╝██╔══╝  ██╔══██╗╚════██║██║██║   ██║██║╚██╗██║     
     ╚████╔╝ ███████╗██║  ██║███████║██║╚██████╔╝██║ ╚████║     
      ╚═══╝  ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝     
                                                                
         ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗██████╗ 
        ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝██╔══██╗
        ██║     ███████║█████╗  ██║     █████╔╝ █████╗  ██████╔╝
        ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██╔══╝  ██╔══██╗
        ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████╗██║  ██║
         ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                                

"

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
	echo "Your OpenCV Version is : "${cv_version}
else
	echo "There is no OpenCV environment ... Install it."
fi

echo ""
