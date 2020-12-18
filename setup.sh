#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
fi

if [ -d "$HOME/.config/coc" ]; then
	if [ -d "$HOME/.config/coc/ultisnips" ]; then
		cp config/coc/ultisnips/* $HOME/.config/coc/ultisnips/
	else 
		mv config/coc/ultisnips $HOME/.config/coc/
	fi
	else
	mv config/coc $HOME/.config/
fi

if [ -d "$HOME/.config/nvim" ];then
	cp config/nvim/* $HOME/.config/nvim/
else
	mv config/nvim $HOME/.config/
fi
