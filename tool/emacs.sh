#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

install_emacs() {

  if ! brew list --version emacs-head@28 >/dev/null 2>&1; then
    print_in_yellow "   emacs-head@28: install start ...\n\n"
    brew install emacs-head@28 \
      --with-cocoa \
      --with-native-comp \
      --with-native-full-aot \
      --with-pdumper \
      --with-xwidgets
  fi

  print_result $? "emacs-head@28: install done"

}

clone_emacs() {
  local emacs_dir="$HOME/.config/emacs"

  if [[ ! -d "$emacs_dir/.git" ]]; then
    [ -d "$emacs_dir" ] && mv "$emacs_dir" ~/.tmp/backup/
    print_in_yellow "   emacs-head@28: clone start ...\n\n"
    command git clone https://github.com/liuyinz/emacs.d.git "$emacs_dir"
  fi

  print_result $? "emacs-head@28: clone done"

}

submodule_emacs() {
  local emacs_dir="$HOME/.config/emacs"

  print_in_yellow "   emacs-head@28: submodule start ...\n\n"
  git -C "$emacs_dir" submodule update --init --jobs "$(nproc)"
  print_result $? "emacs-head@28: submodule done"
}

main() {
  print_in_purple "\n   emacs-head@28: install check ...\n\n"
  install_emacs

  print_in_purple "\n   emacs-head@28: clone check ...\n\n"
  clone_emacs

  print_in_purple "\n   emacs-head@28: submodule check ...\n\n"
  submodule_emacs
}

main
