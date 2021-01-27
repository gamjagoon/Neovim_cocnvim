if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX="true"
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="$HOME/.local/bin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias cl="clear"
alias python="/usr/local/bin/python3"
alias python3="/usr/local/bin/python3"

source ~/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
