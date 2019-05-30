#!/bin/bash

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it || bash-it update
~/.bash_it/install.sh --no-modify-config
