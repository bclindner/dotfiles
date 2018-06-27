# bclindner's dotfiles

![screenshot of the dotfiles](https://i.imgur.com/xotGUf7.png)

this repository is a set of configuration files for my personal machines. it is primarily designed for Linux devices, and assumes (but does not require) the use of the `zsh` command shell, the `vim` text editor, the `i3-gaps` tiling window manager, and the `urxvt` terminal, and are designed for a fast, efficient, and aesthetically pleasing console-based workflow.

these are managed using [GNU `make`](https://www.gnu.org/software/make/), which can manage dotfiles just as well as it's known to manage code builds - it's prominent on most Linux machines I work with, it makes chaining together individual dotfile install processes a breeze, and it's extremely easy to use at a user-level, among other things.

## installation

as previously mentioned, these dotfiles can all be installed using `make`. files are *symlinked*, meaning the cloned repo cannot be moved or deleted when the dotfiles are deployed - otherwise, they won't work. no symlinking commands are forced - commands will fail if dotfiles already exist.

to install a basic set of configs, you can just type `make` - this might take a while, as it installs Powerline-compatible fonts and refreshes font cache.

below is a list of potential `make` targets:

* `make xresources`: installs the `.Xresources` file containing my color pallette, including color scheme info for newer `rofi` versions.
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config, including the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) zsh framework.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the `vim` and  `zsh` build targets, since they require Powerline fonts to display correctly. this command isn't included in them because it can take a long time, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
  * this target assumes x11 is installed already.
* `make i3` installs my configs for `i3` and `polybar`.
  * this target assumes x11 and i3-gaps are installed and polybar is installed and compiled with support for i3, pulseaudio and wireless\_tools (for now, until a proper replacement for that package is set up).
  * you may also want to install `urxvt` - i3-sensible-terminal will default to another terminal otherwise
* `make polybar` installs the polybar config alone, as well as the usual script i3 uses to launch it.
  * this will automatically `make xresources`, as it is required for the bar colors.
* `make git` installs my .gitconfig - if you're not me, probably don't do this, because you'd be using my name and email for all of your commits, and that would be helping precisely noone.

you can append `-force` to any of these targets (e.g. `make vim-force`) to make them install destructively (destroying git repositories in the repo folder and forcing symlinks), but be careful.

## organization

dotfiles are organized into two folders, with the leading dot removed for each file:
  * the `desktop` folder contains dotfiles for the `dwm` desktop distribution and other miscellaneous non-terminal configs.
  * the `terminal` folder contains dotfiles for anything relating to the terminal, including terminal emulator dotfiles.

other than that, you'll find this README, of course, and the Makefile to automate dotfile installation.

## thanks

huge shout-out to the developers of [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), [Vundle](https://github.com/VundleVim/Vundle.vim), and [vim-airline](https://github.com/vim-airline/vim-airline), among many others whose projects influenced or outright enabled some of the features of these dotfiles.

in particular, I outright copied [agnoster](https://github.com/agnoster)'s zsh theme and changed maybe two lines, and I also use a [vim-airline theme](https://github.com/bclindner/vim-airline-bclindner) largely based off of the code of the "cool" theme from [here](https://github.com/vim-airline/vim-airline-themes).

## license

the contents of this repository are protected under the MIT license, in the "LICENSE" file of this repository.
