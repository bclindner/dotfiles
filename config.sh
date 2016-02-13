#!/bin/bash

#i3
echo "linking i3-gaps configuration...\n"
mkdir ~/.config
ln -sf i3 ~/.config
ln -sf i3status ~/.config

# nano, screen and bash
echo "linking nano, screen, and bash configuration...\n"
ln -f .nanorc ~
ln -f .screenrc ~
ln -f .bash_profile ~
ln -f .bashrc ~

# terminal font
echo "setting console font... (this may only work on debian)"
sudo setfont /usr/share/consolefonts/Uni3-Terminus14.psf.gz
