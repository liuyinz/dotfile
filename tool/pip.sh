#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

pip_check() {
  if ! cmd_exists "pip3"; then
    print_error "pip3: " "cannot found"
    exit 1
  fi
}

pip_install() {
  print_in_yellow "\n   pip: install start ...\n\n"
  pip3 install --user -r "$@"
  print_result $? "pip: install done"
}

pip_freeze() {
  print_in_yellow "\n   pip: freeze start ...\n\n"
  pip freeze -r "$@" >"$@"
  print_result $? "pip: freeze done"
}

main() {

  pip_check

  print_in_purple "\n   pip: option\n\n"

  select opt in install freeze; do
    case $opt in
      install)
        pip_install "$@"
        break
        ;;
      freeze)
        pip_freeze "$@"
        break
        ;;
      *)
        print_error "Invalid option: " "$REPLY"
        break
        ;;
    esac
  done
}

main "$@"
