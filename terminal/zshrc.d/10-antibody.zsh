#!/usr/bin/env zsh
# Utility functions and auto-updating system for Antibody.
# Code by Brian Lindner (bclindner), 2019
ZSHRCD=`dirname $0`

# Update Antibody. Defined here as a function for individual use.
antibody-update () {
  echo "Updating ZSH plugins..."
  # Make sure Antibody exists before starting
  if ! antibody-check-if-installed; then
    return
  fi
  # Update Antibody
  antibody bundle < $ZSHRCD/zsh_plugins.txt > $ZSHRCD/antibody-bundle.zsh
  echo $NEWSUM > $ZSHRCD/antibody.zsh.lastsum
}

# Check if Antibody is installed, returning 1 if not.
# Does some nice coloring.
antibody-check-if-installed () {
  local ERRCOLOR='\033[1;31m' # bright red
  local NOCOLOR='\033[0m'
  if ! type -p antibody > /dev/null; then
    echo "${ERRCOLOR}Couldn't find antibody!${NOCOLOR} Is it installed?"
    return 1
  fi
}

# Check for updates to the zsh-plugins file, updating or generating if necessary.
antibody-check-update () {
  # Make sure Antibody exists before starting
  if ! antibody-check-if-installed; then
    return
  fi
  # Run an update if antibody-bundle.zsh or antibody.zsh.lastsum does not exist
  if ! [[ -f $ZSHRCD/antibody-bundle.zsh || -f $ZSHRCD/antibody.zsh.lastsum ]]; then
    antibody-update
    return
  fi
  # Run an update if the file appears to have changed
  # (checked quickly with CRC32)
  OLDSUM=$(sed -n 1p $ZSHRCD/antibody.zsh.lastsum)
  NEWSUM=$(crc32 $ZSHRCD/zsh_plugins.txt)
  if [[ "$OLDSUM" != "$NEWSUM" ]]; then
    antibody-update
    echo $NEWSUM > $ZSHRCD/antibody.zsh.lastsum
    return
  fi
}
# Check for updates to the zsh-plugins file
antibody-check-update
