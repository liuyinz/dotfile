#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" && source "./utils.sh"

are_command_line_tools_installed() {
  xcode-select --print-path &>/dev/null
}

install_command_line_tools() {

  # If necessary, prompt user to install the `Xcode Command Line Tools`.

  xcode-select --install &>/dev/null

  # Wait until the `Xcode Command Line Tools` are installed.

  execute \
    "until are_command_line_tools_installed; do \
            sleep 5; \
         done" \
    "Command Line Tools"

}

main() {
  
  print_in_purple "   Command Line Tools\n\n"
  
  install_command_line_tools
  # install_xcode
  # set_xcode_developer_directory
  # agree_with_xcode_licence
  
}

main
