ez-install: fonts vim zsh tmux xfce4-terminal xresources git
update: vim-force zsh-force tmux-force xfce4-terminal-force xresources-force git-force
update-desktop: update dwm-force conky-desktop-force
update-laptop: update dwm-force conky-laptop-force
fonts:
	git clone https://github.com/powerline/fonts.git
	sh -c fonts/install.sh
	mkdir -p ~/.config/fontconfig/conf.d
	cp -f fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	fc-cache -vf
	rm -rf fonts
fonts-force:
	-rm -rf fonts
	git clone https://github.com/powerline/fonts.git
	sh -c fonts/install.sh
	mkdir -p ~/.config/fontconfig/conf.d
	cp fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	fc-cache -vf
	rm -rf fonts
vim:
	ln -sr terminal/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +VundleInstall +qall
vim-force:
	ln -srf terminal/vimrc ~/.vimrc
	-git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	vim +VundleInstall +qall
zsh:
	sh -c "`wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`"
	ln -srf terminal/zshrc ~/.zshrc
	cd ~/.oh-my-zsh/custom; mkdir themes
	ln -sr terminal/bclindner.zsh-theme ~/.oh-my-zsh/custom/themes/
zsh-force:
	-sh -c "`wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -`"
	ln -srf terminal/zshrc ~/.zshrc
	mkdir -p ~/.oh-my-zsh/custom/themes
	ln -srf terminal/bclindner.zsh-theme ~/.oh-my-zsh/custom/themes/
tmux:
	ln -sr terminal/tmux.conf ~/.tmux.conf
tmux-force:
	ln -srf terminal/tmux.conf ~/.tmux.conf
xfce4-terminal:
	mkdir -p ~/.config/xfce4/terminal/
	ln -sr terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
xfce4-terminal-force:
	mkdir -p ~/.config/xfce4/terminal/
	ln -sfr terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
dwm:
	git clone https://github.com/bclindner/dwm
	$(MAKE) -C dwm install
	ln -sr desktop/xprofile ~/.xprofile
	rm -rf dwm
dwm-force:
	-rm -rf dwm
	git clone https://github.com/bclindner/dwm
	$(MAKE) -C dwm install
	ln -srf desktop/xprofile ~/.xprofile
	rm -rf dwm
conky-desktop:
	ln -sf desktop/conkyrc.desktop ~/.conkyrc
conky-desktop-force:
	ln -srf desktop/conkyrc.desktop ~/.conkyrc
conky-laptop:
	ln -sf desktop/conkyrc.laptop ~/.conkyrc
conky-laptop-force:
	ln -srf desktop/conkyrc.laptop ~/.conkyrc
xresources:
	ln -sr desktop/Xresources ~/.Xresources
xresources-force:
	ln -srf desktop/Xresources ~/.Xresources
git:
	ln -sr terminal/gitconfig ~/.gitconfig
git-force:
	ln -srf terminal/gitconfig ~/.gitconfig
