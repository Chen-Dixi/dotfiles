#!/bin/bash
SUDO_PREFIX=$1

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

  if command -v tmux >/dev/null 2>&1; then
    echo 'tmux detected, skip install tmux'
  else
    echo 'no exist tmux, installing'
    brew install tmux
  fi

elif [ $(uname) == "Linux" ]; then
  echo "Detect Linux"

  if command -v git >/dev/null 2>&1; then
    echo 'git detected, skip install git'
  else
    echo 'no exists git, installing'
    ${SUDO_PREFIX} apt install git
  fi

  if command -v tmux >/dev/null 2>&1; then
    echo 'tmux detected, skip install tmux'
  else
    echo 'no exist tmux, installing'
    ${SUDO_PREFIX} apt install tmux
  fi
fi

# simple script
# TODO: need to decomple the path in .tmux.conf <13-06-20, Duan-JM> #
cp -rf ./tmux.conf ~/.tmux.conf
cp -rf ./tmux ~/.tmux