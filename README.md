# Neovim_cocnvim(verstion ubuntu.18.04 - window WSL(windows_termianl)
## 0 In microsoft store Install ubuntu18.04 and windows terminal  
https://www.microsoft.com/store/productId/9N0DX20HK701
https://www.microsoft.com/store/productId/9N9TNGVNDL3Q

## 1 Basic setup
1. sys updates  
 ```
 sudo apt -y update
 sudo apt -y upgrade
 ```
2. install zsh  
 ```
 sudo apt install -y zsh
 chsh -s /usr/bin/zsh  
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 cd ~/.oh-my-zsh/custom/plugins 
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 ```
3. install nvm 
 ```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
Running either of the above commands downloads a script and runs it. The script clones the nvm repository to ~/.nvm, and attempts to add the source lines from the snippet below to the correct profile file (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).
 ```
 and add ~/.zshrc or ./bashrc
 ```
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
 ```
4. install python  
 ```
 sudo apt install -y software-properties-common  
 sudo apt install -y python3 python3-pip
 ```  
5. add ~/.zshrc (Must over .oh-my-zsh)  
```
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
ZSH_DISABLE_COMPFIX="true"
prompt_context() { 
if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then 
  prompt_segment black default "%(!.%{%F{yellow}%}.)$USER" 
fi 
}
```
6. Install go  
1) get go binary  
```
cd ~
wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```
2) add PATH
```
cd ~
vi .zshrc
at end line 
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN
```

## 2 Install Neovim  
1. Neovim install  
```
cd ~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod 755 nvim.appimage
./nvim.appimage --appimage-extract
cd squashfs-root
sudo mv usr/bin/nvim /usr/bin/nvim
sudo mv usr/share/nvim /usr/share/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. alies vi,vim -> nvim / clear -> cl   
```
cd ~
nvim .zshrc
[add below code at end line]
alias vi=nvim
alias vim=nvim
alias cl=clear
```

## 3 Setting Neovim (copy-paste $HOME/.config/nvim/init.vim)

copy ./config/nvim/init.vim

## 4 Install Plugin
```
vim +PlustInstall
:CocInstall coc-marketplace
:CocList marketplace
coc-json , coc-clangd, coc-syntex ...
```
## 5 coc-config  
copy ./config/coc-configfile
