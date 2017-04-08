#!/bin/bash

# nano, screen and bash
echo "linking screen, and bash configuration..."
ln -f $(pwd)/.screenrc ~
ln -f $(pwd)/.bash_profile ~
ln -f $(pwd)/.bashrc ~
ln -f $(pwd)/.xresources ~


# terminal font
echo "copying console-setup..."
sudo rm /etc/default/console-setup
sudo cp console-setup /etc/default/console-setup

echo "done!"
