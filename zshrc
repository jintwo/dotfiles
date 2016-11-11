# -*- mode: sh -*-
# vim: set ft=sh:

DISABLE_VENV_CD=1

source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle brew
antigen bundle git
antigen bundle lein
antigen bundle mercurial
antigen bundle mvn
antigen bundle osx
antigen bundle docker

antigen bundle kennethreitz/autoenv
antigen bundle rimraf/k
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme jintwo/dotfiles zsh/jin-dark

antigen apply

source ~/.zshrc-local
