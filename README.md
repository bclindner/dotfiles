# bclindner's dotfiles

![seriously, though, i got pwned HARD once](https://i.imgur.com/5qaqnTa.png)

this repository is a set of configuration files for Linux, the `zsh` terminal, and some common linux programs. they are primarily for terminal usage, though they also include some files for configuring [my dwm fork](https://github.com/bclindner/dwm). these are used and tested mostly on Ubuntu and other Debian-based systems with LightDM and XFCE4 in use before having dotfiles applied, so I cannot vouch for their usability on other systems or setups.

these dotfiles were designed with efficiency first: common shell commands are aliased to be 4 characters or less, git status is almost always visible in the terminal, vim is configured to be as quick and versatile as possible, etc. regardless this, i've tried to keep a clean and consistent look with Powerline-style prompts and statuslines and my favorite shade of purple as the most prominent color.

these are managed using [GNU `make`](https://www.gnu.org/software/make/), which is ideal due to its features - it's prominent on most Linux machines I work with, it makes chaining together individual dotfile install processes a breeze, and it's easy to use in a terminal, among other things.

## features

these dotfiles provide the following features:

* a unified aesthetic across all dotfiles, featuring a purple color scheme and the [Terminus](http://terminus-font.sourceforge.net/) font
* a `zsh` configuration with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), with a modified theme
  * aliases for days: `sudo apt update && sudo apt upgrade` is now just `saug`, for instance
* terminal multiplexing with [`tmux`](https://tmux.github.io/), including full Powerline-style statusline
* a `vim` configuration with [Vundle](https://github.com/VundleVim/Vundle.vim)
* statuslines for `vim` and `tmux` courtesy of [vim-airline](https://github.com/vim-airline/vim-airline) and [tmuxline.vim](https://github.com/edkolev/tmuxline.vim), respectively
* config files for [`dwm`](dwm.suckless.org), an ultra-light tiling window manager, and separate `conky` configs to provide relevant statuslines for desktops and laptops
* a distraction-free `xfce4-terminal` config, optimized for tiling WM usage

## installation

as previously mentioned, these dotfiles can all be installed using `make`. files are *symlinked*, meaning the repo still needs to exist for the dotfiles to work. no symlinking commands are forced - commands will fail if dotfiles already exist.

to install a basic set of configs, you can just type `make` - this might take a while, as it installs Powerline-compatible fonts and refreshes font cache. 

to update most configs when using my fork of dwm, use `make update-desktop` or `make update-laptop`, depending on which type of system you're on. if you're not using it, then you can just use `make update` instead. (*these are destructive* - be careful). you can also install dotfiles individually. 

below is a list of potential `make` targets:

* `make xresources`: installs the `.Xresources` file containing my color pallette, including color scheme info for newer `rofi` versions.
* `make tmux`: installs `tmux` config.
  * this target assumes `tmux` is already installed, and Powerline fonts are installed (`make fonts`).
* `make vim`: installs configs for `vim`, including the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager.
* `make zsh`: installs the `zsh` config, including the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) zsh framework. **NOTE:** this command is somewhat destructive - while your old .zshrc won't go away, it will be moved to ~/.zshrc.pre-oh-my-zsh.
  * this target assumes `zsh` is already installed and in use - since it's installing oh-my-zsh, it will fail otherwise.
* `make fonts`: installs Powerline-compatible fonts (e.g. Terminus). This is *required* for the `vim`, `zsh`, and `tmux` build targets, since they require Powerline fonts to display correctly. this command isn't included in them because it can take a long time, which is unneccessary if you're just running `make vim` on something with Powerline fonts already installed.
* `make xfce4-terminal`: installs the `xfce4-terminal` config, necessary for running it comfortably on tiling WMs.
  * xfce4-terminal overwrites the symlink after it's relaunched, so you'll need to run `make xfce4-terminal-force` if you're updating.
* `make dwm`: makes and installs my current DWM configuration, cloning from my [GitHub repository](https://github.com/bclindner/dwm). also installs a custom `.xprofile` that works alongside it, though it isn't necessary for DWM to run. you may need to type in a password for the install.
  * this target assumes `conky`, `feh`, and some XFCE4 utilities (namely `xfce4-power-manager`) are already installed. additionally, run `make conky-desktop` or `make conky-laptop` to install the correct statusline configuration.
* `make git` installs my .gitconfig - if you're reading this, probably don't do this, because you'd be using my name and email for all of your commits.

you can append `-force` to any of these targets (e.g. `make vim-force`) to make them install destructively (destroying git repositories in the repo folder and forcing symlinks), but be careful.

## organization

dotfiles are organized into two folders, with the leading dot removed for each file:
  * the `desktop` folder contains dotfiles for the `dwm` desktop distribution
  * the `terminal` folder contains dotfiles for anything relating to the terminal, including terminal emulator dotfiles.

other than that, you'll find this README, of course, and the Makefile to automate dotfile installation.

## thanks

huge shout-out to the developers of [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), [Vundle](https://github.com/VundleVim/Vundle.vim), and [vim-airline](https://github.com/vim-airline/vim-airline), among many others whose projects influenced or outright enabled some of the features of these dotfiles.

in particular, I outright copied [agnoster](https://github.com/agnoster)'s zsh theme and changed maybe two lines, and I also use a [vim-airline theme](https://github.com/bclindner/vim-airline-bclindner) largely based off of the code of the "cool" theme from [here](https://github.com/vim-airline/vim-airline-themes).

## license

The contents of this repository are protected under the MIT license, in the "LICENSE" file of this repository.
