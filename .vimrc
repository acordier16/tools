set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'python/black'
Plugin 'AutoComplPop'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nvie/vim-flake8'
call vundle#end()            " required
filetype plugin indent on    " required

" Change cursor shape between insert and normal mode (iterm2)
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

"autocompletion
let complete = ".,t,i"
let completeopt="longest,menuone"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"Use TAB to complete when typing words, else inserts TABs as usual.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

"side tree
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"let g:netrw_chgwin=2
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"  autocmd VimEnter * :wincmd p
"augroup END
"aug netrw_close
"  au!
"  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
"aug END

" ctrl-p
let g:ctrlp_working_path_mode = ''
let g:ctrlp_map = '<c-p>'
map <C-b> :CtrlPBuffer <CR>

"classic vim parameters

set number      " Affiche les numéros de ligne
set smartindent " Indentation intelligente
set autoindent  " Conserve l'indentation sur une nouvelle ligne
set ruler       " Affiche la position du curseur
set title
set scrolloff=3
set tabstop=2
set softtabstop=2
set expandtab
set wildmenu
set showmatch
set incsearch
let mapleader=","
set hlsearch
let python_highlight_all=1
syntax on
syntax enable
set mouse=a
"set clipboard^=unnamed,unnamedplus "use system clipboard for yank/put/delete
set backspace=indent, eol "sane backspace
"set scrolloff=10
"nnoremap p "0p

colorscheme vim-monokai-tasty
set t_Co=256
hi CursorLine ctermbg=238
set cursorline
"hi CursorColumn ctermbg=238
"set cursorcolumn
highlight ColorColumn ctermbg=235
let &colorcolumn="80"

set statusline+=@\%{hostname()}\ %F
set ls=2

nnoremap n nzz
nnoremap N Nzz
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"diable arrow keys in command mode
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>

"disable arrow keys in insert mode
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>

"fast scrolling
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

"toggle/untoggle line number with shortcut
nmap <C-N><C-N> :set invnumber<CR>

"remove trailing whitespaces for every save
autocmd BufWritePre * %s/\s\+$//e
