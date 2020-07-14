syntax on
set list listchars=eol:$,tab:\|-,extends:>,precedes:<,space:•
nmap <Leader>it :e ~/.config/nvim/init.vim
nmap <Leader>li :CocList<cr>
nmap <Leader>co :CocCommand<cr>
nmap <Leader>ts :CocList tasks<cr>
set pastetoggle=<F2>
set relativenumber
nnoremap <Leader>w :write<cr>
nnoremap <Leader>Q :q<cr>
nnoremap <Leader>qq :w\|bw<cr>
nnoremap <Leader>ee :e!<cr>
nnoremap <Leader><space> :nohls<cr>
nnoremap <S-M>a :resize_<cr>
nnoremap <S-M>x <C-w><C-w>:q<cr>
nnoremap <silent>te <C-w>p:q<cr>
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
" middle start
nnoremap <Leader>o o<Esc>yy15P
" Normal mode
nmap <S-f> ^i
imap <C-a> <Esc><S-a>
imap <C-f <Esc>^i

" insert mode
imap <Leader>; <Esc><S-a>;<Esc>
nmap <Leader>; <S-a>;<Esc>
" some basic 
set noerrorbells
set ts=4 softtabstop=4 
set shiftwidth=4                    " 자동 들여쓰기 4칸 "
"set expandtab "tap -> space
set number
set nowrap
set splitbelow splitright
set hlsearch                        " / ? 명령등으로 찾은 문자열을
" 하이라이트"
set incsearch                       " 글자를 치면 그에 맞는것을 치는 동안
" 보여주기 "
set scrolloff=15                     " 스크롤 할때 위아래 줄 유지, 화살표
" 아래로 내리다 보면 아래에서 4줄 유지한 상황에서 스크롤 됨 "
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
Plug 'https://github.com/morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" task manager
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" pair
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" language setting 
Plug 'vim-scripts/verilog_emacsauto.vim'

call plug#end()
" autopair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}
set encoding=UTF-8
set t_Co=256
set cursorline
colorscheme gruvbox
set background=dark
let g:gruvbox_invert_indent_guides=1
let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'left'
let g:asynctasks_term_rows = 100    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_focus = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
	                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<cr>"
nmap <leader>rn <Plug>(coc-rename)>
