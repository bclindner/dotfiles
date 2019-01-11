#!/usr/bin/env bash

# kill all polybar instances
killall -q polybar

# wait for polybar instances to die
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set bar to launch
BARTYPE=bclindner

# check if xrandr is on this machine
if type "xrandr"; then
  # if so, get all the connected screens
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # launch a bar for each screen
    MONITOR=$m polybar --reload $BARTYPE &
  done
else
  # if there's no xrandr, just launch the bar
  polybar --reload $BARTYPE &
fi
