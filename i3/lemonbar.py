#!/usr/bin/env python3
# i3 lemonbar parser. uses i3-py and other functions to set up a decent lemonbar statusline
import i3 # s/o to ziberna for this handy library
import subprocess as sp # we're gonna pipe straight into a subprocessed lemonbar so this is neccessary
from time import sleep,strftime # need these to hold the "while True:" and the date function


# first things first, let's set some stuff lemonbar's gonna use
bg = "%{B#1d1f24}" # background color
fg = "%{B#af3131}" # color for foreground boxes
text = "%{F#e3e3e3}" # color for text
ftext = "%{F#1d1f24}" # color for foreground boxes text
lalign = "%{l}" # left-aligner
calign = "%{c}" # center-aligner
ralign = "%{r}" # right-aligner
hostname = "PHI" # a hostname
bar = sp.Popen([ # set up the bar
'lemonbar', # my bar of choice
'-bp', # dock bottom, make permanent
'-f', # set font
'-xos4-terminus-medium-r-normal--0-0-*-*-c-0-iso8859-16', # to this x11-syntax monstrosity
'-g', # set the width-height
'1920x24', # 24px height is nice
],stdin=sp.PIPE,stdout=sp.PIPE)


def status():
  status = bg+text # generate the initial status line, without info
  ws = i3.get_workspaces() # get all active workspaces
  # WORKSPACES
  wsp = ""
  for w in ws: # for each workspace
    if w['focused'] == True: #check if it's focused and if so make it follow fg color
      wsp += fg + ftext
    wsp += "%{A:i3-msg workspace " + w['name'] + ":}" # make it clickable
    wsp += " " + w['name'] + " " # write workspace name
    wsp += "%{A}" # stop making it clickable
    if w['focused'] == True: # focus check
      wsp += bg + text

  wifi = "" # i don't wanna make a thing for this yet tbh
  # DATE
  date = strftime("%H:%M:%S %d %b %Y")
  status += lalign + "  " + hostname + calign + wsp + ralign + wifi + date + "  \n" # put it all together
  return status

def update(event=None,data=None,subscription=None):
  s = status().encode()
  bar.stdin.write(s)
  bar.stdin.flush()


sub = i3.Subscription(update,'workspace')
while True: # initialize a loop to output the text needed
  update()
  sleep(1) # lazy but it works i guess

# the update() and subscription method, as written, is kinda hacky
# that said, it keeps me from having to rebuild status a bunch, that might eat up resources
