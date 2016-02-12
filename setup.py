#!/usr/bin/python3
import os

##################################
# bclindner's dotfile installer! #
################################## 
# what it does
# 
# basically it just symlinks everything that isn't in .git to its respective places.
# nothing too fancy.

symlinks = {
	'./i3/': '~/.config/i3/',
	'./i3status/': '~/.config/i3',
	'./.nanorc': '~/.nanorc',
}
for from,to in symlinks:
	print('linking {} to {}...'.format(from,to))
	os.symlink(from,to)
		
	
