# bclindner zsh config

# general settings
## history
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
## misc. options
setopt autocd notify extendedglob
unsetopt appendhistory beep nomatch
bindkey -e
## autocompletion
zstyle :compinstall filename '/home/bclindner/.zshrc'
autoload -Uz compinit
compinit

# prompt
PS1="%(!.%F{red}.%F{magenta})%n%f%(?..%F{red})%#%f " # colors username red if root, and %# red if command failed
if ! [[ /proc/$PPID/exe -ef /usr/bin/mc ]]; then # `mc`-safe: RPS1 does not initialize if the terminal is run from `mc`
RPS1="%~" # right prompt displays cd
fi

# prompt file associations (suffix aliases)
## vim for webdev
alias -s js="vim"
alias -s html="vim"
alias -s css="vim"
alias -s json="vim"
alias -s sass="vim"
alias -s less="vim"
alias -s scss="vim"
alias -s pug="vim"
alias -s md="vim"
alias -s txt="vim"
alias -s c="vim"
## administration
alias -s log="less"

# aliases
## general command shorthands
### rm
alias rr="rm -r"
alias nuke="rm -rf"
### sudo
alias s="sudo"
### ls/ll/la/l
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
### clear
alias c="clear"
alias clr="clear"
### a little creature comfort: clear && ls
alias cl="clear && ls"
### quit
alias q="exit"
alias x="edit"
### vim
alias v="vim"
alias sv="sudo vim"
alias svim="sudo vim"
### ranger
alias rng="ranger"
alias browse="ranger"
alias r="ranger" #remove if machine has R installed
### GHCi shorthand
alias h="ghci"
### GHCi semisemantic
alias hask="ghci"
### GHCi semantic
alias haskell="ghci"
### node shorthand
alias n="node"
### compiling semantic
alias build=". ./configure && make && sudo make install"
alias m="make"
alias sm="sudo make"
alias smi="sudo make install"
# git
### shorthand
alias gi="git init"
alias gcm="git commit -am"
alias gcl="git clone"
alias ga="git add"
alias gaa="git add -A"
alias gr="git rm"
alias gps="git push"
alias gpl="git pull"
alias gl="git log"
alias gst="git status" # gs is taken by GhostScript
### semantic
alias commit="git commit -am"
alias clone="git clone"
alias grab="git grab"
alias push="git push"
alias pull="git pull"
alias status="git status"
## for Debian-based: apt
### shorthand
alias a="apt"
alias sa="sudo apt"
alias af="apt search" # we can't use as for this alias because GNU `as` would be overwritten. dammit, stallman.
alias sai="sudo apt install"
alias sad="sudo apt update"
alias sau="sudo apt update"
alias sag="sudo apt upgrade"
alias sap="sudo apt purge"
alias sar="sudo apt purge"
alias saa="sudo apt autoremove"
alias saar="sudo apt autoremove"
alias sadg="sudo apt update && sudo apt upgrade"
alias sagd="sudo apt update && sudo apt upgrade"
alias saug="sudo apt update && sudo apt upgrade"
alias sagu="sudo apt update && sudo apt upgrade"
### semantic
alias install="sudo apt install"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias update-upgrade="sudo apt update && sudo apt upgrade"
alias purge="sudo apt purge"
alias remove="sudo apt purge"
alias search="apt search"
## ranger auto-cd; thanks to gombai sandor on stackexchange (superuser.com/questions/1043806)!
alias ranger='ranger --choosedir=$HOME/.config/rangerdir; LASTDIR=`cat $HOME/.config/rangerdir`; cd "$LASTDIR"'
# shell text replacements (global aliases)
## common pipe commands
alias -g p-G="| grep"
alias -g p-L="| less"
