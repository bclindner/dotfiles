terminal: git nvim zsh

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
zsh: asdfvm antidote
	# symlink zshrc and zshrc.d
	ln -s `pwd`/terminal/zshrc ~/.zshrc
	ln -s `pwd`/terminal/zshrc.d ~/.zshrc.d
zsh-force: asdfvm antidote
	# symlink zshrc and zshrc.d
	ln -sf `pwd`/terminal/zshrc ~/.zshrc
	ln -sf `pwd`/terminal/zshrc.d ~/.zshrc.d

antidote:
	# clone antidote
	git clone --depth=1 https://github.com/mattmc3/antidote.git ${HOME}/.antidote

asdfvm:
	# clone asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

git:
	# ensure git is installed (i would hope it is)
	git --version
	# link the gitconfig
	ln -s `pwd`/terminal/gitconfig ~/.gitconfig

git-force:
	# link the gitconfig
	ln -sf `pwd`/terminal/gitconfig ~/.gitconfig
