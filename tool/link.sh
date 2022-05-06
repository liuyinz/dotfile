#!/usr/bin/env bash

# SEE https://stackoverflow.com/a/53772163

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

source "../path.sh"

if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
  print_error "${BASH_VERSINFO:-0}:" "do not support associative arrays" && return 1
fi

#######################################
# create_symlinks
# Outputs:
# SOURCE    TARGET    STATUS
#  No        No        Lack
#  Yes       Yes       Same/Cover/Keep
#  Yes       No        New
#  No        Yes       New
#######################################

create_symlinks() {

  if [ "$(get_os)" == "macos" ]; then
    declare -a comb=("BASE" "MACOS")
  else
    declare -a comb=("BASE" "LINUX")
  fi

  local set=""

  for set in "${comb[@]}"; do

    print_in_yellow "\n   $set\n\n"
    printf "   %-9s    %-30s      %s\n" "Status" "Source" "Target"
    declare -n dict="$set"

    local i=""
    local source=""
    local target=""
    local cmd=""
    local info=""

    for i in "${!dict[@]}"; do

      source="$(
        cd ..
        readlink -m "$i"
      )"
      target="$HOME/${dict[$i]}"
      cmd="ln -fs $source $target"
      info="$(printf "%-30s  ->  %s" "$i" "${target/$HOME/\~}")"

      if [ ! -e "$source" ] && [ ! -e "$target" ]; then
        print_error "Lack  :  $info"

      elif [ -e "$source" ] && [ -e "$target" ]; then

        if [ "$(readlink "$target")" == "$source" ]; then
          print_in_grey "   [✔] Same  :  $info\n"
        else
          ask_for_confirmation "'${target/$HOME/\~}' exists, overwrite it?"

          if answer_is_yes; then
            mv "$target" "$HOME/.tmp/backup"
            execute "$cmd" "Cover :  $info"
          else
            print_error "Keep  :  $info"
          fi
        fi

      else
        [ ! -e "$source" ] && mv "$target" "$source"
        [ -f "$source" ] && mkdir -p "$(dirname "$target")"
        execute "$cmd" "New   :  $info"
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
