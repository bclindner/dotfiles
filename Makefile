default: fonts nvim zsh xresources i3 polybar git rofi
terminal: git nvim zsh
desktop: fonts xresources i3 polybar rofi

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
	git clone --depth=1 https://github.com/powerline/fonts.git
	# install fonts with their script
	sh -c fonts/install.sh
	# perform their fix for terminess-powerline
	mkdir -p ~/.config/fontconfig/conf.d
	cp fonts/fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
	# refresh font-cache
	fc-cache -vf
	# clean up
	rm -rf fonts

nvim:
	# ensure nvim is installed
	nvim --version >/dev/null
	# make the directory
	mkdir -p ~/.config/nvim
	# symlink the vimrc
	ln -s `pwd`/terminal/init.vim ~/.config/nvim/init.vim
	# download vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	nvim +PlugInstall +qall
	# symlink to normal vim dirs (in case vim needs to be used as a fallback)
	ln -s ~/.local/share/nvim/plugged ~/.vim/plugged

nvim-force:
	# make the directory
	mkdir -p ~/.config/nvim
	# symlink the vimrc
	ln -sf `pwd`/terminal/init.vim ~/.config/nvim/init.vim
	# download vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	nvim +PlugInstall +qall
	# symlink to normal vim dirs (in case vim needs to be used as a fallback)
	ln -sf ~/.local/share/nvim/plugged ~/.vim/plugged

vim:
	# ensure nvim is installed
	\vim --version >/dev/null
	# symlink the vimrc
	ln -s `pwd`/terminal/init.vim ~/.vimrc
	# download vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	\vim +PlugInstall +qall

vim-force:
	# symlink the vimrc
	ln -sf terminal/init.vim ~/.vimrc
	# download vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	vim +PlugInstall +qall

zsh:
	# symlink zshrc and zshrc.d
	ln -s `pwd`/terminal/zshrc ~/.zshrc
	ln -s `pwd`/terminal/zshrc.d ~/.zshrc.d
	# get antigen
	curl -sL git.io/antibody | sh -s
zsh-force:
	# symlink zshrc and zshrc.d
	ln -sf `pwd`/terminal/zshrc ~/.zshrc
	ln -sf `pwd`/terminal/zshrc.d ~/.zshrc.d
	# get antigen
	curl -sL git.io/antibody | sh -s

xresources:
	# make sure env is filled out, first
	ls desktop/Xresources.d/env
	# symlink Xresources
	ln -s `pwd`/desktop/Xresources ~/.Xresources
	# symlink Xresources.d, forcefully
	ln -s `pwd`/desktop/Xresources.d ~/.Xresources.d
	# refresh xrdb
	xrdb -merge ~/.Xresources

xresources-force:
	# symlink Xresources, forcefully
	ln -sf `pwd`/desktop/Xresources ~/.Xresources
	# symlink Xresources.d, forcefully
	ln -sf `pwd`/desktop/Xresources.d ~/.Xresources.d
	# refresh xrdb
	xrdb -merge ~/.Xresources

git:
	# ensure git is installed (i would hope it is)
	git --version
	# link the gitconfig
	ln -s `pwd`/terminal/gitconfig ~/.gitconfig

git-force:
	# link the gitconfig
	ln -sf `pwd`/terminal/gitconfig ~/.gitconfig

i3: xresources polybar rofi
	# ensure i3 is installed
	i3 -v
	# symlink i3 config folder
	ln -s `pwd`/desktop/i3 ~/.config

i3-force: xresources-force polybar-force rofi-force
	# symlink i3 config folder, forcefully
	ln -sf `pwd`/desktop/i3 ~/.config

polybar: xresources
	# ensure polybar is installed
	polybar -v
	# symlink polybar config folder
	ln -s `pwd`/desktop/polybar ~/.config/polybar

polybar-force: xresources-force
	# symlink polybar config folder, forcefully
	ln -sf `pwd`/desktop/polybar ~/.config/polybar

rofi:
	# ensure rofi is installed
	rofi -v
	# symlink rofi config folder
	ln -s `pwd`/desktop/rofi ~/.config/rofi

rofi-force:
	# symlink rofi config folder, forcefully
	ln -sf `pwd`/desktop/rofi ~/.config/rofi
