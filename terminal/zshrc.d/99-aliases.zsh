# quit {{{
alias q="exit"
alias x="exit"
# }}}
# sudo {{{
alias s="sudo"
# }}}
# ranger auto-cd {{{
# thanks to gombai sandor on stackexchange (superuser.com/questions/1043806)!
which apt &>/dev/null
if [ $? -eq 0 ]; then
  alias ranger='ranger --choosedir=$HOME/.config/rangerdir; LASTDIR=`cat $HOME/.config/rangerdir`; cd "$LASTDIR"'
fi
# }}}
# firefox shorthand and default -new-tab {{{
alias firefox="firefox -new-tab"
alias ff="firefox"
# }}}
# journalctl alias {{{
alias jctl="sudo journalctl"
# }}}
# rm {{{
alias rr="rm -r"
alias nuke="rm -rf"
alias rf="rm -rf"
# }}}
# ls (with colors) {{{
case $() in
Linux*) # {{{
  alias ls="ls --color=auto"
  alias sl="ls --color=auto"
  alias l="ls --color=auto"
  alias la="ls -al --color=auto"
  alias ll="ls -l --color=auto"
  alias lh="ls -lh --color=auto"
;; # }}}
Darwin*|*BSD) # {{{
  alias ls="ls"
  alias sl="ls"
  alias l="ls"
  alias la="ls -al"
  alias ll="ls -l"
  alias lh="ls -lh"
;; # }}}
esac
# }}}
# neovim {{{
which nvim &>/dev/null
if [ $? -eq 0 ]; then
  alias vim="nvim"
  alias v="nvim"
  alias sv="sudo nvim"
  alias svim="sudo nvim"
  alias dev="nvim +normal\ ~ +NERDTree +wincmd\ l"
fi
# }}}
# apt {{{
which apt &>/dev/null
if [ $? -eq 0 ]; then
  alias a="apt"
  alias sa="sudo apt"
  alias acs="apt search"
  alias sai="sudo apt install"
  alias sad="sudo apt update"
  alias sau="sudo apt update"
  alias sag="sudo apt upgrade"
  alias sap="sudo apt purge"
  alias sar="sudo apt purge"
  alias saa="sudo apt autoremove"
  alias saug="sudo apt update && sudo apt upgrade"
fi
# }}}
# trizen {{{
which trizen &>/dev/null
if [ $? -eq 0 ]; then
  alias t="trizen"
  alias tzn="trizen"
  alias tzs="trizen -S"
  alias syu="trizen -Syu"
  alias tsyu="trizen -Syu"
  alias tzsyu="trizen -Syu"
  alias tss="trizen -Ss"
  alias tzss="trizen -Ss"
  alias trs="trizen -Rs"
  alias tzrs="trizen -Rs"
fi
# }}}
# yay {{{
which yay &>/dev/null
if [ $? -eq 0 ]; then
  alias ys="yay -S"
  alias syu="yay -Syu"
  alias yss="yay-Ss"
  alias yrs="yay -Rs"
  alias yrs="yay -Rs"
fi
# }}}
# quick-edit commands for some dotfiles {{{
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.config/nvim/init.vim"
# }}}
# git (dangerous alias set; this overwrites GhostScript) {{{
alias gsa="git stash apply"
alias gs="git stash"
# }}}

# vi: foldmethod=marker foldenable
