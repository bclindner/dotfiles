# bclindner's dotfiles

my dotfiles. these use [Vundle](https://github.com/VundleVim/Vundle.vim) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage plugins for vim and zsh, respectively.

## how to use

these dotfiles can all be installed using `make`. no dotfile installs require sudo. files are *symlinked*, meaning the repo still needs to exist for the dotfiles to work. no symlinking commands are forced - commands will fail if dotfiles exist.

you can install each dotfile individually, though:

* `make screen` (sudo required): installs GNU screen configs.
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the Vim installation (as it uses [vim-airline](https://github.com/vim-airline/vim-airline)), but it's not included in `make vim` because it can take forever, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
