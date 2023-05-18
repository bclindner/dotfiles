#!/usr/bin/env zsh
# Utility functions and auto-updating system for Antidote.
# Code by Brian Lindner (bclindner), 2019
ZSHRCD=`dirname $0`

# Update Antidote. Defined here as a function for individual use.
antidote-update () {
  echo "Updating ZSH plugins..."
  # Make sure Antidote exists before starting
  if ! antidote-check-if-installed; then
    return
  fi
  # Update Antidote
  antidote bundle < $ZSHRCD/zsh_plugins.txt > $ZSHRCD/antidote-bundle.zsh
  echo $NEWSUM > $ZSHRCD/antidote.zsh.lastsum
}

# Check if Antidote is installed, returning 1 if not.
# Does some nice coloring.
antidote-check-if-installed () {
  return 0
  local ERRCOLOR='\033[1;31m' # bright red
  local NOCOLOR='\033[0m'
  if ! type -p antidote > /dev/null; then
    echo "${ERRCOLOR}Couldn't find antidote!${NOCOLOR} Is it installed?"
    return 1
  fi
}

# Check for updates to the zsh-plugins file, updating or generating if necessary.
antidote-check-update () {
  # Make sure Antidote exists before starting
  if ! antidote-check-if-installed; then
    return
  fi
  # Run an update if antidote-bundle.zsh or antidote.zsh.lastsum does not exist
  if ! [[ -f $ZSHRCD/antidote-bundle.zsh || -f $ZSHRCD/antidote.zsh.lastsum ]]; then
    antidote-update
    return
  fi
  # Run an update if the file appears to have changed
  # (checked quickly with CRC32)
  OLDSUM=$(sed -n 1p $ZSHRCD/antidote.zsh.lastsum)
  NEWSUM=$(cksum $ZSHRCD/zsh_plugins.txt)
  if [[ "$OLDSUM" != "$NEWSUM" ]]; then
    antidote-update
    echo $NEWSUM > $ZSHRCD/antidote.zsh.lastsum
    return
  fi
}
# Check for updates to the zsh-plugins file
antidote-check-update
