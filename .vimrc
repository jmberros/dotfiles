set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails.git'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'pangloss/vim-javascript'
" Plugin 'chriskempson/base16-vim' " Colorscheme

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
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'henrik/vim-indexed-search' " Ads N of M results to searches
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab' " Tab for autocompletion
Plugin 'vim-scripts/LargeFile' " Disables some feats when editing large files

" Integration
Plugin 'thoughtbot/vim-rspec' " Run tests from Rspecwithout leaving Vim
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'rking/ag.vim' " Ag integration, to search like ack
Plugin 'airblade/vim-gitgutter' " Shows git diff +/-/~ besides the line number

"Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'vim-rubyhash'
"Plugin 'tpope/vim-ragtag'

" Invisible characters
set listchars=tab:▸\ ,trail:·,nbsp:_,extends:❯,precedes:❮

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Supertab completion settings
let g:SuperTabDefaultCompletionType = "<c-n>"
inoremap <expr> <Space> pumvisible() ? "\<C-y>" : " "

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set wildignore+=*public/system/*
let g:ctrlp_custom_ignore = 'public.system'
map <C-b> :CtrlPBuffer<CR>
map <C-m> :CtrlPMRU<CR>

runtime macros/matchit.vim

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set modifiable
set hidden

set wildignore+=public/system
" if you want word wrapping, but only want line breaks inserted when you
" explicitly press the Enter key
set wrap
set linebreak
set nolist

function! StartUp()
    "if 0 == argc()
        "NERDTree
    "end
endfunction

autocmd VimEnter * call StartUp()

" Autocomplete ids and classes in CSS
autocmd FileType css,scss,less set iskeyword=@,48-57,_,-,?,!,192-255

" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

cnoreabbrev W w
cnoreabbrev Q q



map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
" don't close windows when closing buffers
map :bd :bp<bar>sp<bar>bn<bar>bd
map <Home> ^
imap <Home> <Esc>^i

" Match braces and similar
noremap % v%

" Avoid accidental EX mode
nnoremap Q <nop>

autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" The 'Press ENTER or type command to continue' prompt is jarring and usually unnecessary.
set shortmess=atI

nnoremap <leader><leader> :b#<cr> " Go to last buffer quickly
nnoremap <leader>V :e $MYVIMRC<cr> " Go to ~/.vimrc quickly

" C-c send enter in insert mode.
inoremap <C-c> <Esc>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

" enable/disable fugitive/lawrencium integration >
let g:airline#extensions#branch#enabled = 1
" change the text for when no branch is detected >
let g:airline#extensions#branch#empty_message = ''

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

autocmd VimResized * :wincmd =

" Looks
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme Tomorrow-Night
" colorscheme solarized
set cul                   " highlight current line

set number                " show line numbers
set laststatus=2          " last window always has a statusline
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
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

" So instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default:
set splitbelow
set splitright

:imap <F1> <Esc>
:map <F1> <Esc>
:nmap <F1> <nop>
:inoremap <F1> <C-c>
set nobackup
set noswapfile
set nowritebackup

let mapleader="," " change the leader from \\ to ,
set colorcolumn=80

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": ["ruby", "css", "html", "erb"] }


