if [ $(tty) != "/dev/tty1" -o $NOAUTOX ]; then
  screen -S shell -x 2> /dev/null || screen -S shell
  exit
else
  startx
fi
