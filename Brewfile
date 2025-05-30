# -- taps
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"


# -- cli utils
brew "bat"  # cat
brew "eza"  # ls
brew "ripgrep"  # grep
brew "difftastic"  # diff
brew "zoxide"  # cd
brew "jq"
brew "tmux"
brew "tmuxp"
brew "moreutils"
brew "curl"
brew "openssh"
brew "socat"
brew "nmap"
brew "imagemagick"
brew "rsync"
brew "mas"  # mac app store

# -- emacs
tap "d12frosted/emacs-plus"
brew "d12frosted/emacs-plus/emacs-plus@30", args: ["with-imagemagick",
                                                   "with-native-comp",
                                                   "with-no-frame-refocus",
                                                   "with-poll",
                                                   "with-savchenkovaleriy-big-sur-icon"]

# -- mail
brew "mu"
brew "msmtp"
brew "isync", restart_service: true

# -- fonts
cask "font-iosevka"

# -- utils
cask "displaybuddy"  # monitor
cask "steermouse"  # trackball
cask "karabiner-elements"  # keyboard
mas "Keymapp", id: 6472865291
cask "alacritty"
cask "menuwhere"
tap "koekeishiya/formulae"
cask "yabai"

## vpn
mas "WireGuard", id: 1451685025

## sync
mas "Bitwarden", id: 1352778147
cask "backblaze"
cask "dropshare"
cask "syncthing"

brew "transmission-cli", restart_service: true
cask "deepl"
mas "Notability", id: 360593530

## video
cask "vlc"
brew "yt-dlp"
brew "mpv"

## books
cask "yacreader"
cask "calibre"
cask "djview"

## office
mas "Numbers", id: 409203825
mas "Pages", id: 409201541

cask "onyx"
cask "pearcleaner"

# -- games
cask "steam"

# -- social
cask "discord"
cask "telegram"
cask "whatsapp"
cask "signal"


# -- dev
## tools
mas "Xcode", id: 497799835
cask "dash"

## arm (console)
tap "px4/px4"
brew "px4/px4/gcc-arm-none-eabi"

brew "llvm"

## langs
brew "rustup-init"
brew "go"
brew "opam"
brew "clojure"
brew "deno"
brew "node"
brew "julia"
brew "lua"
brew "luajit"
brew "luarocks"
brew "tcl-tk"
# pharo

## cpp
brew "boost"
brew "cmake"
brew "fmt"

## common-lisp
brew "sbcl"
brew "clozure-cl"
brew "ros"

## scheme
brew "chicken"
brew "gambit-scheme"
brew "minimal-racket"
tap "aconchillo/guile"  # with guile-hoot
brew "guile"

## wasm
brew "emscripten"
brew "wabt"
brew "wasmtime"

## gamedev
cask "godot"


# -- audio
## daw
cask "ableton-live-suite"
cask "bitwig-studio"
cask "reaper"
# Renoise
# Tracktion Waveform

## node-based
cask "pd"
cask "cycling74-max"

## langs
brew "csound"
brew "faust"
cask "supercollider"

## utils
cask "audio-hijack"
cask "loopback"
cask "blackhole-16ch"
cask "sysex-librarian"
cask "splice"
cask "protokol"
cask "audacity"

## vst
# ROLI Strobe 2
# Audiomodern Riffer
# Vital
# Kilohearts Phase Plant
cask "arturia-software-center"
cask "native-access"
# Plugin Alliance installation manager

# -- graphics
cask "blender"
# Aseprite
cask "affinity-designer"
cask "affinity-photo"


# -- job related
## kube
brew "kubernetes-cli"
brew "helm"

## browser
cask "firefox"

## comms
cask "skype"
cask "mattermost"

## dev tools
cask "r"
cask "rstudio"

cask "rar"
