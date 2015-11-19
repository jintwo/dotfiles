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

ARROW_RIGHT=$'\u2b80'
ARROW_LEFT=$'\u2b82'
RESET_BG=%k
RESET_FG=%f
RESET_COLORS=$RESET_BG$RESET_FG

GIT_DIRTY_COLOR=%F{133}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

# ZSH_THEME_GIT_PROMPT_PREFIX=" \u2b60 "%F{$white}
ZSH_THEME_GIT_PROMPT_PREFIX="%F{$gray8}[git:"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO"
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO%F{$gray8}] "
# ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✘ "
# ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✔ "

ZSH_THEME_HG_PROMPT_PREFIX="%F{$gray8}[hg:"
ZSH_THEME_HG_PROMPT_SUFFIX="$GIT_PROMPT_INFO%F{$gray8}] "
# ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
# ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
# ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

ZSH_THEME_VIRTUAL_ENV_PREFIX="%F{$gray8}py:"
ZSH_THEME_VIRTUAL_ENV_SUFFIX="$RESET_COLORS"

function in_hg() {
    if [[ -d .hg ]]; then
        echo 1
    fi
}

function virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo '['$ZSH_THEME_VIRTUAL_ENV_PREFIX`basename $VIRTUAL_ENV`'] '$ZSH_THEME_VIRTUAL_ENV_SUFFIX
}

PROMPT="
$RESET_COLORS%F{68}%n@%m%F{$gray9}:$RESET_COLORS%F{71}%~$RESET_COLORS "$'$(git_prompt_info)$(hg_prompt_info)'"%F{$gray9}%%$RESET_COLORS "

RPROMPT=$'$(virtualenv_info)'
