## 1. Install Basic [program](https://mizzo-dev.tistory.com/entry/oh-my-zsh-iterm2-%EC%9C%BC%EB%A1%9C-%EC%98%88%EC%81%98%EA%B3%A0-%EC%83%9D%EC%82%B0%EC%84%B1-%EB%84%98%EC%B9%98%EB%8A%94-%ED%84%B0%EB%AF%B8%EB%84%90-%EB%A7%8C%EB%93%A4%EA%B8%B0)
1. Install brew
    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```
2. Install [iTerm2 and font](https://musma.github.io/2019/07/08/mac-os-dev-env-setting-2.html)
    ```sh
    brew cask install iterm2
    brew tap caskroom/fonts && brew cask install font-source-code-pro
    ```

    ```sh
    # GitHub 저장소 복제
    git clone https://github.com/powerline/fonts.git --depth=1
    # 폰트 설치
    cd fonts
    ./install.sh
    # 로컬 저장소 삭제
    cd ..
    rm -rf fonts
    ```

3. Install zsh, oh-my-zsh and [powerlin10k](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjX-IbAncrqAhULO3AKHWBUDlkQFjAAegQIBxAB&url=https%3A%2F%2Fgithub.com%2Fromkatv%2Fpowerlevel10k&usg=AOvVaw2DTvEkHaYatcc0a1K-qKkv)
    ```sh
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # install powerlevel10k
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH\_CUSTOM/themes/powerlevel10k
    ```

    ```sh
    # ZSH_THEME="[theme-name]"
    ZSH\_THEME="powerlevel10k/powerlevel10k"
    # Set Default User
    # DEFAULT\_USER="\[user-name\]"
    DEFAULT\_USER="mijeong"
    ```
4. Install [plugins](https://medium.com/harrythegreat/zsh%EC%99%80-%ED%95%A8%EA%BB%98-%EC%82%AC%EC%9A%A9%ED%95%A0-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8-%EC%B6%94%EC%B2%9C-6%EA%B0%80%EC%A7%80-8f9b8b7f3c24)   
    [bat](https://github.com/sharkdp/bat)   
    [fzf]()
    ```sh
    brew install fzf
    brew install bat
    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    # .zshrc file
    plugins=(
      zsh-autosuggestions
      fzf
      zsh-syntax-highlighting
      git
    )
    ```

## 2 Setting neovim

1. Install python, nvm, [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

    ```sh
    brew install neovim
    # ~/.zshrc
    alias vim="nvim"
    alias vi="nvim"
    alias vimdiff="nvim -d"
    export EDITOR=/usr/local/bin/nvim
    sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    ```

2. Install plugin   
    for Unix,Linux
    ```sh
    sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
    ```


### reference sites

[neovim](https://neovim.io/doc/)    
[coc-nvim](https://github.com/neoclide/coc.nvim/wiki).   
[verilog-systemverilog.vin](https://github.com/vhda/verilog_systemverilog.vim).   
