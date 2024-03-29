set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin()
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'psf/black'
Plug 'vim-scripts/AutoComplPop'
Plug 'nvie/vim-flake8'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
call plug#end()
"packloadall
filetype plugin indent on    " required
filetype plugin on

" formatting
let g:prettier#config#tab_width = 4
let g:prettier#config#print_width = 120
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
" removed *.md
"autocmd BufWritePre *.py Black

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
"set clipboard^=unnamed,unnamedplus "use system clipboard for yank/put/delete
set backspace=indent, eol "sane backspace

"colorscheme vim-monokai-tasty
"gruvbox options
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"colors
"fix for colors working in tmux
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set t_Co=256
  set background=dark
endif
hi CursorLine ctermbg=238
set cursorline
highlight ColorColumn ctermbg=235
let &colorcolumn="80"

"statusline
set statusline+=@\%{hostname()}\ %F
set ls=2

nnoremap n nzz
nnoremap N Nzz

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

" map space to leader key (for vim-wiki)
map <Space> <Leader>
