#!/usr/bin/env bash


cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

nvim_install() {
  if ! cmd_exists nvim; then
    print_in_yellow "   nvim: install start ...\n\n"
    brew install neovim
  fi

  print_result $? "nvim: install done"
}

nvim_clone() {
  local nvim_dir="$HOME/.config/nvim"

  if [[ ! -d "$nvim_dir/.git" ]]; then
    [ -d "$nvim_dir" ] && mv "$nvim_dir" ~/.tmp/backup/
    print_in_yellow "   nvim: clone start ...\n\n"
    command git clone https://github.com/liuyinz/nvim.git "$nvim_dir"
  fi
  print_result $? "nvim: clone done"

}

nvim_plug() {
  local plug_file="$HOME/.local/share/nvim/site/autoload/plug.vim"
  if [[ ! -f "$plug_file" ]]; then
    print_in_yellow "   nvim: plug start ...\n\n"
    exec nvim
  fi

  print_result $? "nvim: plug done"
}

main() {
  print_in_purple "\n   nvim: install check ...\n\n"
  nvim_install

  print_in_purple "\n   nvim: clone check ...\n\n"
  nvim_clone

  print_in_purple "\n   nvim: plug check ...\n\n"
  nvim_plug
}

main
