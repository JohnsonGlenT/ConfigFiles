#!/bin/bash

echo "replacing and backing up files"
if [[ -e ~/.bashrc ]]; then
	mv ~/.bashrc ~/.bashrc.bak
fi

if [[ -e ~/.zshrc ]]; then
	mv ~/.zshrc ~/.zshrc.bak
fi

cp bashrc ~/.bashrc
cp zshrc ~/.zshrc

echo "enjoy your shell"
