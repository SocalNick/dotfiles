#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install CF CLI
brew tap cloudfoundry/tap
brew install cf-cli

# Install everything else
brew install ag
brew install lastpass-cli
brew install chruby
brew install chruby-fish
brew install ruby-install

# Remove outdated versions from the cellar
brew cleanup
