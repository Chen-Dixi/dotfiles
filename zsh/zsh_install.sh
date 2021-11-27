#!/bin/bash
SUDO_PREFIX=$1

# os check
if [ $(uname) == "Darwin" ]; then
  echo "Dectect MacOS"

  if command -v brew >/dev/null 2>&1; then
    echo 'brew detected, skip install brew'
  else
    echo 'no exists brew, installing'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if command -v git >/dev/null 2>&1; then
    echo 'git detected, skip install git'
  else
    echo 'no exists git, installing'
    brew install git
  fi

  if command -v zsh >/dev/null 2>&1; then
    echo 'zsh detected, skip install tmux'
  else
    echo 'no exist zsh, installing'
    brew install zsh
    chsh -s /bin/zsh
  fi

  if [ ! -d "~/.oh-my-zsh" ]; then
    echo 'no exist oh my zsh, installing'
    bash ./ohmyzsh_install.sh
  else
    echo 'oh my zsh detected, skip installing'
  fi

elif [ $(uname) == "Linux" ]; then
  echo "Detect Linux"

  if command -v git >/dev/null 2>&1; then
    echo 'git detected, skip install git'
  else
    echo 'no exists git, installing'
    ${SUDO_PREFIX} apt install git
  fi

  if command -v zsh >/dev/null 2>&1; then
    echo 'zsh detected, skip install tmux'
  else
    echo 'no exist zsh, installing'
    ${SUDO_PREFIX} apt install zsh
    chsh -s /bin/zsh
  fi
  
  if [ ! -d "~/.oh-my-zsh" ]; then
    echo 'no exist oh my zsh, installing'
    bash ./ohmyzsh_install.sh
  else
    echo 'oh my zsh detected, skip installing'
  fi
fi

cp ./oh-my-zsh/themes/astro.zsh-theme ~/.oh-my-zsh/themes/astro/zsh-theme

cp -rf ./general_alias ~/.general_alias
cp -rf ./software_alias ~/.software_alias
cp -rf ./zsh_tools ~/.zsh_tools