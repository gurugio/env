#!/bin/bash


if [ "$PWD" != "$HOME/env" ]
then
 echo "Copy env at ~"
 mkdir ~/env
 cp -r * ~/env
fi

sudo apt-get install vim emacs emacs-goodies-el xfonts-terminus terminator

echo "Building .vimrc and .gvimrc"
echo "source ${HOME}/env/vimrc" > ${HOME}/.vimrc

echo "Linking .vim to env/vim..."
mv ${HOME}/.vim ${HOME}/env/vim.bak
ln -s ${HOME}/env/vim ${HOME}/.vim

echo "Linking init.el to .emacs.d/init.el"
echo "If you want to use old .emacs, remove init.el and use env/emacs"
mv ${HOME}/.emacs.d/init.el ${HOME}/.emacs.d/init.el.bak
ln -s ${HOME}/env/init.el ${HOME}/.emacs.d/init.el
