#!/bin/sh

if [! -d ~/.config];then
	mkdir ~/.config
fi

if [-d ~/.config/coc];then
	if [-d ~/.config/coc/ultisnips];then
		cp .config/coc/ultisnips/* ~/.config/coc/ultisnips/
	else ;then
		mv .config/coc/ultisnips ~/.config/coc/
	fi
else;then
	mv .config/coc ~/.config/
fi

if [-d ~/.config/nvim];then
	cp .config/nvim/* ~/.config/nvim/
else;then
	mv .config/nvim ~/.config/
fi
