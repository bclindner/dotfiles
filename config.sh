#!/bin/bash

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

#i3
echo "setup i3? [y/n]"
read -n 1 -r char
if [ $char = "y" ]; then
  echo "linking i3-gaps configuration & lemonbar..."
  mkdir ~/.config
  ln -sf $(pwd)/i3 ~/.config/i3
fi
echo "setup xfce4-terminal? [y/n]"
if [ $char = "y" ]; then
  echo "linking xfce4-terminal configuration..."
  ln -sf $(pwd)/xfce4/terminal ~/.config/xfce4
fi

echo "done!"
