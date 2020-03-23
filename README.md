# Neovim_cocnvim(verstion ubuntu.18.04 - window WSL)
## 1 Basic setup
1. sys updates
 1) sudo apt update 
 2)  sudo apt upgrade 
2. install nodejs && update 13.x
 1) sudo apt install nodejs
 2) sudo apt install npm
 3) sudo npm cache clean -f 
 4) sudo npm install -g n 
 5) sudo n latest
3. install python
 1) sudo apt-get install software-properties-common
 2) sudo apt install python python-dev python3 python3-dev python3-pip
4. install clangd
 1) sudo apt install clangd-9
 2) sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100
5. install zsh
 1) sudo apt install zsh
 2) chsh -s /usr/bin/zsh
 3) sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
 4) cd ~/.oh-my-zsh/custom/plugins 
 5) git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
 6) git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 7) add ~/.zshrc 
  => plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
  => ZSH_DISABLE_COMPFIX="true"
  => prompt_context() { 
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then 
      prompt_segment black default "%(!.%{%F{yellow}%}.)$USER" 
    fi 
   }
   
## 2 Install Neovim
## 3 Setting Neovim
## 4 Install coc-nvim
