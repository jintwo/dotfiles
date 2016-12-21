#!/bin/sh
ZSH_BIN=`which zsh`
if [ -z $ZSH_BIN ]; then
    echo "ZSH is not installed."
    exit
fi
GITHUB_ROOT="${GITHUB_ROOT:-~/Github}"
FILES="zshrc zshrc-local gitconfig gitignore hgrc emacs.d vimrc tmux.conf hammerspoon"
mkdir -p $GITHUB_ROOT
cd $GITHUB_ROOT
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/jintwo/dotfiles.git
ln -fs $GITHUB_ROOT/dotfiles/zsh/*.zsh-theme ~/.oh-my-zsh/themes/
for file in $FILES; do
    ln -fs $GITHUB_ROOT/dotfiles/$file ~/.$file
done
sudo chsh -s $ZSH_BIN `whoami`
