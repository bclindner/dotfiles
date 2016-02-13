# history size shouldn't need to be too massive
HISTSIZE=200
HISTFILESIZE=500

# what does this do again??
shopt -s checkwinsize

# color prompt, of course. what is a swaggy dotfile without a color prompt?
color_prompt=yes

# cute lil' PS1
PS1="[\h.\u:\w] > "

# colors! s/o to terminal.sexy
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
    \e]P0171d24
    \e]P1af3131
    \e]P265cc3e
    \e]P3ee7d2f
    \e]P44a8cc3
    \e]P59442af
    \e]P645c3b3
    \e]P7777777
    \e]P8373b41
    \e]P9d05c5c
    \e]PAa6e174
    \e]PBe4954c
    \e]PC65a7df
    \e]PDc17dd5
    \e]PE7cdacd
    \e]PFe3e3e3
    "
    # get rid of artifacts
    clear
fi
                                        
# aliases
alias x="startx"
alias ll='ls -l'
alias la='ls -a'
