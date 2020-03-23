# Neovim_cocnvim(verstion ubuntu.18.04 - window WSL(windows_termianl)
## 0 In microsoft store Install ubuntu18.04 and windows terminal  
https://www.microsoft.com/store/productId/9N0DX20HK701
https://www.microsoft.com/store/productId/9N9TNGVNDL3Q

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
7. Install go  
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

## 3 Setting Neovim (copy-paste $HOME/.config/nvim/init.vim)
```
syntax on
nmap <Leader>it :e ~/.config/nvim/init.vim
set pastetoggle=<F2>
map <F10> :set list! list? <CR>
nnoremap <Leader>w :write<cr>
nnoremap <Leader>q :quit<cr>
nmap <S-M>a :resize_<cr>
nmap <S-M>x <C-w><C-w>:q<cr>
" Better splits
nnoremap sp :split<cr>
nnoremap vs :vsplit<cr>
nmap <Leader>b :ls<cr>:b
imap <Leader>b <Esc>:ls<cr>:b
nmap <silent>]b :bn<cr>
nmap <silent>[b :bp<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Navigatin's mappings
" Normal mode
nmap <S-f> ^i

" insert mode
imap <Leader>; <Esc><S-a>;<Esc>
nmap <Leader>; <S-a>;<Esc>
" some basic 
set noerrorbells
set ts=4 softtabstop=4 
set shiftwidth=4                    " 자동 들여쓰기 4칸 "
set expandtab
set number
set nowrap
set splitbelow splitright
set hlsearch                        " / ? 명령등으로 찾은 문자열을 하이라이트"
set incsearch                       " 글자를 치면 그에 맞는것을 치는 동안 보여주기 "
set scrolloff=15                     " 스크롤 할때 위아래 줄 유지, 화살표 아래로 내리다 보면 아래에서 4줄 유지한 상황에서 스크롤 됨 "
set hidden
set nobackup
set smartcase
set noswapfile
set undodir=~/.config/undodir
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Plug in 
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches 
Plug 'junegunn/vim-easy-align'
" color schemes
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" task manager
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" vim go
Plug 'fatih/vim-go'
Plug 'octol/vim-cpp-enhanced-highlight'
" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
"Navigation"
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yggdroot/indentline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jiangmiao/auto-pairs'
" Initialize plug in system
call plug#end()
let g:coc_global_extensions = ['coc-clangd','coc-git','coc-highlight','coc-json','coc-snippets','coc-actions']
set encoding=UTF-8
set t_Co=256 
colorscheme onedark
" task setup
let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'left'
let g:asynctasks_term_rows = 100    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_focus = 1
 noremap <Leader>tv :AsyncTask view-output<cr>
 noremap <silent><f5> :AsyncTask file-IO<cr>
 noremap <silent><f6> :AsyncTask file-run<cr>
 noremap <silent><f9> :AsyncTask file-build<cr>
 
 
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme='bubblegum'
let g:airline#extensions#coc#enabled = 1
" NERDTreeToggle
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cpp','hpp', 'php', 'rb', 'js', 'css','txt','exe']
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name)
" Coc - setting
" TextEdit might fail if hidden is not set.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<cr>"
" Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
 xmap <leader>a  <Plug>(coc-codeaction-selected)
 nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current line.
 nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
 nmap <leader>f  <Plug>(coc-fix-current)"
"endfunction
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"Nerd tree
map <C-n> :NERDTreeToggle<CR>
" indent line
let g:indentLine_setColors = 50
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
```
## 4 Install Pluging
```
vim +PlustInstall
:CocInstall coc-marketplace
:CocList marketplace
coc-json , coc-clangd, coc-syntex ...
```
## 5 coc-config  
1. cd ~/.config/coc-settings.json
```
{
    "snippets.extends": {
        "cpp" : ["c"]
    },
    "languageserver": {
		"golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "disableWorkspaceFolders": true,
      "filetypes": ["go"]
      }	 
    },
    "clangd.path": "/usr/bin/clangd"
}
```
