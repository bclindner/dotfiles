# bclindner's dotfiles

my dotfiles. these use [Vundle](https://github.com/VundleVim/Vundle.vim) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage plugins for vim and zsh, respectively.

## how to use

these dotfiles can all be installed using `make`. files are *symlinked*, meaning the repo still needs to exist for the dotfiles to work. no symlinking commands are forced - commands will fail if dotfiles exist.

to install some basic configs (screen, vim, fonts, xfce4-terminal, and zsh), you can just type `make`. you can install other dotfiles individually:

* `make screen`: installs GNU screen configs.
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config. **NOTE:** this command is somewhat destructive - while your old .zshrc won't go away, it will be moved to ~/.zshrc.pre-oh-my-zsh.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the Vim installation (as it uses [vim-airline](https://github.com/vim-airline/vim-airline)), but it's not included in `make vim` because it can take a long time, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
* `make xfce4-terminal`: installs the `xfce4-terminal` config, necessary for running it comfortably on tiling WMs.
* `make dwm` *(requires sudo)*: makes and installs my current DWM configuration, cloning from my [GitHub repository](https://github.com/bclindner/dwm). also installs a custom `.xprofile` and `.conkyrc` that works alongside it, though they aren't necessary for DWM to run.
  * this make job assumes `conky`, `feh`, and some XFCE4 utilities (namely `xfce4-power-manager`) are already installed.
