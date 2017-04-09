#!/bin/bash

# nano, screen and bash
echo "linking nano, bash, and xresources configuration..."
ln -f $(pwd)/.nanorc ~
ln -f $(pwd)/.bashrc ~
ln -f $(pwd)/.xresources ~
# screen
if type screen 2>/dev/null; then
  echo "screen detected, adding configuration..."
  ln -f $(pwd)/.screenrc ~
  ln -f $(pwd)/.bash_profile ~
fi

# terminal font
echo "setup console-setup? (requires root) [y/n]"
read -s -n 1 -r char
if [ $char = "y" ]; then
  echo "copying console-setup..."
  sudo rm /etc/default/console-setup
  sudo cp console-setup /etc/default/console-setup
fi

#i3
echo "setup i3? [y/n]"
read -s -n 1 -r char
if [ $char = "y" ]; then
  echo "linking i3-gaps configuration & lemonbar..."
  mkdir ~/.config
  ln -sf $(pwd)/i3 ~/.config/i3
fi
echo "setup xfce4? [y/n]"
read -s -n 1 -r char
if [ $char = "y" ]; then
  echo "linking xfce4 configuration..."
  ln -sf $(pwd)/xfce4/terminal ~/.config/xfce4
  ln -sf $(pwd)/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/xfconf/xfce-perchannel-xml/
fi

echo "done!"
