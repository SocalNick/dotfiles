#!/bin/bash

# clone
git clone https://github.com/powerline/fonts.git --depth=1 ~/workspace/fonts
# install
cd ~/workspace/fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
