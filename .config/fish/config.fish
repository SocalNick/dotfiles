# nice light cyan color instead of dark blue
set -Ux LSCOLORS gxfxcxdxbxegedabagacad

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# setup golang
set -x GOPATH $HOME/workspace/go
set PATH $HOME/workspace/go/bin $PATH
