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

sudo apt install -yV asymptote 
sudo apt install -yV biber 
sudo apt install -yV cm-super
sudo apt install -yV cm-super-minimal
sudo apt install -yV context
sudo apt install -yV context-modules
sudo apt install -yV dvipng
sudo apt install -yV feynmf
sudo apt install -yV fragmaster
sudo apt install -yV latex-cjk-all
sudo apt install -yV latex-cjk-chinese
sudo apt install -yV latex-cjk-chinese-arphic-bkai00mp 
sudo apt install -yV latex-cjk-chinese-arphic-bsmi00lp
sudo apt install -yV latex-cjk-chinese-arphic-gbsn00lp
sudo apt install -yV latex-cjk-chinese-arphic-gkai00mp
sudo apt install -yV latex-cjk-common
sudo apt install -yV latex-cjk-japanese
sudo apt install -yV latex-cjk-japanese-wadalab
sudo apt install -yV latex-cjk-korean
sudo apt install -yV latex-cjk-thai
sudo apt install -yV latexmk
sudo apt install -yV libtext-bibtex-perl
sudo apt install -yV lmodern
sudo apt install -yV prerex
sudo apt install -yV preview-latex-style
sudo apt install -yV purifyeps
sudo apt install -yV tex-common
sudo apt install -yV tex-gyre
sudo apt install -yV texinfo
sudo apt install -yV texlive
sudo apt install -yV texlive-base
sudo apt install -yV texlive-bibtex-extra
sudo apt install -yV texlive-binaries
sudo apt install -yV texlive-extra-utils
sudo apt install -yV texlive-font-utils
sudo apt install -yV texlive-fonts-extra
sudo apt install -yV texlive-fonts-extra-doc
sudo apt install -yV texlive-fonts-extra-links
sudo apt install -yV texlive-fonts-recommended
sudo apt install -yV texlive-fonts-recommended-doc
sudo apt install -yV texlive-formats-extra
sudo apt install -yV texlive-full
sudo apt install -yV texlive-games
sudo apt install -yV texlive-generic-recommended
sudo apt install -yV texlive-humanities
sudo apt install -yV texlive-humanities-doc
sudo apt install -yV texlive-lang-arabic
sudo apt install -yV texlive-lang-chinese
sudo apt install -yV texlive-lang-cjk
sudo apt install -yV texlive-lang-cyrillic
sudo apt install -yV texlive-lang-czechslovak
sudo apt install -yV texlive-lang-english
sudo apt install -yV texlive-lang-european
sudo apt install -yV texlive-lang-french
sudo apt install -yV texlive-lang-german
sudo apt install -yV texlive-lang-greek
sudo apt install -yV texlive-lang-italian
sudo apt install -yV texlive-lang-japanese
sudo apt install -yV texlive-lang-korean
sudo apt install -yV texlive-lang-other
sudo apt install -yV texlive-lang-polish
sudo apt install -yV texlive-lang-portuguese
sudo apt install -yV texlive-lang-spanish
sudo apt install -yV texlive-latex-base
sudo apt install -yV texlive-latex-base-doc
sudo apt install -yV texlive-latex-extra
sudo apt install -yV texlive-latex-extra-doc
sudo apt install -yV texlive-latex-recommended
sudo apt install -yV texlive-latex-recommended-doc
sudo apt install -yV texlive-luatex
sudo apt install -yV texlive-metapost
sudo apt install -yV texlive-metapost-doc
sudo apt install -yV texlive-music
sudo apt install -yV texlive-pictures
sudo apt install -yV texlive-pictures-doc
sudo apt install -yV texlive-plain-generic
sudo apt install -yV texlive-pstricks
sudo apt install -yV texlive-pstricks-doc
sudo apt install -yV texlive-publishers
sudo apt install -yV texlive-publishers-doc
sudo apt install -yV texlive-science
sudo apt install -yV texlive-science-doc
sudo apt install -yV texlive-xetex
sudo apt install -yV tipa vprerex
sudo apt install -yV xdvik-ja 
cp latexmkrc ~/.latexmkrc
