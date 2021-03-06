#!/usr/bin/env bash

read -r -p "Sync which config ? [h(ome)|w(ork)] " use_config
read -r -p "Sync nvim setting ? [y|n] " use_nvim

# git clone respository
cd ~/.local/ || exit
echo "ensure $DOT_DIR are available..."
[[ ! -d dotfile ]] && git clone https://github.com/liuyinz/dotfile.git

# ###########################################################
# install xcode
# ###########################################################

echo "ensuring build/install tools are available"
if ! xcode-select --print-path &>/dev/null; then
  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &>/dev/null
  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &>/dev/null; do
    sleep 5
  done
  print_result $? ' XCode Command Line Tools Installed'
  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10
  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'
fi

# ###########################################################
# install homebrew
# ###########################################################

exists() {
  which "$1" &>/dev/null
}

echo "checking homebrew..."
if ! exists brew; then
  echo "installing homebrew"
  if ! /bin/bash -c "$(
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
  )"; then
    echo "unable to install homebrew, script $0 abort!"
    exit 2
  fi
fi

# ###########################################################
# install Brewfile
# ###########################################################

echo "bundle install begin..."
brew bundle install --no-lock --file=common/Brewfile
brew update && brew upgrade && brew cleanup
echo "bundle installation finished."

# ###########################################################
# sync dotfiles
# ###########################################################

if exists bonclay; then
  if [[ $use_config =~ (h|H|home|HOME) ]]; then
    echo "bonclay sync common.yaml && bonclay sync home.yaml"
    bonclay sync common.yaml && bonclay sync home.yaml
  elif [[ $use_config =~ (w|W|work|WORK) ]]; then
    echo "bonclay sync common.yaml && bonclay sync work.yaml"
    bonclay sync common.yaml && bonclay sync work.yaml
  else
    echo "pls choose right config!!"
  fi
else
  echo "bonclay not installed !!"
fi

if exists nvim && [[ $use_nvim =~ (y|yes|Y) ]]; then
  echo "Cloning nvim setting..."
  rm -f ~/.config/nvim
  git clone https://github.com/liuyinz/nvim.git ~/.config/nvim
else
  echo "neovim not installed !"
fi

# ###########################################################
# Set default zsh
# ###########################################################

echo "checking whether homebrew zsh as default shell..."
[[ ! $(brew list --version zsh) ]] && brew install zsh
# set zsh as the user login shell
CURRENTSHELL=$(dscl . -read /Users/"$USER" UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  echo "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  # sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  # chsh -s /usr/local/bin/zsh
  sudo dscl . -change /Users/"$USER" UserShell "$SHELL" /usr/local/bin/zsh >/dev/null 2>&1
fi
# source init.sh
# sed -i "\:$ETC/init.sh:d" ~/.bashrc

# shellcheck disable=SC2016
echo 'Adding line to .zshrc: source $DOT_DIR/common/zsh/init.zsh'
# shellcheck disable=SC2016
echo '# Uncomment line below to start zsh profiler
# ZSH_PROFILER="true"

source $DOT_DIR/common/zsh/init.zsh' >>~/.zshrc

echo "All done! Pls restart zsh."
