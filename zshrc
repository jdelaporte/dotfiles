export PROFILES_IN_USE="$PROFILES_IN_USE ~/.zshrc"
export PS1="%n@%m/%C>"

# Provide minion shortcuts
source ~/minion/add_to_your_profile
source ~/edthedev/add_to_your_profile

# Lock screen
alias lock="gnome-screensaver-command -l"

source ~/.cites_alias

export EDITOR="vim"

#   Colors are nice.
# -----------------------------------------------------------------------
autoload -U colors compinit
colors
compinit # Unknown, but Chris likes it.

precmd() {
	psvar[1]=`python ~/.prompt.py`
	# python ~/edthedev/config/prompt.py
}


# Set Screen title
#   after changing directories
setopt extended_glob
preexec () {
    if [[ "$TERM" == "screen" ]]; then
	# local CMD=${1[(wr)^(*=*|sudo|-*)]}
	# echo -ne "\ek$CMD\e\\"
		# print -Pn "\e]0;%n@%M: %~\a"
		print -Pn "\ek%-3~\e\\" # set screen title
		print -Pn "\e]2;%-3~\a" # must (re)set xterm title
    fi
}

# Hostname plus python prompt
# export PS1="%{$fg_bold[red]%}%m
# %{$fg_bold[cyan]%}%1v$reset_color>"

# Cyan python prompt
# export PS1="%{$fg_bold[cyan]%}%1v$reset_color"

# No change to python prompt color
export PS1="%1v"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Set screen title when SSH-ing
ssh() {
	args=$@
	echo -ne "\033k${args##* }\033\\";
	env ssh "$@";
	# Set window title back here!
}

# Set screen title when VIM-ing
vim() {
 	args=$@
 	echo -ne "\033k${args##* }\033\\";
 	env vim "$@";
	# Set window title back here!
}
