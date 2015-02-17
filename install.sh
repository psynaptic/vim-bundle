#!/usr/bin/env bash

git clone --recursive git@github.com:psynaptic/vim-bundle.git ~/.vim
if [[ -e $HOME/.vimrc ]]; then
  mv $HOME/.vimrc $HOME/.vimrc-old
  echo 'Backed up existing vimrc to ~/.vimrc-old'
fi
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
vim +PluginInstall +qall
\reset
