#!/bin/bash


if [ "$PWD" != "$HOME/env" ]
then
 echo "Copy env at ~"
 mkdir ~/env
 cp -r * ~/env
fi

echo "Building .vimrc and .gvimrc"
echo "source ${HOME}/env/vimrc" > ${HOME}/.vimrc

echo "Linking .vim to env/vim..."
mv ${HOME}/.vim ${HOME}/env/vim.bak
ln -s ${HOME}/env/vim ${HOME}/.vim

echo "Linking .emacs to env/emacs"
mv ${HOME}/.emacs ${HOME}/env/emacs.bak
ln -s ${HOME}/env/emacs ${HOME}/.emacs

echo "Linking .muttrc to env/muttrc"
mv ${HOME}/.muttrc ${HOME}/env/muttrc.bak
ln -s ${HOME}/env/muttrc ${HOME}/.muttrc

sudo apt-get install vim emacs emacs-goodies-el xfonts-terminus terminator ibus-hangul gnome-tweak-tool
