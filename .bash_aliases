# why must I use windows at work
alias cls='clear ' 
alias py='python '

# common aliases
alias _='sudo '
alias _i='sudo -i '
alias l='ls -CF '
alias ll='ls -l -h '
alias lla='ls -l -h -A '
alias la='ls -A '
alias dd='dd status=progress '
alias ec='emacsclient -c '
alias nano='nano -S '

# Arch specific aliases
if [ -f "/bin/pacman" ]; then
	#alias yay='yaourtix '
	alias paru='paru --fm $EDITOR '
fi

# Package Dependant
if [ -f "/bin/doas" ]; then
	alias sudo='doas '
	alias _='doas '
	alias _i='doas -s '
fi
