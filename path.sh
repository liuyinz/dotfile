#!/usr/bin/env bash

#######################################
#
# Definition: Associate Array which is used to store symbolic path.
# Format: [SOURCE]=TARGET
#         SOURCE's path is based on current working directory,
#         TARGET's path is based on $HOME.
#
#######################################

# --------------------------- BASE -------------------------------

declare -Ar BASE=(
  # TERMINAL
  # kitty
  ["base/kitty"]=".config/kitty"
  # theme
  ["base/starship.toml"]=".config/starship.toml"

  # GIT
  ["base/.global.gitconfig"]=".global.gitconfig"
  ["base/.gitmessage"]=".gitmessage"
  ["base/gh.yml"]=".config/gh/config.yml"

  # TOOL
  # editorconfig
  ["base/.editorconfig"]=".editorconfig"
  # htop
  ["base/htoprc"]=".config/htop/htoprc"
  # bat
  ["base/bat.conf"]=".config/bat.conf"
  # ripgrep
  ["base/.ripgreprc"]=".config/.ripgreprc"
  ["base/.rgignore"]=".config/.rgignore"
  # ranger
  ["base/ranger"]=".config/ranger"
  # tealdeer
  ["base/tealdeer.toml"]=".config/tealdeer/config.toml"
  # lazygit
  ["base/lazygit.yml"]=".config/lazygit/config.yml"
  # enchant
  ["base/enchant/enchant.ordering"]=".config/enchant/enchant.ordering"
  ["base/enchant/en_US.dic"]=".config/enchant/en_US.dic"

  # LANG
  # css, less, scss
  ["base/.stylelintrc.json"]=".stylelintrc.json"
  # js
  ["base/.prettierrc.js"]=".prettierrc.js"
  # .eslintrc.json: base/.eslintrc.json
  # yaml
  ["base/.yamllint"]=".yamllint"
  # py
  ["base/pip.conf"]=".config/pip/pip.conf"
  # ruby
  ["base/.gemrc"]=".gemrc"
  # sh
  ["base/.shellcheckrc"]=".shellcheckrc"
  # cpp
  ["base/.clang-format"]=".clang-format"
  # rust
  ["base/cargo.toml"]=".cargo/config"
  ## perl
  # ["base/MyConfig.pm"]=".cpan/CPAN/MyConfig.pm"
  # ["base/.perlcriticrc"]=".perlcriticrc"
  # md
  ["base/.mdlrc"]=".mdlrc"
  ["base/mdl-rule.rb"]="mdl-rule.rb"
)

# --------------------------- MACOS -------------------------------

declare -Ar MACOS=(
  # zsh
  ["macos/zsh/.zshenv"]=".zshenv"
  ["macos/zsh/.zsh_history"]="$dotcache/.zsh_history"

  # brew
  ["macos/Brewfile"]="$dotcache/Brewfile"

  # SELF
  ["macos/bin"]="bin"

  ["macos/.gitconfig"]=".gitconfig"

  ["macos/.gitignore"]=".gitignore"

  # ssh
  ["macos/ssh_config"]=".ssh/config"

  # gnupg
  ["macos/gpg-agent.conf"]=".gnupg/gpg-agent.conf"

  # py
  ["macos/requirements.txt"]="$dotcache/requirements.txt"

  # npm
  ["macos/Npmfile"]="$dotcache/Npmfile"
  #pnpm
  ["macos/Pnpmfile"]="$dotcache/Pnpmfile"

  # proxychain
  ["macos/proxychains.conf"]=".config/proxychains.conf"

  # MACOS
  # karabiner
  ["macos/karabiner/karabiner.json"]=".config/karabiner/karabiner.json"

  ["macos/karabiner/assets"]=".config/karabiner/assets"

  # git-cliff
  ["base/cliff.toml"]="Library/Application\ Support/git-cliff/cliff.toml"
)

# --------------------------- LINUX -------------------------------

declare -Ar LINUX=(
  ["linux/.gitconfig"]=".gitconfig"

  # py
  ["linux/requirements.txt"]="$dotcache/requirements.txt"

  # npm
  ["linux/Npmfile"]="$dotcache/Npmfile"
)
