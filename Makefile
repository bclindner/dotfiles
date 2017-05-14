all: fonts vim zsh tmux xfce4-terminal
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
	sh -c "`wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`"
	ln -srf .zshrc ~
screen:
	ln -sr .screenrc ~
	ln -sr .zprofile ~
tmux:
	ln -sr .tmux.conf ~
xfce4-terminal:
	mkdir -p ~/.config/xfce4/terminal/
	ln -sr .config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
dwm:
	git clone https://github.com/bclindner/dwm
	$(MAKE) -C dwm
	$(MAKE) -C dwm install
	ln -sr .xprofile ~
	ln -sr .conkyrc ~
	rm -rf dwm
