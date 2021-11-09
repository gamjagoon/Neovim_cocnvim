syntax on
set mouse=a
" set mouse set mouse=a set guifont=Font:h18
set clipboard+=unnamedplus
set guifont=SauceCodePro\ Nerd\ Font:h20
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
" listchars settings
set list listchars=eol:$,tab:\|-,extends:>,precedes:<,space:·

noremap <F6> :set list!<CR>
inoremap <F6> <C-o>:set list!<CR>
cnoremap <F6> <C-c>:set list!<CR>
nnoremap <silent> <Leader>it :e ~/.config/nvim/init.vim<cr>

xmap av :EasyAlign */  / l4al<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <silent> <space>fv :vimgrep /\<<C-r><C-w>\>/g ./**/*.v ./**/*.sv<cr> :cw<cr>

" Coc key settings
nnoremap <silent> <Leader>l :CocList<cr>
nnoremap <silent> <Leader>c :CocCommand<cr>
nnoremap <silent> <Leader>di  :<C-u>CocList diagnostics<cr>

nnoremap <Leader>w :wall<cr>
nnoremap <Leader>qq :w\|bw<cr>
nnoremap <Leader>ee :e!<cr>
nnoremap <Leader>1 $bi<space><TAB><TAB><TAB><TAB><Esc>
nnoremap <Leader>2 jdw
nnoremap <Leader><space> :nohls<cr>
nnoremap <Leader>S 0dweldwi<space><Esc>

" Better splits
nnoremap sp :split<cr>
nnoremap vs :vsplit<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

nmap <silent> <space>e  :CocCommand explorer --preset floating<cr>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
set relativenumber
set number

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

" some basic 
set noerrorbells
set ts=3 softtabstop=3 et
set shiftwidth=3
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
" Plug in 
call plug#begin()
" Shorthand notation; fetches 
Plug 'junegunn/vim-easy-align'
" theme
Plug 'franbach/miramare'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" pair
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/vim-easy-align'
" language setting 
Plug 'fatih/vim-go'
Plug 'vim-scripts/verilog_emacsauto.vim'
call plug#end()
" autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
" colorscheme setting

set encoding=UTF-8
set termguicolors     " enable true colors support
set background=dark

colorscheme miramare

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'miramare'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                        \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<cr>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
hi clear CursorLine
hi CursorLine gui=underline
hi Comment gui=italic guifg=#CACACA
hi Todo gui=bold

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
