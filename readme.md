Installation
============

Use the remote install script:

```
wget --quiet --no-check-certificate https://raw.githubusercontent.com/psynaptic/vim-bundle/master/install.sh -O - | sh
```

Or, run the commands manually:

```
$ git clone --recursive git@github.com:psynaptic/vim-bundle.git ~/.vim
$ if [[ -e ~/.vimrc ]]; then mv ~/.vimrc ~/.vimrc-old && echo 'Backed up existing vimrc to ~/.vimrc-old'; fi
$ ln -s ~/.vim/.vimrc ~/.vimrc
$ vim +PluginInstall +qall
```

About
=====

- Uses [Vundle](https://github.com/gmarik/Vundle.vim) for bundle management.
- Uses the dark [Solarized](https://github.com/altercation/vim-colors-solarized) color scheme.
