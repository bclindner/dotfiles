# options
setopt appendhistory notify extendedglob
unsetopt beep nomatch
bindkey -v
# terminal/editor vars
export TERM=xterm-256color
export EDITOR=nvim
# history settings
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
# Darwin/BSD fixes
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# nvim aliases
alias vim=nvim
alias vi=nvim

# git aliases
alias gcam=git commit -am
alias gca=git commit -a
alias glog=git log --oneline

# quick edits to dotfiles
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.config/nvim/init.lua"

# notes/journal/todo systems
NOTEDIR=~/Developer/docs/notes/
JOURNALDIR=~/Developer/docs/journal/
NOTEFORMAT=.md
function note {
	# if no note name is provided, just ls the notedir
	if [ -z "$1" ]; then
		ls "$NOTEDIR"
	else
		# open/create a new note in ~/Developer/notes
		nvim "$NOTEDIR$@$NOTEFORMAT"
	fi
}
function notegrep {
  rg -i "$@" "$NOTEDIR"
}

function journal {
	nvim "$JOURNALDIR$(date --date="$@" --iso-8601)$NOTEFORMAT"
}
function journalgrep {
  rg "$@" "$JOURNALDIR"
}
function project {
	cd "$HOME/Developer/projects/$@"
}

PROMPT="%(?..$(tput setaf 9)[%?]$(tput sgr0) )$(tput setab 91) %n@%m $(tput sgr0):%~%# "

PATH=$PATH:$HOME/.local/bin

if [[ -d ~/.zshrc.d ]]; then
	for file in ~/.zshrc.d/*.zsh; do
		source "$file"
	done
fi
