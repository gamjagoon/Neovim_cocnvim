#/bin/bash!
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)
git clone https://github.com/nvm-sh/nvm.git .nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cd ~/.local 
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
echo alias vi=\"$HOME/.local/nvim.appimage\" >> ~/.zshrc
echo alias vim=\"$HOME/.local/nvim.appimage\" >> ~/.zshrc
echo alias nvim=\"$HOME/.local/nvim.appimage\" >> ~/.zshrc
