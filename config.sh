#!/bin/bash

#i3
echo "linking i3-gaps configuration..."
mkdir ~/.config
ln -sf i3 ~/.config
ln -sf i3status ~/.config

# nano, screen and bash
echo "linking nano, screen, and bash configuration..."
ln -f .nanorc ~
ln -f .screenrc ~
ln -f .bash_profile ~
ln -f .bashrc ~

# terminal font
echo "linking console-setup..."
sudo rm /etc/default/console-setup
sudo cp console-setup /etc/default/console-setup

echo "done!"
