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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-endwise'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'

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
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
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

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 

" enable/disable fugitive/lawrencium integration >
let g:airline#extensions#branch#enabled = 1
" change the text for when no branch is detected >
let g:airline#extensions#branch#empty_message = ''

" Looks
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set background=dark
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


