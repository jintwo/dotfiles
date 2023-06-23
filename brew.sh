#!/bin/zsh

function mas-install {
    app_id=$(mas search "$1" | grep -i "$1" | head -n1 | awk '{print $1}')
    mas install $app_id
}

# cli utils
brew install bat
brew install exa
brew install dog
brew install ripgrep
brew install difftastic
brew install zoxide
brew install fd
brew install jq
brew install tmux
brew install moreutils
brew install bitwarden-cli

# brew install restic
mas-install backblaze

brew install openssh
brew install mu
brew install isync
brew install msmtp

brew install socat

# utils
brew install homebrew/cask/alacritty
brew install homebrew/cask/hammerspoon
# brew install koekeishiya/formulae/yabai
brew install homebrew/cask/tunnelblick
mas-install wireguard
# brew install homebrew/cask/bitwarden  # browser extension not supported
mas-install bitwarden
brew install homebrew/cask/maestral
brew install homebrew/cask/dropshare  # use b2 buckets
brew install homebrew/cask/deepl
brew install homebrew/cask/caffeine
brew install homebrew/cask/onyx
brew install transmission-cli  # should also install homebrew/service tools

# social
brew install homebrew/cask/discord
brew install homebrew/cask/telegram
brew install homebrew/cask/whatsapp
brew install homebrew/cask/signal

# vms
brew install qemu
brew install cdrtools

# dev

# dev/tools
mas-install xcode
brew install homebrew/cask/dash
# brew install jimeh/emacs-builds/emacs-app-good
brew install d12frosted/emacs-plus/emacs-plus@29 --with-imagemagick --with-no-frame-refocus --with-native-comp --with-poll --with-savchenkovaleriy-big-sur-icon
brew install PX4/homebrew-px4/gcc-arm-none-eabi

# dev/langs
brew install rustup-init
brew install go
brew install opam
brew install zig

# dev/cpp
brew install boost
brew install cmake

# dev/cl
brew install sbcl
brew install clozure-cl
brew install libev  # cl woo

# dev/wasm
brew install wabt
brew install wasmtime

# dev/scheme
brew install chicken
brew install minimal-racket

# audio
brew install homebrew/cask/sysex-librarian
brew install homebrew/cask/pd
brew install homebrew/cask/ableton-live-suite
brew install homebrew/cask/cycling74-max
brew install homebrew/cask/bitwig-studio
brew install homebrew/cask/splice
brew install homebrew/cask/loopback
brew install homebrew/cask/blackhole-16ch
brew install homebrew/cask/supercollider
brew install csound

brew install homebrew/cask/spotify

# video
brew install homebrew/cask/vlc
# brew install mpv  # try!

# ui
brew install homebrew/cask-fonts/font-iosevka

# job related
brew install kubernetes-cli
brew install helm
brew install homebrew/cask/chromedriver
brew install homebrew/cask/google-chrome
brew install homebrew/cask/firefox-nightly
brew install homebrew/cask/microsoft-teams
brew install homebrew/cask/skype
brew install homebrew/cask/slack
brew install homebrew/cask/zoom
mas-install "be focused pro"
