#!/usr/bin/env bash

#######################################
#
# Definition: Associate Array which is used to store symbolic path.
# Format: SOURCE <- TARGET
#         SOURCE's path is based on subdirectory of ./source,
#         TARGET's path is based on $HOME.
#
#######################################

declare -a sets_all=("BASE" "SYS_mac" "SYS_linux" "SYS_win" "home_air15")

# --------------------------- BASE -------------------------------

declare -ar BASE=(
  # TERMINAL
  # kitty
  "base/kitty <- .config/kitty"
  # theme
  "base/starship.toml <- .config/starship.toml"

  # GIT
  "base/.global.gitconfig <- .global.gitconfig"
  "base/.gitmessage <- .gitmessage"
  "base/gh.yml <- .config/gh/config.yml"

  # TOOL
  # editorconfig
  "base/.editorconfig <- .editorconfig"
  # htop
  "base/htoprc <- .config/htop/htoprc"
  # bat
  "base/bat.conf <- .config/bat.conf"
  # ripgrep
  "base/.ripgreprc <- .config/.ripgreprc"
  "base/.rgignore <- .config/.rgignore"
  # # ranger
  # "base/ranger <- .config/ranger"
  # tealdeer
  "base/tealdeer.toml <- .config/tealdeer/config.toml"
  # lazygit
  "base/lazygit.yml <- .config/lazygit/config.yml"
  # enchant
  "base/enchant/enchant.ordering <- .config/enchant/enchant.ordering"
  "base/enchant/en_US.dic <- .config/enchant/en_US.dic"
  # mise
  "base/mise <- .config/mise"

  # LANG
  # css, less, scss
  "base/.stylelintrc.json <- .stylelintrc.json"
  # js
  "base/.prettierrc.js <- .prettierrc.js"
  # .eslintrc.json: base/.eslintrc.json
  # yaml
  "base/.yamllint <- .yamllint"
  # py
  "base/pip.conf <- .config/pip/pip.conf"
  # ruby
  "base/.gemrc <- .gemrc"
  # sh
  "base/.shellcheckrc <- .shellcheckrc"
  # cpp
  "base/.clang-format <- .clang-format"
  # rust
  "base/cargo.toml <- .cargo/config"
  ## perl
  # "base/MyConfig.pm <- .cpan/CPAN/MyConfig.pm"
  # "base/.perlcriticrc <- .perlcriticrc"
  # md
  "base/.mdlrc <- .mdlrc"
  "base/mdl-rule.rb <- mdl-rule.rb"
  # mise
  "base/.default-npm-packages <- .default-npm-packages"
)

# --------------------------- MAC -------------------------------

declare -ar SYS_mac=(
  # SELF
  "mac/bin <- .local/usr/bin"

  "mac/.gitconfig <- .gitconfig"

  "mac/.gitignore <- .gitignore"

  # py
  "mac/requirements.txt <- $dotcache/requirements.txt"

  #pnpm
  "mac/Pnpmfile <- $dotcache/Pnpmfile"

  # proxychain
  "mac/proxychains.conf <- .config/proxychains.conf"

  # git-cliff
  # "base/cliff.toml <- Library/Application\ Support/git-cliff/cliff.toml"

)

# --------------------------- LINUX -------------------------------

declare -ar SYS_linux=(
  "linux/.gitconfig <- .gitconfig"
  # py
  "linux/requirements.txt <- $dotcache/requirements.txt"
  # pnpm
  "linux/Pnpmfile <- $dotcache/Pnpmfile"
)

# ---------------------------- WIN --------------------------------

#  -------------------------- machine ------------------------------

declare -ar home_air15=(
  # zsh
  "home_air15/zsh/.zshenv <- .zshenv"
  "home_air15/zsh/.zsh_history <- $dotcache/.zsh_history"
  "home_air15/zsh/init.zsh <- $dotcache/init.zsh"

  # brew
  "home_air15/Brewfile <- $dotcache/Brewfile"

  # ssh
  "home_air15/ssh_config <- .ssh/config"

)
