# -*- mode: sh -*-
# vim: set ft=sh:

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nord"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# CUSTOM!!!
source ~/.zshrc-local

# TODO:
# 0.1. try fish
# 1. git prompt info fixes (colors / dirty)
# 3. git aliases (optional)
# 2. syntax highlightning (optional)
# 4. history completions
# 5. theme

##### git info (custom)

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git*' formats "%b/%u"

# precmd() {
#     vcs_info
# }

# function __git_prompt_info() {

#     parts=(${(@s:/:)vcs_info_msg_0_})

#     local branch=${parts[1]}
#     local unstaged=${parts[2]}

#     if [ -z $branch ]; then
#         exit
#     fi

#     echo -n "["
#     if [ ! -z $unstaged ]; then
#         echo -n "$branch:*"
#     else
#         echo -n "$branch"
#     fi
#     echo "] "
# }


# theme
# white=231
# darkestgreen=22
# darkgreen=28
# mediumgreen=70
# brightgreen=148
# darkestcyan=23
# mediumcyan=117
# darkestblue=24
# darkblue=31
# darkestred=52
# darkred=88
# mediumred=124
# brightred=160
# brightestred=196
# darkestpurple=55
# mediumpurple=98
# brightpurple=189
# brightorange=208
# brightestorange=214
# gray0=233
# gray1=235
# gray2=236
# gray3=239
# gray4=240
# gray5=241
# gray6=244
# gray7=245
# gray8=247
# gray9=250
# gray10=252

# RESET_BG=%k
# RESET_FG=%f
# RESET_COLORS=$RESET_BG$RESET_FG

# # GIT_DIRTY_COLOR=%F{133}
# # GIT_CLEAN_COLOR=%F{118}
# GIT_PROMPT_INFO=%F{012}

# ZSH_THEME_GIT_PROMPT_PREFIX="%F{$gray8}[git:"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO%F{$gray8}] "

# ZSH_THEME_VIRTUAL_ENV_PREFIX="%F{$gray8}py:"
# ZSH_THEME_VIRTUAL_ENV_SUFFIX="$RESET_COLORS"

# function virtualenv_info() {
#     [ $VIRTUAL_ENV ] && echo '['$ZSH_THEME_VIRTUAL_ENV_PREFIX`basename $VIRTUAL_ENV`'] '$ZSH_THEME_VIRTUAL_ENV_SUFFIX
# }



# PROMPT="
# $RESET_COLORS%F{4}%n@%m%F{7}:$RESET_COLORS%F{2}%~$RESET_COLORS "$'$(git_prompt_info)'"%F{8}%%$RESET_COLORS "

# RPROMPT=$'$(virtualenv_info)'
