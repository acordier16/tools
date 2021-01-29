set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'AutoComplPop'
Plugin 'psf/black'
Plugin 'nvie/vim-flake8'
Plugin 'vim-prettier'
call vundle#end()            " required
filetype plugin indent on    " required

" formatting
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 120
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufWritePre *.py Black

" toggle the current line highlight off when insert mode
autocmd InsertEnter,InsertLeave * set cul!
" and make it fast
set ttimeout
set ttimeoutlen=1
"set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

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

"classic vim parameters
set number      " Affiche les numéros de ligne
set smartindent " Indentation intelligente
set autoindent  " Conserve l'indentation sur une nouvelle ligne
set ruler       " Affiche la position du curseur
set title
set scrolloff=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab "converts tabs to space
set wildmenu
set showmatch
set incsearch
let mapleader=","
set hlsearch
let python_highlight_all=1
syntax on
syntax enable
set mouse=a
set clipboard^=unnamed,unnamedplus "use system clipboard for yank/put/delete
set backspace=indent, eol "sane backspace

"colors
"colorscheme vim-monokai-tasty
set termguicolors
set t_Co=256
set background=dark
hi CursorLine ctermbg=238
set cursorline
"highlight ColorColumn ctermbg=235
highlight ColorColumn ctermbg=238 guibg=grey
let &colorcolumn="80"

"statusline
set statusline+=@\%{hostname()}\ %F
set ls=2

nnoremap n nzz
nnoremap N Nzz
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
"nnoremap <C-h> <C-w><C-h>

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

"more natural splitting, splitting in grey
set splitbelow
set splitright
highlight VertSplit ctermbg=grey

" jump to last known cursor position when opening file
augroup curpos
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
  \ endif
augroup END
