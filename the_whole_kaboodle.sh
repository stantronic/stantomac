#!/bin/bash

echo "Stantomac! -- lets set up your mac with loadsa goodies"

WHICH_XCODE=$(xcode-select --install 2>&1) 
if [[ $WHICH_XCODE == *"already"* ]]; then
  echo "Xcode command line tools already installed"
else
  echo installed command line tools
  echo $WHICH_XCODE
fi

# Install homebrew if not already installed
WHICH_BREW=$(which brew)
echo "$WHICH_BREW"
if [[ $WHICH_BREW == "/usr/local/bin/brew"* ]]; then
  echo "Homebrew already installed at $WHICH_BREW"
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install ansible if not already installed
WHICH_ANSIBLE=$(which ansible)
if [[ $WHICH_ANSIBLE == "/usr/local/bin/ansible" ]]; then
  echo "Ansible already installed at $WHICH_ANSIBLE"
else
  brew install ansible 
fi

echo "Ready to run ansible script..."

ansible-playbook playbook.yml 

echo "all done"

exit 0
