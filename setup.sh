#!/bin/bash


if [ "$PWD" != "$HOME/env" ]
then
 echo "Copy env at ~"
 mkdir ~/env
 cp -r * ~/env
fi

echo "Building .vimrc and .gvimrc..."
echo "source ${HOME}/env/vimrc" > ${HOME}/.vimrc

echo "Linking .vim to env/vim..."
rm -rf ${HOME}/.vim
ln -s ${HOME}/env/vim ${HOME}/.vim

echo "Linking .emacs to env/emacs..."
rm -rf ${HOME}/.emacs
ln -s ${HOME}/env/emacs ${HOME}/.emacs

sudo apt-get install vim emacs emacs-goodies-el xfonts-terminus
