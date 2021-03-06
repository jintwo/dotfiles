# -*- mode: sh -*-
# vim: set ft=sh:
#black=16

white=231
darkestgreen=22
darkgreen=28
mediumgreen=70
brightgreen=148
darkestcyan=23
mediumcyan=117
darkestblue=24
darkblue=31
darkestred=52
darkred=88
mediumred=124
brightred=160
brightestred=196
darkestpurple=55
mediumpurple=98
brightpurple=189
brightorange=208
brightestorange=214
gray0=233
gray1=235
gray2=236
gray3=239
gray4=240
gray5=241
gray6=244
gray7=245
gray8=247
gray9=250
gray10=252

RESET_BG=%k
RESET_FG=%f
RESET_COLORS=$RESET_BG$RESET_FG

GIT_DIRTY_COLOR=%F{133}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$gray8}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO%F{$gray8}] "

ZSH_THEME_VIRTUAL_ENV_PREFIX="%F{$gray8}py:"
ZSH_THEME_VIRTUAL_ENV_SUFFIX="$RESET_COLORS"

function virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo '['$ZSH_THEME_VIRTUAL_ENV_PREFIX`basename $VIRTUAL_ENV`'] '$ZSH_THEME_VIRTUAL_ENV_SUFFIX
}

PROMPT="
$RESET_COLORS%F{4}%n@%m%F{7}:$RESET_COLORS%F{2}%~$RESET_COLORS "$'$(git_prompt_info)'"%F{8}%%$RESET_COLORS "

RPROMPT=$'$(virtualenv_info)'
