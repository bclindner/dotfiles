# bclindner zsh config

# options
setopt appendhistory notify extendedglob
unsetopt beep nomatch
bindkey -v
# terminal/editor vars
ZSH=~/.zshrc.d
export TERM=xterm-256color
export EDITOR=nvim
# ignore untracked git files
DISABLE_UNTRACKED_FILES_DIRTY="true"
# ... on completion waiting
COMPLETION_WAITING_DOTS="true"
# history settings
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
# Darwin/BSD fixes
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# include antidote
source $HOME/.antidote/antidote.zsh
# include asdf
source $HOME/.asdf/asdf.sh

# source all from ~/.zshrc.d, in order lexically
for file in `ls -1 ~/.zshrc.d/**/*.zsh`; do
  source $file
done
