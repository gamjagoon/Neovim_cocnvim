syntax on
set mouse=a
set clipboard+=unnamedplus
set guifont=FiraCode\ Nerd\ Font\ Mono:h16
" listchars settings
set list listchars=eol:$,tab:\|-,extends:>,precedes:<,space:·
" some basic 
set noerrorbells
set ts=4 softtabstop=4
set shiftwidth=4
set nowrap
set splitbelow splitright
set hlsearch
set incsearch
set scrolloff=20
set hidden
set nobackup
set smartcase
set noswapfile
set undodir=~/.config/undodir
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set relativenumber
set number

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$

noremap <F6> :set list!<CR>
inoremap <F6> <C-o>:set list!<CR>
cnoremap <F6> <C-c>:set list!<CR>
nnoremap <silent> <Leader>it :e ~/.config/nvim/init.vim<cr>

xmap av :EasyAlign */  / l4al<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <silent> <space>sg vimgrep /\<<C-r><C-w>\>/g ./**/*.v ./**/*.sv<cr> :cw<cr>

" Coc key settings
nnoremap <silent> <Leader>l :CocList<cr>
nnoremap <silent> <Leader>c :CocCommand<cr>
nnoremap <silent> <Leader>di  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <Leader>. :CocAction<cr>

nnoremap <Leader><space> :nohls<cr>

" Better splits
nnoremap sp :split<cr>
nnoremap vs :vsplit<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <silent> <space>e  :CocCommand explorer --preset floating<cr>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Buffer control
nmap <Leader>b :ls<cr>:b
imap <Leader>b <Esc>:ls<cr>:b
nmap <silent>]b :bn<cr>
nmap <silent>[b :bp<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" middle start
nnoremap <Leader>o o<Esc>yy18P

" Normal mode
nmap <S-f> ^i
imap <C-a> <Esc><S-a>
nnoremap <Leader>y v$hy<Esc>

" insert mode
imap <Leader>; <Esc><S-a>;<Esc>
nmap <Leader>; <S-a>;<Esc>

" Plug in 
call plug#begin()
" pair
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'
" language setting 
Plug 'vim-scripts/verilog_emacsauto.vim'
call plug#end()
" autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
" colorscheme setting

set encoding=UTF-8
set termguicolors     " enable true colors support
" Example config in VimScript
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
set background=dark

colorscheme tokyonight

lua << EOF
require("bufferline").setup{}
EOF
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)>
nmap <leader>A  <Plug>(coc-codeaction-line)

" floaterm
let g:floaterm_keymap_toggle = '<silent><leader>t'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

au Filetype systemverilog source $HOME/.config/nvim/plugged/verilog_emacsauto.vim/ftplugin/verilog_emacsauto.vim
" color setting 
hi LineNr guifg=#D8D8D8
set cursorline
hi Comment gui=italic guifg=#CACACA
hi Todo gui=bold

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
