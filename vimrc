filetype off                  " required
set nocompatible              " be iMproved, required

" Plugin manager: Vim-Plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" For Grata
" Plug 'prettier/vim-prettier' " Didn't work, I'm using PyLint on ALE now
Plug 'psf/black', { 'branch': 'stable' }

" Navigation
Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
" Plug 'scrooloose/syntastic' " Too slow, unbearable
Plug 'dense-analysis/ale' " Linting async
Plug 'nvie/vim-flake8' " python spelling and style checker
Plug 'frazrepo/vim-rainbow'
Plug 'chriskempson/base16-vim'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/indentpython.vim' " Some Py specific fixes of autoindent
Plug 'schickling/vim-bufonly'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/neocomplete'
Plug 'tmhedberg/matchit' " I think other Plugs use this

" Code helpers
Plug 'Raimondi/delimitMate' " Autocompletion for quotes, brakets, parens
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim' " Expand HTML from CSS style expressions with <C-y>,
Plug 'AndrewRadev/tagalong.vim' " Auto-changes matching tags

" Vim enhancement
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'tmhedberg/SimpylFold'
" Plug 'ycm-core/YouCompleteMe' " Failed install needs go
Plug 'tpope/vim-surround'
Plug 'henrik/vim-indexed-search' " Ads N of M results to searches
Plug 'scrooloose/nerdcommenter'
" Plug 'ervandew/supertab' " Tab for autocompletion
Plug 'vim-scripts/LargeFile' " Disables some feats when editing large files
Plug 'kshenoy/vim-signature' " Marks enhanced

" Git
Plug 'airblade/vim-gitgutter' " Shows git diff +/-/~ besides the line number
Plug 'tpope/vim-fugitive'

call plug#end() " required

" ### General configuration ### "

" let mapleader="," " change the leader from \\ to ,
set clipboard=unnamed
set nojoinspaces " Use only 1 space after . when joining lines instead of 2
set modifiable
set hidden
set wrap linebreak nolist

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set splitright " open vertical splits on the right
set splitbelow " open the horizontal split below

" ### Folding ###
"
" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
set nofoldenable " Open all folds by default
set foldlevelstart=0
" Enable folding with the spacebar
" nnoremap <space> za
let g:SimpylFold_docstring_preview=1 " docstrings for foldd code

" Auto save and load folding status of files:
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
augroup END

set undofile " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

set shortmess=at " Avoid the 'Press ENTER or type command to continue' prompt

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set cul                   " highlight current line
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set hlsearch
set incsearch             " Do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set expandtab  " Insert spaces whenever TAB is pressed
" set shiftround            " always indent/outdent to the nearest tabstop
set mouse=a
set showcmd
set scrolloff=5
set colorcolumn=88
set encoding=utf-8

set textwidth=119

" associate *.jinja templates with HTML for SparkUp Plug
" au BufRead,BufNewFile *.jinja set filetype=html.jinja
"au BufNewFile,BufRead *.jinja set ft=jinja.html

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set softtabstop=4 |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.rb,*.coffee,*.js
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2

au BufNewFile,BufRead *.html,*.jinja,*.css,*.scss,*.erb,*.yml
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2

let base16colorspace=256
set background=dark
colorscheme Tomorrow-Night-Eighties

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" No swap files
set nobackup
set noswapfile
set nowritebackup

" Open new split panes to right and bottom
set splitbelow
set splitright

" Avoid hitting F1 by mistake
:imap <F1> <Esc>
:map <F1> <Esc>
:nmap <F1> <nop>
:inoremap <F1> <C-c>

" Move between windows, so instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move between tabs
nnoremap <C-T> :tabNext<CR>

" Shortcuts for Find files (FZF) and Find IN files (Rg)
nnoremap <C-G> :Files<CR>
nnoremap <C-P> :Files<CR>
nnoremap <C-F> :Rg<CR>

" Shortcut to Black
nnoremap <C-B> :Black<CR>

map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
" don't close windows when closing buffers
map :bd :bp<bar>sp<bar>bn<bar>bd
map <Home> ^
imap <Home> <Esc>^i

nnoremap Q <nop> " Avoid accidental EX mode

" C-c send enter in insert mode.
inoremap <C-c> <Esc>

" " Make zO recursively open whatever top level fold we're in
" nnoremap zO zCzO

" # Auto commands # "

autocmd FileType css,scss,less set iskeyword=@,48-57,_,-,?,!,192-255
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-
autocmd FileType python setlocal sw=4 ts=4 sts=4

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.py syn match error contained "\<set_trace\>"

"Insert the line 'import ipdb; ipdb.set_trace'
" noreabbrev __i  import ipdb; ipdb.set_trace()
noreabbrev __i  import pdb; pdb.set_trace()

autocmd VimEnter * call StartUp()
function! StartUp()
   if 0 == argc()
       NERDTree
   end
endfunction

" Hide files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', 'pycache', 'egg.info']

" Hide files from CTRLP
" set wildignore+=public/system
" set wildignore+=software
" set wildignore+=*.pyc
" set wildignore+=*/tmp/*,*.zip,*/build/*,*/dist/*
" let g:ctrlp_custom_ignore = {
    " \ 'dir': '\v[\/]\.(git|build|dist|tmp|anaconda|node_modules)$',
    " \ 'file': '\v\.(pyc|ipynb)$',
    " \ }

augroup reload_vimrc {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BUfWritePost $MYVIMRC :AirlineRefresh
augroup END }

" Remove trailing whitespace on save
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.jinja %s/\s\+$//e
autocmd BufWritePre *.yml %s/\s\+$//e

" Run the current file
nnoremap <C-X> :!%:p<CR>

hi Normal guibg=NONE ctermbg=NONE

" # Plugs cutomization # "

" ALE
" let g:ale_linters = {
" \   'python': ['pylint', 'prettier'],
" \}
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=119'

" Airline
let g:airline_powerline_fonts=1
" enable/disable fugitive/lawrencium integration >
let g:airline#extensions#branch#enabled = 0
" change the text for when no branch is detected >
let g:airline#extensions#branch#empty_message = ''
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Airline themes that look ok: bubblegum, tomorrow, wombat, molokai,
" powerlineish, 
let g:airline_theme = 'bubblegum'

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:rainbow_active = 1

" Syntastic recommended configuration
" https://github.com/vim-syntastic/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
