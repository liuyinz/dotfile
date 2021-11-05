#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

brew_install() {
  print_in_yellow "\n   brew: install start ...\n\n"

  # exclude emacs-head
  HOMEBREW_BUNDLE_BREW_SKIP="daviderestivo/emacs-head/emacs-head@28"

  brew bundle install --no-lock --file "$@"
  print_result $? "brew: install done"
}

brew_dump() {
  print_in_yellow "\n   brew: dump start ...\n\n"
  brew bundle dump --no-lock --force --file "$@"
  print_result $? "brew: dump done"
}

main() {
  cd .. || return 1
  print_in_purple "\n   brew: bundle\n\n"

  select opt in install dump; do
    case $opt in
      install)
        brew_install "$@"
        break
        ;;
      dump)
        brew_dump "$@"
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
