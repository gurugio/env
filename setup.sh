#!/bin/bash


if [ "$PWD" != "$HOME/env" ]
then
 echo "Copy env at ~"
 mkdir ~/env
 cp -r * ~/env
fi

echo "Do you want to set ALTIBASE environment? [y/n]"
read work

echo "Building .bashrc and .bash_profile..."
mv ${HOME}/.bashrc bashrc.bak

if [ "$work" = "y" ]
then
    echo "source ${HOME}/env/bashrc_altibase" > ${HOME}/.bashrc
else
    echo "source ${HOME}/env/bashrc_home" > ${HOME}/.bashrc
fi
cp ${HOME}/.bashrc ${HOME}/.bash_profile

echo "Building .vimrc and .gvimrc..."
echo "source ${HOME}/env/vimrc" > ${HOME}/.vimrc

echo "Linking .vim to env/vim..."
rm -rf ${HOME}/.vim
ln -s ${HOME}/env/vim ${HOME}/.vim

echo "Linking .emacs to env/emacs..."
rm -rf ${HOME}/.emacs
ln -s ${HOME}/env/emacs ${HOME}/.emacs

echo "Linking .globalrc to env/gtags.conf"
rm -rf ${HOME}/.globalrc
ln -s ${HOME}/env/gtags.conf ${HOME}/.globalrc

if [ "$work" = "n" ]
then
    sh kozip_install.sh
    sudo cp svn_clean /usr/local/bin
fi
