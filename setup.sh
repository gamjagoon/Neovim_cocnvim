#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
	mkdir $HOME/.config
fi

if [ -d "$HOME/.config/coc" ]; then
	if [ -d "$HOME/.config/coc/ultisnips" ]; then
		cp config/coc/ultisnips/* $HOME/.config/coc/ultisnips/
	else 
      mkdir -p $HOME/.config/coc/ultisnips
		cp config/coc/ultisnips/* $HOME/.config/coc/ultisnips/
	fi
else
   mkdir -p $HOME/.config/coc/ultisnips
   cp -r config/coc $HOME/.config/
fi

if [ -d "$HOME/.config/nvim" ];then
	cp config/nvim/* $HOME/.config/nvim/
else
   mkdir -p $HOME/.config/nvim
	cp -r config/nvim $HOME/.config/
fi
