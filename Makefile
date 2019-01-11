default: fonts nvim zsh xresources i3 polybar git
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
	nvim --version
	# make the directory
	mkdir -p ~/.config/nvim
	# symlink the vimrc
	ln -sr terminal/init.vim ~/.config/nvim/init.vim
	# download vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	nvim +PlugInstall +qall

nvim-force:
	# ensure nvim is installed
	nvim --version
	# make the directory
	mkdir -p ~/.config/nvim
	# symlink the vimrc
	ln -sr terminal/init.vim ~/.config/nvim/init.vim
	# download vim-plug
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# install plugins
	nvim +PlugInstall +qall

zsh:
	# symlink zshrc and zshrc.d
	ln -sr terminal/zshrc ~/.zshrc
	ln -sr terminal/zshrc.d ~/.zshrc.d
	# curl antigen to .zshrc.d
	curl -L git.io/antigen > ~/.zshrc.d/antigen.zsh

zsh-force:
	# symlink zshrc and zshrc.d
	ln -srf terminal/zshrc ~/.zshrc
	ln -srf terminal/zshrc.d ~/.zshrc.d
	# curl antigen to .zshrc.d
	curl -L git.io/antigen > ~/.zshrc.d/antigen.zsh

xresources:
	# symlink Xresources
	ln -sr desktop/Xresources ~/.Xresources
	# symlink Xresources.d, forcefully
	ln -sr desktop/Xresources.d ~/.Xresources.d
	# refresh xrdb
	xrdb -merge ~/.Xresources

xresources-force:
	# symlink Xresources, forcefully
	ln -srf desktop/Xresources ~/.Xresources
	# symlink Xresources.d, forcefully
	ln -srf desktop/Xresources.d ~/.Xresources.d
	# refresh xrdb
	xrdb -merge ~/.Xresources

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

i3: xresources polybar
	# ensure i3 is installed
	i3 -v
	# symlink i3 config folder
	ln -sr desktop/i3 ~/.config

i3-force: xresources-force polybar-force
	# ensure i3 is installed
	i3 -v
	# symlink i3 config folder, forcefully
	ln -srf desktop/i3 ~/.config

polybar: xresources
	# ensure polybar is installed
	polybar -v
	# symlink polybar config folder
	ln -sr desktop/polybar ~/.config/polybar

polybar-force: xresources-force
	# ensure polybar is installed
	polybar -v
	# symlink polybar config folder, forcefully
	ln -srf desktop/polybar ~/.config/polybar
