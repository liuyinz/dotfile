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
  ["base/.gitconfig"]=".gitconfig"
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

  # LANG
  # css, less, scss
  ["base/.stylelintrc.json"]=".stylelintrc.json"
  # js
  ["base/.prettierrc.json"]=".prettierrc.json"
  # .eslintrc.json: base/.eslintrc.json
  # py
  ["base/pip.conf"]=".config/pip/pip.conf"
  ["base/.pylintrc"]=".pylintrc"
  # ruby
  ["base/.gemrc"]=".gemrc"
  # sh
  ["base/.shellcheckrc"]=".shellcheckrc"
  # cpp
  ["base/.clang-format"]=".clang-format"
  # rust
  ["base/cargo.toml"]=".local/cargo/config"
)

# --------------------------- MACOS -------------------------------

declare -Ar MACOS=(
  # zsh
  ["macos/zsh/.zshenv"]=".zshenv"
  ["macos/zsh/.zsh_history"]=".zsh_history"

  # SELF
  ["macos/bin"]=".local/bin"

  ["macos/.gitconfig.local"]=".gitconfig.local"

  ["macos/.gitignore"]=".gitignore"

  # ssh
  ["macos/ssh_config"]=".ssh/config"

  # gnupg
  ["macos/gpg-agent.conf"]=".gnupg/gpg-agent.conf"

  # lazygit
  ["base/lazygit.yml"]="Library/Application Support/lazygit/config.yml"

  # py
  ["macos/requirements.txt"]=".tmp/requirements.txt"

  # npm
  ["macos/Npmfile"]=".tmp/Npmfile"

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

  ["base/lazygit.yml"]=".config/lazygit/config.yml"

  # py
  ["linux/requirements.txt"]=".tmp/requirements.txt"

  # npm
  ["linux/Npmfile"]=".tmp/Npmfile"
)
