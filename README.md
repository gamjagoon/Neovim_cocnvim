# Neovim_cocnvim(verstion ubuntu.18.04 - window WSL)
## 1 Basic setup
1. sys updates  
 ```
 sudo apt update
 sudo apt upgrade
 ```
2. install nodejs && update 13.x  
 ```
 sudo apt install nodejs 
 sudo apt install npm  
 sudo npm cache clean -f  
 sudo npm install -g n 
 sudo n latest
 ```
3. install python  
 ```
 sudo apt-get install software-properties-common  
 sudo apt install python python-dev python3 python3-dev python3-pip
 ```  
4. install clangd  
 ```
 sudo apt install clangd-9 
 sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100  
 ```
5. install zsh  
 ```
 sudo apt install zsh
 chsh -s /usr/bin/zsh  
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 cd ~/.oh-my-zsh/custom/plugins 
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 
 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 ```
6. add ~/.zshrc (Must over .oh-my-zsh)
```plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_DISABLE_COMPFIX="true"
prompt_context() { 
if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then 
  prompt_segment black default "%(!.%{%F{yellow}%}.)$USER" 
fi 
}
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
```
2. alies vi,vim -> nvim / clear -> cl   
```
cd ~
nvim .zshrc
[add below code at end line]
alies vi=nvim
alies vim=nvim
alies cl=clear
```

## 3 Setting Neovim
## 4 Install coc-nvim
