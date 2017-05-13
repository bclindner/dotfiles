# history size shouldn't need to be too massive
HISTSIZE=200
HISTFILESIZE=500

# what does this do again??
shopt -s checkwinsize

# color prompt, of course. what is a swaggy dotfile without a color prompt?
color_prompt=yes

# cute lil' PS1
PS1="[\h.\u:\w] > "

# colors! s/o to terminal.sexy
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
    \e]P0171d24
    \e]P1af3131
    \e]P265cc3e
    \e]P3ee7d2f
    \e]P44a8cc3
    \e]P59442af
    \e]P645c3b3
    \e]P7777777
    \e]P8373b41
    \e]P9d05c5c
    \e]PAa6e174
    \e]PBe4954c
    \e]PC65a7df
    \e]PDc17dd5
    \e]PE7cdacd
    \e]PFe3e3e3
    "
    # get rid of artifacts
    clear
fi
                                        
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
