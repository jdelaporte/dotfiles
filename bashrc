# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source ~/dotfiles/scripts/add_to_your_profile

PATH=$PATH:$HOME/bin
export PATH
