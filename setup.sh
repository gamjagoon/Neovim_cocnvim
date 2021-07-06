#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
   mkdir $HOME/.config
fi

if [ -d "$HOME/.config/coc/ultisnips" ]; then
   cp config/coc/ultisnips/* $HOME/.config/coc/ultisnips/
else 
   mkdir -p $HOME/.config/coc/ultisnips
   cp config/coc/ultisnips/* $HOME/.config/coc/ultisnips/
fi

if [ -d "$HOME/.config/nvim" ];then
   cp config/nvim/* $HOME/.config/nvim/
else
   mkdir -p $HOME/.config/nvim
   cp config/nvim/* $HOME/.config/nvim/
fi

if [ ! -d "$HOME/elisp" ]; then
   cp -r elisp $HOME/
fi
