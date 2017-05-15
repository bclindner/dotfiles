# bclindner's dotfiles

my dotfiles. these use [Vundle](https://github.com/VundleVim/Vundle.vim) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage plugins for vim and zsh, respectively.

## how to use

these dotfiles can all be installed using `make`. files are *symlinked*, meaning the repo still needs to exist for the dotfiles to work. no symlinking commands are forced - commands will fail if dotfiles exist.

to install some basic configs (tmux, vim, fonts, xfce4-terminal, zsh, and xresources), you can just type `make`. to update most configs *with dwm*, use `make update-desktop` or `make update-laptop`. if you're not using dwm, then use `make update` instead. (*these are destructive* - be careful). you can also install dotfiles individually:

* `make xresources`: installs the `.Xresources` file containing my color pallette, including color scheme info for newer `rofi` versions.
* `make tmux`: installs `tmux` config.
  * this make job assumes `tmux` is already installed, and Powerline fonts are installed (`make fonts`).
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config, including the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) zsh framework. **NOTE:** this command is somewhat destructive - while your old .zshrc won't go away, it will be moved to ~/.zshrc.pre-oh-my-zsh.
  * this make job assumes `zsh` is already installed and in use - since it's installing oh-my-zsh, it will fail otherwise.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the `vim`, `zsh`, and `tmux` jobs, since they require Powerline fonts to display correctly. this command isn't included in them because it can take a long time, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
* `make xfce4-terminal`: installs the `xfce4-terminal` config, necessary for running it comfortably on tiling WMs.
  * xfce4-terminal overwrites the symlink after it's relaunched, so you'll need to run `make xfce4-terminal-force` if you're updating.
* `make dwm`: makes and installs my current DWM configuration, cloning from my [GitHub repository](https://github.com/bclindner/dwm). also installs a custom `.xprofile` that works alongside it, though it isn't necessary for DWM to run. you may need to type in a password for the install.
  * this make job assumes `conky`, `feh`, and some XFCE4 utilities (namely `xfce4-power-manager`) are already installed. additionally, run `make conky-desktop` or `make conky-laptop` to install the correct statusline configuration.
* `make git` installs my .gitconfig - if you're reading this, probably don't do this, because you'd be using my name and email for all of your commits.

you can append `-force` to any of these jobs to make them install destructively (overwriting existing git repositories and forcing symlinks), but be careful.
