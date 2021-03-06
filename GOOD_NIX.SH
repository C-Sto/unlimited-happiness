#!/bin/bash

clear
clear
clear


echo
echo "GOOD_NIX.SH"
echo
echo


export HISTFILE=

arch=$(uname)

if [ $arch == 'Darwin' ]
then
    chmod +x $(pwd)/BREW_STUFF.SH
    /bin/sh $(pwd)/BREW_STUFF.SH
elif [ $arch == 'Linux' ]
then
    git clone https://github.com/C-Sto/kalitools
    chmod +x $(pwd)/kalitools/gettools.sh
    sed -i '/fozzysac/d' $(pwd)/kalitools/gettools.sh 
    sed -i 's/bash/zsh/g' $(pwd)/kalitools/gettools.sh 
    sudo /bin/sh $(pwd)/kalitools/gettools.sh
fi

chmod +x $(pwd)/PIP3_STUFF.SH
/bin/sh $(pwd)/PIP3_STUFF.SH

chmod +x $(pwd)/GEM_STUFF.SH
/bin/sh $(pwd)/GEM_STUFF.SH

echo 'Copying curlrc...'
cp .curlrc ~/.curlrc

echo 'Copying vimrc...'
cp .vimrc ~/.vimrc

echo

chmod +x $(pwd)/ZSH_STUFF.SH

if [ $arch == 'Darwin' ]
then
    echo "OPENING iTerm2.app"
    open /Applications/iTerm.app $(pwd)/ZSH_STUFF.SH
elif [ $arch == 'Linux' ]
then
    /bin/sh $(pwd)/ZSH_STUFF.SH
fi

rm ~/.bash_history
history -c
