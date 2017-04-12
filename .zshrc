# bclindner zsh config

# general settings
## history
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
## misc. options
setopt autocd notify
unsetopt appendhistory beep extendedglob nomatch
bindkey -e
## autocompletion
zstyle :compinstall filename '/home/bclindner/.zshrc'
autoload -Uz compinit
compinit

# prompt
PS1="%(!.%F{red}.%F{magenta})%n%f%# " #colors username red when rooted
RPS1="%~" # right prompt displays cd

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
## administration
alias -s log="less"

# aliases
## general command shorthands
alias s="sudo"
alias ls="ls --color=auto"
alias l="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias c="clear"
alias clr="clear"
## git
### shorthand
alias gcm="git commit -am"
alias gcl="git clone"
alias ga="git add"
alias gr="git rm"
alias gps="git push"
alias gpl="git pull"
### semantic
alias commit="git commit -am"
alias clone="git clone"
alias grab="git grab"
## for Debian-based: apt
### shorthand
alias a="apt"
alias sa="sudo apt"
alias sai="sudo apt install"
alias sad="sudo apt update"
alias sau="sudo apt update"
alias sag="sudo apt upgrade"
alias sap="sudo apt purge"
alias sar="sudo apt purge"
alias sadg="sudo apt update && sudo apt upgrade"
alias sagd="sudo apt update && sudo apt upgrade"
alias saug="sudo apt update && sudo apt upgrade"
alias sagu="sudo apt update && sudo apt upgrade"
### semantic
alias install="sudo apt install"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias purge="sudo apt purge"
alias remove="sudo apt purge"
