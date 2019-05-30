#!/bin/bash

# confirm dependencies
which nvim || brew install neovim
which curl || brew install curl
which npm || brew install node
which yarn || brew install yarn
which python3 || brew install python

ln -s /usr/local/bin/nvim /usr/local/bin/vim || true
pip3 install pynvim

git clone https://github.com/luan/nvim ~/.config/nvim

