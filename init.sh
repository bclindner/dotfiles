#!/usr/bin/zsh
# Initialize an environment with the bclindner dotfiles.

set -u

# Directory to put the Developer folder
DEV_FOLDER=$HOME/Developer
# Directory to put the dotfiles
DOTSDIR=$DEV_FOLDER/dotfiles
# App versions
PLUGVIM_VERSION="0.11.0"
ANTIDOTE_VERSION="v1.8.6"
ASDF_VERSION="v0.11.3"

#############################

# required commands
REQUIRED_COMMANDS=(mkdir ln zsh nvim git curl)
# paths that cannot be created before initialization
REQUIRED_NONEXISTING_PATHS=(
    "$HOME/.asdf"
    "$HOME/.zshrc.d"
    "$DEV_FOLDER"
    "$HOME/.config/nvim"
)

# logging constructs
log() {
    echo -e "\033[$1 $2 \033[0m"
}
log_fail() {
    log '0;31m[fail]' "$1"
}
log_warn() {
    log '0;33m[warn]' "$1"
}
log_info() {
    log '0m[info]' "$1"
}
log_ok() {
    log '0;32m[done]' "$1"
}

# ensure a command exists
# return a warning log line and return status 1 if it does not
ensure_command_exists() {
    if ! command -v $1 &>/dev/null; then
        log_warn "command not in PATH: $1"
        return 1
    fi
}

ensure_path_not_exists() {
    if [[ -d "$1" ]]; then
        log_warn "path already exists: $1"
        return 1
    fi
}

log_info "checking for required commands..."

# test for required commands
failures=0
for name in ${REQUIRED_COMMANDS[@]}; do
    ensure_command_exists $name
    failures=$(($failures+$?))
done

log_info "checking for directory issues..."

for dir in ${REQUIRED_NONEXISTING_PATHS[@]}; do
    ensure_path_not_exists $dir
    failures=$(($failures+$?))
done

set -e

# if anything failed, exit early
if [ $failures -gt 0 ]; then
    log_fail "$failures problems detected, cannot continue"
fi

if [[ $- == *i* ]]; then
    # if we are in an interactive session, ask for confirmation
    log_info "no problems detected, press enter to continue"
    read
fi

log_info "creating developer folder structure..."
mkdir -p "$HOME/Developer"
mkdir -p "$HOME/Developer/projects"
mkdir -p "$HOME/Developer/sandboxes"
mkdir -p "$HOME/Developer/archive"


log_info "cloning dotfiles..."
git clone https://github.com/bclindner/dotfiles.git $DOTSDIR

log_info "setting up (neo)vim..."
mkdir -p $HOME/.config/nvim
ln -s "$DOTSDIR/nvim" "$HOME/.config/nvim"

log_info "setting up zsh..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_VERSION
git clone --depth=1 --branch "$ANTIDOTE_VERSION" https://github.com/mattmc3/antidote.git ${HOME}/.antidote
ln -s "$DOTSDIR/zshrc" "$HOME/.zshrc"
ln -s "$DOTSDIR/zshrc.d" "$HOME/.zshrc.d"
zsh -ci "antidote update"

log_info "setting up misc. links..."
ln -s "$DOTSDIR/gitconfig" "$HOME/.gitconfig"

log_ok "dotfiles fully initialized"
log_ok "run \`source ~/.zshrc\` or relog session to initialize zsh"
