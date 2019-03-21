#!/bin/bash

echo "Deleting files"

if [[ -e ~/.bashrc.BAK ]]; then
	rm ~/.bashrc.BAK
	echo "bashrc file removed"
else
	echo "no bashrc file"
fi

if [[ -e ~/.zshrc.BAK ]]; then
	rm ~/.zshrc.BAK
	echo "zsh file removed"
else
	echo "no zshrc file"
fi
