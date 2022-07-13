# -*- mode: sh -*-

# original
# yellow=#ffdfaf
# gray=#bcbcbc
# blue=#81a1c1
# green=#a3be8c

# xterm
# yellow=#ffd7af #223@xterm NavajoWhite1
# gray=#bcbcbc #250@xterm Grey74
# blue=#87afd7 #110@xterm LightSkyBlue3
# green=#afd787 #150@xterm DarkSeeGreen3

# simple
yellow=3
gray=7
blue=4
green=2

RESET_BG=%k
RESET_FG=%f
RESET_COLORS=$RESET_BG$RESET_FG

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$yellow}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{$yellow}]$RESETCOLORS "

ZSH_THEME_VIRTUAL_ENV_PREFIX="%F{$gray}[py:"
ZSH_THEME_VIRTUAL_ENV_SUFFIX="$RESET_COLORS"

function virtualenv_info() {
    if [ -z $VIRTUAL_ENV ]; then
        return
    fi
    venv_basedir=$(dirname $VIRTUAL_ENV | rev | cut -f1 -d"/" | rev)
    venv_name=$(basename $VIRTUAL_ENV)
    venv="$venv_basedir/$venv_name"
    [ $VIRTUAL_ENV ] && echo $ZSH_THEME_VIRTUAL_ENV_PREFIX$venv'] '$ZSH_THEME_VIRTUAL_ENV_SUFFIX
}

PROMPT='
$RESET_COLORS%F{$blue}%n@%m$RESET_COLORS:%F{$green}%~$RESET_COLORS $(git_prompt_info)%F{$gray}%%$RESET_COLORS '

RPROMPT='$(virtualenv_info)'
