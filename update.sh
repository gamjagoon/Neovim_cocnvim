#!/bin/bash

directory1="$HOME/.config/coc/ultisnips"
directory2="$HOME/.config/nvim"
file_init="$HOME/.config/nvim/init.vim"
file_json="$HOME/.config/nvim/coc-settings.json"
file_task="$HOME/.config/nvim/tasks.ini"
config_path="$(pwd)/.config"

if [ -d $directory1 ] && [ -d $directory2 ] && [ -f $file_init ] && [ -f $file_json ] && [ -f $file_task ] ;then
	echo "copy files to .config"
   if [ ! -d $config_path/nvim ] ; then
      mkdir $config_path/nvim
   fi
   if [ ! -d $config_path/coc/ultisnips ] ; then
      mkdir -p $config_path/coc/ultisnips
   fi
   cp $file_init $file_json $file_task $(pwd)/.config/nvim/  
   cp $directory1/* $(pwd)/.config/coc/ultisnips/
fi

echo "end"

git add . && git commit -m "updatae" && git push
