#!/bin/bash

directory1="$HOME/.config/coc"
directory2="$HOME/.config/nvim"
file_init="$HOME/.config/nvim/init.vim"
file_json="$HOME/.config/nvim/coc-settings.json"
file_task="$HOME/.config/nvim/tasks.ini"
config_path="$(pwd)/config"

if [ -d $directory1 ] && [ -d $directory2 ] && [ -f $file_init ] && [ -f $file_json ] && [ -f $file_task ] ;then
	echo "copy files to .config"
   if [ ! -d $config_path/nvim ] ; then
      mkdir $config_path/nvim
   fi
   if [ ! -d $config_path/coc/ultisnips ] ; then
      mkdir -p $config_path/coc/ultisnips
   fi
   cp $directory2/*.* $config_path/nvim/  
   cp $directory1/ultisnips $config_path/coc/ultisnips/
   cp $directory1/extensions/package.json $config_path/coc/extensions/package.json
fi

echo "end"
