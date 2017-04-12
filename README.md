# brian's dotfiles

hi! these are the dotfiles I use for my personal machines. these are designed around my workflow, and as such, YMMV.

this includes a prebuilt configs for i3, xfce4-terminal, screen, and a .bash\_profile that starts screen automatically in a session.

## requirements

to use the .bash\_profile, [screen](https://www.gnu.org/software/screen) must be installed.

these dotfiles make heavy use of the Terminus font - before you run the config, remember to install it (xfonts-terminus in Ubuntu systems, but can also be found [here](https://terminus-font.sourceforge.net).

additionally, if i3 is being configured, [lemonbar](https://github.com/LemonBoy/bar) is needed for lemonbar to be used.

xfce4 configuration assumes the use of xfce4-terminal, AKA the only correct choice. i'll probably separate the two later, but for now it won't hurt to have the xfce4-terminal configs when installing xfce configs, and vice versa.

## using

deploying the dotfiles is easy - just run `config.sh` to symlink the files to their default directories. base dotfiles will be installed, screen dotfiles will be installed if detected, and you'll be asked what else you want installed.

## quirks/considerations

the i3 lemonbar configuration updates every second after the launch is completed, so time is only accurate to ±1 second when using it. not too sure how to fix this.

not installing terminus will set the xfce4 to the *system* default - usually a sans-serif font, not a monospace one - so definitely have it installed before running the xfce4 config at the least.
