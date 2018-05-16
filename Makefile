ez-install: fonts vim zsh xfce4-terminal xresources git
update: vim-force zsh-force xfce4-terminal-force xresources-force git-force
fonts:
	# clone into powerline fonts
	git clone https://github.com/powerline/fonts.git
	# install fonts with their script
	sh -c fonts/install.sh
	# perform their fix for terminess-powerline
	mkdir -p ~/.config/fontconfig/conf.d
	cp -f fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	# refresh font-cache
	fc-cache -vf
	# clean up
	rm -rf fonts

fonts-force:
	# clone into powerline fonts (remove if present)
	-rm -rf fonts
	git clone https://github.com/powerline/fonts.git
	# install fonts with their script
	sh -c fonts/install.sh
	# perform their fix for terminess-powerline
	mkdir -p ~/.config/fontconfig/conf.d
	cp fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	# refresh font-cache
	fc-cache -vf
	# clean up
	rm -rf fonts

vim:
	# ensure vim is installed
	vim --version
	# symlink the vimrc
	ln -sr terminal/vimrc ~/.vimrc
	# make the autoload directory
	mkdir -p ~/.vim/autoload
	# download vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	vim +PlugInstall +qall

vim-force:
	# ensure vim is installed
	vim --version
	# symlink the vimrc, forcefully
	ln -srf terminal/vimrc ~/.vimrc
	# make the autoload directory
	mkdir -p ~/.vim/autoload
	# download vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	vim +PlugInstall +qall

zsh:
	# clone the oh-my-zsh repo to $HOME
	git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	# symlink the zshrc
	ln -sr terminal/zshrc ~/.zshrc
	# make the custom themes folder
	mkdir -p ~/.oh-my-zsh/custom/themes
	# symlink the custom theme
	ln -sr terminal/bclindner.zsh-theme ~/.oh-my-zsh/custom/themes/

zsh-force:
	# clone the oh-my-zsh repo to $HOME
	git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	# symlink the zshrc
	ln -srf terminal/zshrc ~/.zshrc
	# make the custom themes folder
	mkdir -p ~/.oh-my-zsh/custom/themes
	# symlink the custom theme, forcefully
	ln -srf terminal/bclindner.zsh-theme ~/.oh-my-zsh/custom/themes/

xfce4-terminal:
	# ensure xfce4-terminal is installed
	xfce4-terminal --version
	# create the terminal config directory if necessary
	mkdir -p ~/.config/xfce4/terminal/
	# symlink the file
	ln -sr terminal/xfce4-terminal ~/.config/xfce4/terminal/terminalrc

xfce4-terminal-force:
	# ensure xfce4-terminal is installed
	xfce4-terminal --version
	# create the terminal config directory if necessary
	mkdir -p ~/.config/xfce4/terminal/
	# symlink the file, forcefully
	ln -srf terminal/xfce4-terminal ~/.config/xfce4/terminal/terminalrc

xresources:
	# symlink Xresources
	ln -sr desktop/Xresources ~/.Xresources

xresources-force:
	# symlink Xresources, forcefully
	ln -srf desktop/Xresources ~/.Xresources

git:
	# ensure git is installed (i would hope it is)
	git --version
	# link the gitconfig
	ln -sr terminal/gitconfig ~/.gitconfig

git-force:
	# ensure git is installed (i would hope it is)
	git --version
	# link the gitconfig
	ln -srf terminal/gitconfig ~/.gitconfig

i3:
	# ensure i3 is installed
	i3 -v
	# symlink i3 config folder
	ln -sr desktop/i3 ~/.config/i3

i3-force:
	# ensure i3 is installed
	i3 -v
	# symlink i3 config folder, forcefully
	ln -srf desktop/i3 ~/.config/i3

polybar:
	# ensure polybar is installed
	polybar -v
	# symlink polybar config folder
	ln -sr desktop/polybar ~/.config/polybar

polybar-force:
	# ensure polybar is installed
	polybar -v
	# symlink polybar config folder, forcefully
	ln -srf desktop/polybar ~/.config/polybar
