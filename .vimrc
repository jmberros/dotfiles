filetype off                  " required
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'jlanzarotta/bufexplorer'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails.git'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'godlygeek/tabular' " Apparently needed for vi-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'nvie/vim-flake8' " python spelling and style checker
" Plugin 'pangloss/vim-javascript'
" Plugin 'chriskempson/base16-vim' " Colorscheme
" Plugin 'hdima/python-syntax'
" Plugin 'klen/python-mode' " autocompletion was TOO slow

" I'm not sure why I have these
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-dispatch'
Plugin 'tmhedberg/matchit' " I think other plugins use this

" Code helpers
Plugin 'tpope/vim-endwise' " Ruby do - end / if - end
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " Expands CSS syntax to HTML
Plugin 'vim-scripts/closetag.vim'
Plugin 'Raimondi/delimitMate' " Autocompletion for quotes, brakets, parens
Plugin 'AndrewRadev/splitjoin.vim' " gS to split lines, gJ to join them

" Vim enhancement
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'henrik/vim-indexed-search' " Ads N of M results to searches
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab' " Tab for autocompletion
Plugin 'vim-scripts/LargeFile' " Disables some feats when editing large files
Plugin 'kshenoy/vim-signature' " Marks enhanced
"Plugin 'nelstrom/vim-markdown-folding'
"Plugin 'davidhalter/jedi-vim'

" Integration
Plugin 'thoughtbot/vim-rspec' " Run tests from Rspecwithout leaving Vim
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'rking/ag.vim' " Ag integration, to search like ack
Plugin 'airblade/vim-gitgutter' " Shows git diff +/-/~ besides the line number

Plugin 'tpope/vim-unimpaired'
"Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'vim-rubyhash'
"Plugin 'tpope/vim-ragtag'

" All of your Plugins must be added before the following line
call vundle#end()            " required





" # General configuration # "

let mapleader="," " change the leader from \\ to ,

set nojoinspaces " Use only 1 space after "." when joining lines instead of 2
set modifiable
set hidden
set wildignore+=public/system
set wrap
set linebreak
set nolist

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set splitright " open vertical splits on the right
set splitbelow " open the horizontal split below

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
set nofoldenable " Open all folds by default

set undofile " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

filetype plugin indent on

set shortmess=at " Avoid the 'Press ENTER or type command to continue' prompt
set foldlevelstart=0

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
set cul                   " highlight current line
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set hlsearch
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set autoindent            " auto-indent
set shiftround            " always indent/outdent to te nearest tabstop
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2         " unify
set shiftround            " always indent/outdent to the nearest tabstop
set smarttab              " use tabs at the start of a line, spaces elsewhere
set mouse=a
set showcmd
set scrolloff=5
set colorcolumn=80

"let hour = strftime("%H")
"if 14 <= hour && hour < 18
  "set background=light
  "colorscheme solarized
  "colorscheme Tomorrow
"else
  set background=dark
  "colorscheme Tomorrow-Night
  colorscheme Tomorrow-Night-Eighties
"endif

" No swap files
set nobackup
set noswapfile
set nowritebackup

" Open new split panes to right and bottom
set splitbelow
set splitright






" # Useful mappings # "

nnoremap <Space> :noh<CR>

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

nnoremap <leader>b :call <SID>InsertBreakpoint()<CR>

" Supertab completion settings
inoremap <expr> <Space> pumvisible() ? "\<C-y>" : " "

cnoreabbrev W w
cnoreabbrev Q q

" Bubble lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
" don't close windows when closing buffers
map :bd :bp<bar>sp<bar>bn<bar>bd
map <Home> ^
imap <Home> <Esc>^i

noremap % v% " Match braces and similar
nnoremap Q <nop> " Avoid accidental EX mode

nnoremap <leader><leader> :b#<cr> " Go to last buffer quickly
nnoremap <leader>V :e $MYVIMRC<cr> " Go to ~/.vimrc quickly

" C-c send enter in insert mode.
inoremap <C-c> <Esc>

" Make zO recursively open whatever top level fold we're in
nnoremap zO zCzO






" # Auto commands # "

autocmd FileType css,scss,less set iskeyword=@,48-57,_,-,?,!,192-255
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-
autocmd FileType python setlocal sw=4 ts=4 sts=4

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.py syn match error contained "\<set_trace\>"

" autocmd VimEnter * call StartUp()
" function! StartUp()
    " if 0 == argc()
        " NERDTree
    " end
" endfunction

" set wildignore+=*public/system/* " Ignore rails PortalRH big folder
" let g:ctrlp_custom_ignore = 'public.system'

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

autocmd VimResized * :wincmd =







" # Plugins cutomization # "

runtime macros/matchit.vim

nnoremap <C-b> :CtrlPBuffer<CR>
" nnoremap <C-m> :CtrlPMRU<CR> " This made the ENTER key trigger :CtrlPMRU

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

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
" Airline themes that look ok: laederon, lucius, molokai, monochrome,
" powelineish, ~solarized, !tomorrow, wombat, zenburn
let g:airline_theme = 'molokai'

" Remove fugitive buffers after using them!
autocmd BufReadPost fugitive://* set bufhidden=delete

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": ["python", "ruby", "css", "html", "erb"] }

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let python_highlight_builtins = 1

" Flake8 for Python customization
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

" Py-mode customization
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_syntax_all = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 79
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:jedi#completions_command = '<c-n>'
let g:jedi#popup_on_dot = 0

let g:NERDSpaceDelims = 1 " Useful for Python PEP 8 specs

