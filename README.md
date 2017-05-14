# bclindner's dotfiles

my dotfiles. these use [Vundle](https://github.com/VundleVim/Vundle.vim) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage plugins for vim and zsh, respectively.

## how to use

these dotfiles can all be installed using `make`. files are *symlinked*, meaning the repo still needs to exist for the dotfiles to work. no symlinking commands are forced - commands will fail if dotfiles exist.

to install some basic configs (tmux, vim, fonts, xfce4-terminal, and zsh), you can just type `make`. you can install other dotfiles individually:

* `make screen`: installs GNU `screen` config, including a .zprofile
  * this make job assumes `screen` is already installed.
* `make tmux`: installs `tmux` config.
  * this make job assumes `tmux` is already installed, and Powerline fonts are installed (`make fonts`).
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config, including the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) zsh framework. **NOTE:** this command is somewhat destructive - while your old .zshrc won't go away, it will be moved to ~/.zshrc.pre-oh-my-zsh.
  * this make job assumes `zsh` is already installed and in use - since it's installing oh-my-zsh, it will fail otherwise. additionally, appending `-force` to this job will simply run it normally.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the `vim`, `zsh`, and `tmux` jobs, since they require Powerline fonts to display correctly. this command isn't included in them because it can take a long time, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
* `make xfce4-terminal`: installs the `xfce4-terminal` config, necessary for running it comfortably on tiling WMs.
* `make dwm` *(requires sudo)*: makes and installs my current DWM configuration, cloning from my [GitHub repository](https://github.com/bclindner/dwm). also installs a custom `.xprofile` and `.conkyrc` that works alongside it, though they aren't necessary for DWM to run.
  * this make job assumes `conky`, `feh`, and some XFCE4 utilities (namely `xfce4-power-manager`) are already installed.

you can append `-force` to any of these jobs to make them install destructively (overwriting existing git repositories and forcing symlinks), but be careful.
