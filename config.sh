#!/bin/bash
# dotfile configuration program

# zsh/bash configuration
if [ $SHELL = "/bin/zsh" ]; then
  echo "install shell configuration files? (zsh)"
  read -s -n 1 -r char
  ln -f $(pwd)/.bashrc ~
  if type screen 2>/dev/null; then
    echo "screen detected. add configuration?"
    read -s -n 1 -r char
    if [ $char = "y" ]; then
      ln -f $(pwd)/.screenrc ~
      ln -f $(pwd)/.zprofile ~
    fi
  fi
fi
if [ $SHELL = "/bin/bash" ]; then
  echo "install shell configuration files? (bash)"
  read -s -n 1 -r char
  ln -f $(pwd)/.bashrc ~
  if type screen 2>/dev/null; then
    echo "screen detected. add configuration?"
    read -s -n 1 -r char
    if [ $char = "y" ]; then
      ln -f $(pwd)/.screenrc ~
      ln -f $(pwd)/.bash_profile ~
    fi
  fi
fi

# xresources 
if [ ! -f ~/.xresources ]; then
  echo "no xresources detected. linking..."
  ln -f $(pwd)/.xresources ~
fi
if [ ! -f ~/.vimrc ]; then
  echo "no vimrc detected. linking..."
  ln -f $(pwd)/.vimrc ~
fi
# terminal font
echo "setup console-setup? (requires root) "
read -s -n 1 -r char
if [ $char = "y" ]; then
  sudo rm /etc/default/console-setup
  sudo cp console-setup /etc/default/console-setup
fi

#i3
echo "setup i3? "
read -s -n 1 -r char
if [ $char = "y" ]; then
  mkdir ~/.config
  ln -sf $(pwd)/i3 ~/.config/i3
fi
echo "setup xfce4? "
read -s -n 1 -r char
if [ $char = "y" ]; then
  ln -sf $(pwd)/xfce4/terminal ~/.config/xfce4
  ln -sf $(pwd)/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/xfconf/xfce-perchannel-xml/
fi

echo "done!"
