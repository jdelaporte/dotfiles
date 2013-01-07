# .bashrc
# Remember, if you update this file, 

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source ~/dotfiles/scripts/add_to_your_profile

# For Joanna
PATH=$PATH:$HOME/bin
export PATH

source ~/Minion/add_to_your_profile
