syntax on
nmap <Leader>it :e ~/.config/nvim/init.vim
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
imap <C-f> <Esc>^i

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
call plug#begin()
" Shorthand notation; fetches 
Plug 'junegunn/vim-easy-align'
" color schemes
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" task manager
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" vim go
Plug 'fatih/vim-go'
" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
"Navigation"
Plug 'ryanoasis/vim-devicons'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jiangmiao/auto-pairs'
" Web
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
" Initialize plug in system
call plug#end()
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
set encoding=UTF-8
set t_Co=256
set cursorline
colorscheme gruvbox
set background=dark
let g:gruvbox_invert_indent_guides=1
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1
let g:asyncrun_open = 6
let g:asynctasks_term_pos = 'left'
let g:asynctasks_term_rows = 100    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_focus = 1
 noremap <silent>tv :vsplit<cr>:e out.txt<cr>
 noremap <silent>tio :AsyncTask file-IO<cr>
 noremap <silent>trn :AsyncTask file-run<cr>
 noremap <silent>tb :AsyncTask file-build<cr>
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#coc#enabled = 1
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
 nmap <leader>f  <Plug>(coc-fix-current)<cr>
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
" coc explorer
let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\   'simplify': {
\   'file.child.template':'[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][readonly] [linkIcon & 1][link growRight 1 omitCenter 5][size]'
\   }
\ }

" Use preset argument to open it
nmap <Leader>ef :CocCommand explorer --preset floating<CR>
" List all presets
nmap <Leader>ed :CocCommand explorer --preset simplify<CR>
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

