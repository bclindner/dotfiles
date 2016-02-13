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

# tamsyn 1.11 as terminal font - s/o to Scott Fial!
echo "setting console font...\n"
wget http://www.fial.com/~scott/tamsyn-font/download/tamsyn-font-1.11.tar.gz
tar -xzvf tamsyn-font-1.11.tar.gz tamsyn-font-1.11/Tamsyn7x14r.psf.gz
cp tamsyn-font-1.11/Tamsyn7x14r.psf.gz ~/.config/
sudo setfont ~/.config/Tamsyn7x14r.psf.gz
rm -rf tamsyn*
