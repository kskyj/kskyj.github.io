#!/bin/bash

# oh-my-zsh, zsh plugin, homebrew, iterm2 설치 및 설정

# command line tool
echo "# Install apple command line tool"
xcode-select --install

# NODE TLS DISABLE
echo 'export NODE_TLS_REJECT_UNAUTHORIZED=0' >> ~/.zprofile

# homebrew /Users/$USER/.zprofile
echo "# Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh-my-zsh
echo "# Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
