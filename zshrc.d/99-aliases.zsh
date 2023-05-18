# quit {{{
alias q="exit"
alias x="exit"
# }}}
# sudo {{{
alias s="sudo"
# }}}
# git {{{
# commands adapted from the oh-my-zsh git plugin - thanks y'all
alias gst="git status"
alias gaa="git add -a"
alias gc="git commit"
alias gca="git commit -a"
alias gcam="git commit -am"
alias glog="git log"
alias gcana="git commit --amend --no-edit -a"
alias gs="git stash"
alias gsa="git stash apply"
alias gsw="git switch"
alias gco="git checkout"
alias gm="git merge"
alias gsa="git stash apply"
alias gs="git stash"
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
# youtube dl-and-convert function {{{
function ytdl() {
  if ! [ -x "$(command -v youtube-dl)" ]; then
    echo "This command needs youtube-dl (pip install youtube-dl)."
    return 1
  fi
  if ! [ -x "$(command -v ffmpeg)" ]; then
    echo "This command needs ffmpeg."
    return 1
  fi
  youtube-dl $1 -o - | ffmpeg -i pipe:0 $2
}
# }}}
# podman and podman remote {{{
alias pdm=podman
alias pdmcl="podman container ls"
alias pdmi="podman image ls"
alias pdmr="podman run"
alias pdmx="podman kill"
alias pdr="podman --remote"
# function to kill then remove a container
function pdmx() {
  podman kill $1 && podman rm $1
}
# }}}
# misc. functions {{{
# serve the given static site directory on localhost:8000 and open it
function serve() {
  xdg-open http://localhost:8000 &
  python -m http.server
}

# open a file with xdg-open
function open() {
  xdg-open $@
}
# }}}


# vi: foldmethod=marker foldenable
