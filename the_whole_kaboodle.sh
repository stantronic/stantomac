#!/bin/bash
WHICH_XCODE=$(xcode-select --install 2>&1) 
if [[ $WHICH_XCODE == *"already"* ]]; then
  echo "Xcode command line tools already installed"
else
  echo installing command line tools
  echo $WHICH_XCODE
fi

WHICH_BREW=$(which brew)
echo "$WHICH_BREW"
if [[ $WHICH_BREW == "/usr/local/bin/brew"* ]]; then
  echo "Homebrew already installed at $WHICH_BREW"
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

WHICH_EASY_INSTALL=$(which easy_install)
if [[ $WHICH_EASY_INSTALL == "/usr/local/bin/easy_install" ]]; then
  echo "Easy Install already installed at $WHICH_EASY_INSTALL"
else
  echo "Easy Install not installed"
  exit 1
fi

ansible-playbook playbook.yml

exit 0
