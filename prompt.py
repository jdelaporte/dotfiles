#!/usr/bin/env python
import os
import datetime
import string
from socket import gethostname

maxDirs = 3

ADD_COLOR = False 
# prompt = Template("""$hostname:$location>""")
prompt = string.Template("""$location>""")

def shortenDirs(input, max, show_number=True):
  dirs = input.split(os.sep)
  dirLen = len(dirs) - 1 # Ignore first '/' for calculations.
  if dirLen <= max:
    return input
  else:
    dirs.reverse()
    displayDirs = dirs[0 : max]
    displayDirs.reverse()
    shortDirs = os.sep.join(displayDirs)
    if show_number:
        return "(%i)%s%s" % (dirLen-max,os.sep, shortDirs)
    else:
        return shortDirs

def colorize(input, colorName, prompt='zsh'):
  if prompt == 'bash':
    colors = {'Black'  :'0;30',
        'Blue'   :'0;34',
        'Green'  :'0;32',
        'Cyan'   :'0;36',
        'Red'     :'0;31',
        'Purple'    :'0;35',
        'Brown'     :'0;33',
        'Light Gray'  :'0;37',
        'Light Purple':'1;35',
        'White':'1;37',}
  # For bash...
    encoder = string.Template("\033[{color}m")
    colorCode = encoder.substitute({'color':colors[colorName]})
    return '%s%s%s' % (colorCode, input, normalCode)
  else:
    color_string = string.Template("%{$$fg[$color]%}$content$$fg[white]")
    # return color_string.substitute({'color':colorName, 'content':input}) 
    return input


# Fetch last command from bash history
f = open(os.path.expanduser('~/.bash_history'), 'r')
history = f.readlines()
last_command = history[len(history)- 1]

# location = colorize(location, 'Cyan')
# calendarLine = colorize(calendarLine, 'Blue')
# hostname = colorize(gethostname(), 'Purple')
data = {}
data['hostname'] = gethostname()
data['location'] = shortenDirs(os.getcwd(), maxDirs)
data['screen_title'] = shortenDirs(os.getcwd(), 1, False)

# if 'ssh' in last_command:
#     data['screen_title'] = last_command
# if 'vim' in last_command:
#     data['screen_title'] = last_command

data['calendarLine'] = datetime.datetime.now().strftime("%m/%d %I:%M")

colorSelection = {
  'hostname':'Purple',
  'location':'Blue',
}

# 'Print' the screen title for the current screen window.
# For bash...
set_screen_title = string.Template('''\033k$screen_title\033\\''')
# For zsh
# set_screen_title = Template('''\033$screen_title\033''')
set_screen_title_command = set_screen_title.substitute(data)

# Add some color
if ADD_COLOR:
    color_data = {}
    for key in colorSelection:
        # Add Color
        color_data[key] = colorize(data[key], colorSelection[key])
    data = color_data

#statusFile = os.path.expanduser('~/.mcabber/latest_status_info')
#f = open(statusFile, 'r')
#jabberStatus = f.read()
#f.close()
#jabberStatus = colorize(jabberStatus, 'Red')
from string import Template
jabberStatus = ""
# prompt = Template("""$hostname


# Set the screen title, and then print the prompt.
#   Setting the screen title requires printing the invisible command.
#   We do this on one line to avoid an extra line break inserted by 'print'.
# print set_screen_title_command + prompt.substitute(color_data)
print prompt.substitute(data)
