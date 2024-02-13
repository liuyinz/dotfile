#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

bash_install() {

  if ! brew list --version bash >/dev/null 2>&1; then
    print_in_yellow "   bash: install start ...\n\n"
    brew install bash
  fi

  print_result $? "bash: install done"

}

zsh_install() {

  if ! brew list --version zsh >/dev/null 2>&1; then
    print_in_yellow "   zsh: install start ...\n\n"
    brew install zsh
  fi

  print_result $? "zsh: install done"

}

zsh_default() {
  # set zsh as the user login shell
  CURRENTSHELL=$(dscl . -read /Users/"$USER" UserShell | perl -lane 'print $F[1]')
  if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
    print_in_yellow "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
    sudo dscl . -change "/Users/$USER" UserShell "$SHELL" /usr/local/bin/zsh >/dev/null 2>&1
  fi

  print_result $? "zsh: default done"

}

zshrc_init() {
  if [ ! -e ~/.zshrc ]; then
    print_in_yellow "zshrc: init start ...\n\n"
    # shellcheck disable=SC2016
    echo '## Uncomment line below to start zsh profiler

# ZSH_PROFILER="true"
source $DOTFILE_HOME/.cache/init.zsh' >>"$HOME/.zshrc"
  fi

  print_result $? "zshrc: init done"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_in_purple "\n   bash: install check ...\n\n"
  bash_install

  # print_in_purple "\n   zsh: install check ...\n\n"
  # zsh_install
  #
  # print_in_purple "\n   zsh: default check ...\n\n"
  # zsh_default

  print_in_purple "\n   zshrc: init check ...\n\n"
  zshrc_init

}

main
