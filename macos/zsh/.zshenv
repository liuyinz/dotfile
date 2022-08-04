#!/usr/bin/env zsh

# uncomment line below to  debug zshenv
# set -x

## ---------------------------- Zsh --------------------------------

# default
export CONFIG_HOME=$HOME/.config
export CACHE_HOME=$HOME/.cache
export DATA_HOME=$HOME/.local

# dotfile
export DOTFILE_HOME=$CONFIG_HOME/dotfile

# misc
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TIME_STYLE="+%y-%m-%d %H:%M"
export PAGER="less --tabs=4"
export LESSHISTFILE=$CACHE_HOME/.lesshst

# hist
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

# PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$DATA_HOME/bin:$PATH

# export EDITOR="nvim"
export EDITOR="ec"
export GIT_PAGER="diff-so-fancy | less --tabs=4 -RFX"

# export HTTP_ADDR=${HTTP%:*}
# export HTTP_PORT=${HTTP#*:}
# export SOCKS_ADDR=${SOCKS%:*}
# export SOCKS_PORT=${SOCKS#*:}

#  --------------------------- Tool -------------------------------
# emacs lsp-mode
export LSP_USE_PLISTS=true

# ssh
export SSH_KEY_PATH=$HOME/.ssh/id_ed25519

# homebrew
export HOMEBREW_BAT=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_BUNDLE_BREW_SKIP="daviderestivo/emacs-head/emacs-head@29"

# curl
export PATH=/usr/local/opt/curl/bin:$PATH
# coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
# findutils
export PATH=/usr/local/opt/findutils/libexec/gnubin:$PATH
# other
export PATH=/usr/local/opt/gnu-time/libexec/gnubin:$PATH
export PATH=/usr/local/opt/gnu-tar/libexec/gnubin:$PATH
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
# make
export PATH=/usr/local/opt/make/libexec/gnubin:$PATH
# getopt
export PATH=/usr/local/opt/gnu-getopt/bin:$PATH

# Ripgrep
export RIPGREP_CONFIG_PATH=$CONFIG_HOME/.ripgreprc

# proxychains-ng
export PROXYCHAINS_CONF_FILE=$CONFIG_HOME/proxychains.conf

# bat
export BAT_CONFIG_PATH=$CONFIG_HOME/bat.conf

# lazygit
export CONFIG_DIR="$CONFIG_HOME/lazygit"

# tealdeer
export TEALDEER_CONFIG_DIR=$CONFIG_HOME/tealdeer

# z.lua
export _ZL_DATA=$CACHE_HOME/.zlua
export _ZL_ECHO=1
export _ZL_ADD_ONCE=0
export _ZL_MATCH_MODE=0
export _ZL_HYPHEN=1
export _ZL_ROOT_MARKERS=".git,.svn,.hg,.root,package.json"
export _ZL_EXCLUDE_DIRS="$CACHE_HOME"

# fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=" \
    --header-first \
    --ansi \
    --reverse \
    --cycle \
    --multi \
    --sort \
    --history=$CACHE_HOME/.fzf_history \
    --marker='+ ' \
    --info=inline\
    --margin=0,0,0,1 \
    --height='60%' \
    --color=dark,bg:#1d252c,fg:#a0b3c5:dim,hl:#8bd49c:dim:bold \
    --color=bg+:#1d252c,fg+:#d8dde6:bold,hl+:#d8dde6:bold \
    --color=pointer:#d95468:bold,gutter:#1d252c,marker:#d95468:bold \
    --color=prompt:#5ec4ff:dim,query:#8bd49c:bold,spinner:#ebbf83:dim \
    --color=info:#c06ece:bold,header:#5ec4ff:dim \
    --bind=change:first,btab:up+toggle \
    --bind=ctrl-n:down,ctrl-p:up,alt-n:next-history,alt-p:previous-history \
    --bind=ctrl-u:cancel,ctrl-l:jump,ctrl-t:toggle-all,ctrl-v:clear-selection"

#  --------------------------- Lang -------------------------------

# ccls
export PATH=/usr/local/opt/llvm/bin:$PATH

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export GEM_HOME=$DATA_HOME/gem
export PATH=$GEM_HOME/bin:$PATH

# python
export PYTHON_MINOR_VERSION=$(python -V | perl -nle '/^Python (\d\.\d+)\..+$/ && print "$1"')
export PYTHONUSERBASE=$DATA_HOME/python/$PYTHON_MINOR_VERSION
export PATH=$PYTHONUSERBASE/bin:$PATH

# rust
export CARGO_HOME=$DATA_HOME/cargo
export PATH=$CARGO_HOME/bin:$PATH
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# zsh-nvm
export NVM_NODEJS_ORG_MIRROR="https://mirrors.ustc.edu.cn/node/"
export NVM_DIR=$DATA_HOME/nvm
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('make' 'vim' 'emacs' 'et' 'ecc' 'ec' 'edf')
export NVM_AUTO_USE=true
# export NVM_COMPLETION=true

# Golang
export GOPATH=$HOME/Code/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOSUMDB=sum.golang.google.cn

# Perl
export PLENV_ROOT=$DATA_HOME/plenv

export PERL_CPANM_OPT=" \
       --verbose \
       --notest \
       --mirror-only \
       --mirror https://mirrors.tuna.tsinghua.edu.cn/CPAN/"
