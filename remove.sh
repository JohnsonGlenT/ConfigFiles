#!/bin/bash

echo "replacing old files"

if [[ -e ~/.bashrc ]]; then
	mv ~/.bashrc ~/.bashrc.BAK
else
	echo "No bashrc file"
fi

if [[ -e ~/.zshrc ]]; then
	mv ~/.zshrc ~/.zshrc.BAK
else
	echo "No zshrc file"
fi

if [[ -e ~/.bashrc.bak ]]; then
	mv ~/.bashrc.bak ~/.bashrc
else
	"No bashrc.bak found"
fi

if [[ -e ~/.zshrc ]]; then
	mv ~/.zshrc.bak ~/.zshrc
else
	"No zshrc.bak found"
fi

echo "Files Restored"
