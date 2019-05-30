#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install everything
brew install automake aws-shell awscli azure-cli bison cloudfoundry/tap/bosh-cli ccat certbot cloudfoundry/tap/cf-cli chruby cmake composer coreutils cloudfoundry/tap/credhub-cli direnv fasd fzf git git-duet/tap/git-duet git-secrets gnupg go heroku/brew/heroku htop jq lastpass-cli libyaml lua mysql mysql-connector-c neovim openvpn pkg-config postgresql pwgen ruby-install terraform the_silver_searcher watch wget yarn

# Remove outdated versions from the cellar
brew cleanup

