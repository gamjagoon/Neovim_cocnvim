#!/bin/bash

directory1="$HOME/.config/coc/ultisnips"
directory2="$HOME/.config/nvim"
file_init="$HOME/.config/nvim/init.vim"
file_json="$HOME/.config/nvim/coc-settings.json"
file_task="$HOME/.config/nvim/tasks.ini"

if [ -d $directory1 ] && [ -d $directory2 ] && [ -f $file_init ] && [ -f $file_json ] && [ -f $file_task ] ;then
	echo "copy files to .config"
	cp $file_init $file_json $file_task .config/nvim/
	cp $directory1/* .config/coc/ultisnips/
fi

echo "end"
