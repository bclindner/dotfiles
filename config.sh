#!/bin/bash

#i3
echo "linking i3-gaps configuration & lemonbar..."
mkdir ~/.config
ln -sf $(pwd)/i3 ~/.config/i3

echo "linking xfce4-terminal configuration..."
ln -sf $(pwd)/xfce4/terminal ~/.config/xfce4

# nano, screen and bash
echo "linking nano, screen, and bash configuration..."
ln -f $(pwd)/.nanorc ~
ln -f $(pwd)/.screenrc ~
ln -f $(pwd)/.bash_profile ~
ln -f $(pwd)/.bashrc ~
ln -f $(pwd)/.xresources ~


# terminal font
echo "copying console-setup..."
sudo rm /etc/default/console-setup
sudo cp console-setup /etc/default/console-setup

echo "done!"
