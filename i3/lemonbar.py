#!/usr/bin/env python3
# i3 lemonbar parser. uses i3-py and other functions to set up a decent lemonbar statusline
import i3 # s/o to ziberna for this handy library
import subprocess as sp # we're gonna pipe straight into a subprocessed lemonbar so this is neccessary
from time import sleep,strftime # need these to hold the "while True:" and the date function
import re #need this for the iwconfig parser

# user settings

## underline colors
black = "#1d1f24"
white = "#e3e3e3"
red = "#af3131"
blue = "#4a8cc3"
green = "#65cc3e"
## fg & bg colors
bg = "%{B"+black+"}" # background color
rbg = "%{B"+red+"}" # color for foreground boxes
fg = "%{F"+white+"}" # color for text
rfg = "%{F"+black+"}" # color for foreground text
iw = "wlp7s0u1" # name of preferred wifi interface

hostname = sp.Popen(['hostname'],stdout=sp.PIPE).communicate()[0].decode().rstrip('\n') # get the hostname
lalign = "%{l}" # left-aligner
calign = "%{c}" # center-aligner
ralign = "%{r}" # right-aligner
bar = sp.Popen([ # set up the bar
'lemonbar', # my bar of choice
'-bp', # dock bottom, make permanent
'-f', # set font
'-xos4-terminus-medium-r-normal--0-0-*-*-c-0-iso8859-16', # to this x11-syntax monstrosity
'-g', # set the width-height
'1920x24', # 24px height is nice
],stdin=sp.PIPE,stdout=sp.PIPE)
sh = sp.Popen(['sh'],stdin=bar.stdout) # get sh, for clickable bar justice

def clickable(text,cmd): # make text clickable, executing cmd on click
  return "%{A:"+cmd+":}"+text+"%{A}"

def underline(text,color): # make text underline, with color
  return "%{U"+color+"}%{+u}"+text+"%{-u}"

def active(text): #active workspace style
  return rbg+rfg+text+bg+fg

def workspaces():
  ws = i3.get_workspaces() # get all active workspaces
  # WORKSPACES
  wsp = "" # workspace
  for w in ws: # for each workspace
    if w['focused'] == True: #check if it's focused and if so make it follow red color
      wsp += active(clickable(" "+w['name']+" ","i3-msg workspace" + w['name']))
    else:
      wsp += clickable(" "+w['name']+" ","i3-msg workspace" + w['name'])
  return wsp

def wifi():
  # the oneliner from hell - return the string-formatted output of a command
  output = sp.Popen(["iwconfig",iw],stdout=sp.PIPE).communicate()[0].decode()
  regex = re.compile(".*?Link Quality=(\d+)/(\d+).+(-\d+ dBm)") # matches link quality, link quality max, and dBm reading
  info = re.findall(regex,output)[0] #evaluate the output
  linkp = round(float(info[0]) / float(info[1]) * 100)
  return " "+underline(iw+" "+str(linkp)+"%",blue)+" "

def vol():
  output = sp.Popen(['amixer','get','Master'],stdout=sp.PIPE).communicate()[0].decode()
  regex = re.compile("(\d+%)") # matches percents
  info = re.findall(regex,output)[0] # evaluate the output
  vol = "vol "+info
  return " "+clickable(underline(vol,green),'xfce4-terminal -x alsamixer')+" "

def status():
  status = bg+fg # generate the initial status line, without info
  # DATE
  date = " "+underline(strftime("%H:%M:%S %d %b %Y"),red)
  status += lalign + "  " + hostname + calign + workspaces() + ralign + vol() + wifi() + date + "  \n" # put it all together
  return status


def update(event=None,data=None,subscription=None):
  s = status().encode('ANSI_x3.4-1968')
  bar.stdin.write(s)
  bar.stdin.flush()


sub = i3.Subscription(update,'workspace')
while True: # initialize a loop to output the text needed
  update()
  sleep(1) # lazy but it works i guess

# the update() and subscription method, as written, is kinda hacky
# that said, it keeps me from having to rebuild status more to keep up with time, so it *does* save resources
