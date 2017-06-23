#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install CF CLI / BOSH CLI
brew tap cloudfoundry/tap
brew install cf-cli
cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org/
cf install-plugin Diego-Enabler -r CF-Community
brew install bosh-cli

# Install Vagrant
brew cask install virtualbox
brew cask install vagrant

# Install everything else
brew install ag
brew install lastpass-cli
brew install chruby
brew install chruby-fish
brew install ruby-install
brew install golang
brew install jq
brew install mysql
brew install postgresql
brew install tmate
brew install Caskroom/cask/sequel-pro
brew install watch
brew install vim --with-lua
brew install node
brew install heroku
brew install direnv

brew tap universal-ctags/universal-ctags
brew install universal-ctags --HEAD

# Remove outdated versions from the cellar
brew cleanup
