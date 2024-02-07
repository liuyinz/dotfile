#!/usr/bin/env zsh

# uncomment line below to  debug zshenv
# set -x

## ---------------------------- Zsh --------------------------------

# default
export CONFIG_HOME=$HOME/.config
export CACHE_HOME=$HOME/.cache

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
export PATH=$HOME/.local/usr/bin:$HOME/.local/bin:$PATH

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

# emacs enchant
export ENCHANT_CONFIG_DIR=$CONFIG_HOME/enchant/

# ssh
export SSH_KEY_PATH=$HOME/.ssh/id_ed25519

# pass
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# homebrew
export HOMEBREW_BAT=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_BUNDLE_BREW_SKIP="daviderestivo/emacs-head/emacs-head@30"

# tsinghua source
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

eval "$(/opt/homebrew/bin/brew shellenv)"


# gnu toolchain

for item in "coreutils" "findutils" "grep" "make" "gnu-time" "gnu-tar" "gnu-sed"
do
  export PATH=/opt/homebrew/opt/$item/libexec/gnubin:$PATH
done

# curl
export PATH=/opt/homebrew/opt/curl/bin:$PATH

# getopt
export PATH=/opt/homebrew/opt/gnu-getopt/bin:$PATH

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
    --no-scrollbar \
    --history=$CACHE_HOME/.fzf_history \
    --marker='+ ' \
    --separator='' \
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

#  --------------------------- mise -------------------------------

export MISE_GO_SET_GOPATH=false

#  --------------------------- Lang -------------------------------

# ccls
# export PATH=/opt/homebrew/opt/llvm/bin:$PATH

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Golang
export GOPATH=$HOME/Code/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
