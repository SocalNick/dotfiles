#!/bin/bash

# check prerequisites

which brew &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "\nError: Homebrew not installed\n\n"
  exit 1
fi

# fix working dir
cd "$(dirname "${BASH_SOURCE}")"

if [ "$2" != "--no-pull" -a "$2" != "-n" ]; then
  printf "\n# Pulling latest changes...\n"
  git pull
  if [[ $? -ne 0 ]]; then
    printf "\nWarning: git failed pulling the latest version (see details above).\n\n"
  fi
fi

# from https://github.com/holman/dotfiles

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

DOTFILES_ROOT=$(pwd -P)

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  printf "\n# Installing dotfiles... "

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_dotfiles

printf "\n# Checking for fish... "
brew ls fish &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "not found, installing...\n\n"
  brew update
  if [[ $? -ne 0 ]]; then
    printf "\nError: Homebrew update failed. Aborting.\n\n"
    exit 1
  fi
  brew install fish
  if [[ $? -ne 0 ]]; then
    printf "\nError: fish installation failed. Aborting.\n\n"
    exit 1
  fi
  printf "\nSee instructions above for making fish the default shell.\n"
else
  printf "ok.\n\n"
fi

printf "# Setting up/refreshing fish settings (i.e. universal variables)... "
fish apply-settings.fish
if [[ $? -ne 0 ]]; then
  printf "\nError: applying fish settings failed.\n\n"
  exit 1
else
  printf "done.\n\n"
fi
