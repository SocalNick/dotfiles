# nice light cyan color instead of dark blue
set -Ux LSCOLORS gxfxcxdxbxegedabagacad

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# setup golang
set -x GOPATH $HOME/workspace/go
set PATH $HOME/workspace/go/bin $PATH

# setup omf/theme-bobthefish
set -g theme_display_vi yes
set -g theme_display_date no

# set correct vim
set -xg EDITOR 'vim'

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
