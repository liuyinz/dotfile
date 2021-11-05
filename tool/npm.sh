#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

npm_check() {
  if ! cmd_exists "npm"; then
    print_error "npm: " "cannot found"
    exit 1
  fi
}

npm_install() {
  print_in_yellow "\n   npm: install start ...\n\n"
  cat "$@" | xargs npm install --global
  print_result $? "npm: install done"
}

npm_dump() {
  print_in_yellow "\n   npm: dump start ...\n\n"
  npm list -g --depth 0 --parseable \
    | tail -n +2 \
    | awk -F '/' '{ print $NF }' > "$@"
  print_result $? "npm: dump done"
}

main() {

  npm_check

  print_in_purple "\n   npm: option\n\n"

  select opt in install dump; do
    case $opt in
      install)
        npm_install "$@"
        break
        ;;
      dump)
        npm_dump "$@"
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
