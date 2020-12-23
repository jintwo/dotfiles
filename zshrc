# -*- mode: sh -*-
# vim: set ft=sh:

DISABLE_VENV_CD=1

source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle brew
antigen bundle git
antigen bundle osx
antigen bundle docker

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

#antigen theme jintwo/dotfiles zsh/jin-dark

antigen theme "${HOME}/Documents/Github/dotfiles/zsh" jin-nord

antigen apply

source ~/.zshrc-local
