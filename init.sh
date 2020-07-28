#!/bin/bash

cd $HOME
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz
./nvim-osx64/bin/nvim

# install nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install 14.5.0

# install neovim
npm i -g neovim
pip3 install --user neovim
