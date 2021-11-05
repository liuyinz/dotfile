#!/usr/bin/env bash

# SEE https://stackoverflow.com/a/53772163

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
  print_error "${BASH_VERSINFO:-0}:" "do not support associative arrays" && return 1
fi

# [SOURCE]=TARGET
# #  --------------------------- Base -------------------------------

declare -Ar base=(
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

# #  --------------------------- Macos -------------------------------

declare -Ar macos=(
  # zsh
  ["macos/zsh/.zshenv"]=".zshenv"

  # SELF
  ["macos/bin"]=".local/bin"

  ["macos/.gitconfig.local"]=".gitconfig.local"

  ["macos/.gitignore"]=".gitignore"

  # ssh
  ["macos/ssh_config"]=".ssh/config"

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

# #  --------------------------- Linux -------------------------------

declare -Ar linux=(
  ["linux/.gitconfig.local"]=".gitconfig.local"

  ["base/lazygit.yml"]=".config/lazygit/config.yml"

  # py
  ["linux/requirements.txt"]=".tmp/requirements.txt"

  # npm
  ["linux/Npmfile"]=".tmp/Npmfile"
)

create_symlinks() {

  if [ "$(get_os)" == "macos" ]; then
    declare -a comb=("base" "macos")
  else
    declare -a comb=("base" "linux")
  fi

  local set=""

  for set in "${comb[@]}"; do

    print_in_yellow "\n   $set\n\n"
    printf "    %-9s:  %-30s  =>  %s\n" "Status" "Source" "Target"
    declare -n dict="$set"

    local i=""
    local source=""
    local target=""
    local info=""

    for i in "${!dict[@]}"; do

      source="$(
        cd ..
        readlink -e "$i"
      )"
      target="$HOME/${dict[$i]}"
      info="$(printf "%-30s  =>  %s" "$i" "${target/$HOME/\~}")"

      if [ ! -e "$target" ]; then
        execute "ln -fs $source $target" "New   :  $info"

      elif [ "$(readlink "$target")" == "$source" ]; then
        print_in_purple "   [!] Same  :  $info\n"

      else
        ask_for_confirmation "'${target/$HOME/\~}' exists, overwrite it?"

        if answer_is_yes; then
          mv "$target" "$HOME/.tmp/backup"
          execute "ln -fs $source $target" "Cover :  $info"
        else
          print_error "Keep  :  $info"
        fi
      fi

    done

  done
}

main() {
  print_in_purple "\n   link: backup check ...\n\n"
  mkd "$HOME/.tmp/backup"

  print_in_purple "\n   link: symbolic check ...\n"
  create_symlinks
}

main
