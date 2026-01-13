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

# simple aliases
alias q=quit
alias doit="sudo !!"

# nvim aliases
alias vim=nvim
alias vi=nvim

# git aliases
alias gst="git status"
alias gcam="git commit -am"
alias gca="git commit -a"
alias gco="git checkout"
alias glog="git log --oneline"

# quick edits to dotfiles
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.config/nvim/"

# programming helpers
alias activate="source .venv/bin/activate"

# notes/journal/todo systems
NOTEDIR=~/Developer/docs/notes/
JOURNALDIR=~/Developer/docs/journal/
NOTEFORMAT=.md
function note { # create/view/update a note with $EDITOR
	# if no note name is provided, just ls the notedir
	if [ -z "$1" ]; then
		ls "$NOTEDIR"
	else
		# open/create a new note in ~/Developer/notes
		$EDITOR "$NOTEDIR$@$NOTEFORMAT"
	fi
}
function notegrep { # search notes
  rg -i "$@" "$NOTEDIR"
}

function journal { # open journal. default to today
	$EDITOR "$JOURNALDIR$(date --date="$@" --iso-8601)$NOTEFORMAT"
}
function journalgrep { # search journal
  rg -i "$@" "$JOURNALDIR"
}
alias todo="journalgrep TODO"

# Dev folder automations
function project { # move to a project
	cd "$HOME/Developer/projects/$@"
}
function sandbox { # move to a sandbox, create if needed
	folder="$HOME/Developer/sandboxes/$@"
	mkdir -p "$folder"
	cd "$folder"
}
SCRIPTSDIR="$HOME/Developer/scripts"
function script { # run a script
	if [ -z "$@" ]; then
		cd "$SCRIPTSDIR"
		return
	fi
	"$SCRIPTSDIR/$@"
}

PROMPT="%(?..$(tput setaf 9)[%?]$(tput sgr0) )$(tput setab 91) %n@%m $(tput sgr0):%~%# "

PATH=$PATH:$HOME/.local/bin

# source all the zshrc.d stuff
if [[ -d ~/.zshrc.d ]]; then
	for file in ~/.zshrc.d/*.zsh; do
		source "$file"
	done
fi
