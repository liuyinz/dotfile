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
  # standard-version
  ["base/.versionrc.json"]=".versionrc.json"
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

  # LANG
  # css, less, scss
  ["base/.stylelintrc.json"]=".stylelintrc.json"
  # js
  ["base/.prettierrc.json"]=".prettierrc.json"
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
)

# --------------------------- MACOS -------------------------------

declare -Ar MACOS=(
  # zsh
  ["macos/zsh/.zshenv"]=".zshenv"
  ["macos/zsh/.zsh_history"]="$dotcache/.zsh_history"

  # brew
  ["macos/Brewfile"]="$dotcache/Brewfile"

  # SELF
  ["macos/bin"]=".local/bin"

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

  # proxychain
  ["macos/proxychains.conf"]=".config/proxychains.conf"

  # MACOS
  # karabiner
  ["macos/karabiner/karabiner.json"]=".config/karabiner/karabiner.json"

  ["macos/karabiner/assets"]=".config/karabiner/assets"
)

# --------------------------- LINUX -------------------------------

declare -Ar LINUX=(
  ["linux/.gitconfig.local"]=".gitconfig.local"

  # py
  ["linux/requirements.txt"]="$dotcache/requirements.txt"

  # npm
  ["linux/Npmfile"]="$dotcache/Npmfile"
)
