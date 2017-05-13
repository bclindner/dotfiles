all: fonts vim zsh screen xfce4-terminal
fonts:
	git clone https://github.com/powerline/fonts.git
	sh -c fonts/install.sh
	mkdir -p ~/.config/fontconfig/conf.d
	cp fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	fc-cache -vf
	cd ..
	rm -rf fonts
vim:
	-ln -sr .vimrc ~
	-git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +VundleInstall +qall
zsh:
	ln -sr .zshrc ~
screen:
	ln -sr .screenrc ~
	ln -sr .zprofile ~
xfce4-terminal:
	mkdir -p ~/.config/xfce4/terminal/
	ln -sr .config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
dwm:
	git clone https://github.com/bclindner/dwm-bclindner
	cd bclindner; $(MAKE)
	ln -sr .xprofile ~
	ln -sr .conkyrc ~
