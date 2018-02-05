filetype off                  " required
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'jlanzarotta/bufexplorer'
Plugin 'severin-lemaignan/vim-minimap'

" Syntax
Plugin 'hallison/vim-rdoc'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails.git'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'godlygeek/tabular' " Apparently needed for vi-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'nvie/vim-flake8' " python spelling and style checker
" Plugin 'chriskempson/base16-vim' " Colorscheme
" Plugin 'hdima/python-syntax'
Plugin 'luochen1990/rainbow'
Plugin 'lepture/vim-jinja'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'chriskempson/base16-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'schickling/vim-bufonly'


" Plugin 'klen/python-mode' " autocompletion was TOO slow
Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe' " it used to capture space and interfere
Plugin 'Shougo/neocomplete'


" I'm not sure why I have these
Plugin 'tpope/vim-dispatch'
Plugin 'tmhedberg/matchit' " I think other plugins use this

" Code helpers
" Plugin 'pangloss/vim-javascript'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'rstacruz/sparkup'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise' " Ruby do - end / if - end
Plugin 'vim-scripts/closetag.vim'
Plugin 'Raimondi/delimitMate' " Autocompletion for quotes, brakets, parens
"Plugin 'AndrewRadev/splitjoin.vim' " gS to split lines, gJ to join them
Plugin 'othree/html5.vim'

" Vim enhancement
" Plugin 'lervag/vimtex'  " Made some weird scroll jump :(
Plugin 'matze/vim-tex-fold' " better latex folding
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'henrik/vim-indexed-search' " Ads N of M results to searches
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab' " Tab for autocompletion
" Plugin 'vim-scripts/AutoComplPop'  " Automaticaly opens autocompletion
Plugin 'vim-scripts/LargeFile' " Disables some feats when editing large files
Plugin 'kshenoy/vim-signature' " Marks enhanced
Plugin 'tmhedberg/SimpylFold' " No-BS Python code folding
"Plugin 'nelstrom/vim-markdown-folding'

" Integration
Plugin 'thoughtbot/vim-rspec' " Run tests from Rspecwithout leaving Vim
Plugin 'tpope/vim-fugitive' " Git integration
"Plugin 'rking/ag.vim' " Ag integration, to search like ack
Plugin 'airblade/vim-gitgutter' " Shows git diff +/-/~ besides the line number

Plugin 'tpope/vim-unimpaired'
"Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'vim-rubyhash'
"Plugin 'tpope/vim-ragtag'

" All of your Plugins must be added before the following line
call vundle#end()            " required





" # General configuration # "

" let mapleader="," " change the leader from \\ to ,

set clipboard=unnamed
set nojoinspaces " Use only 1 space after . when joining lines instead of 2
set modifiable
set hidden
" set tw=79
set wrap linebreak nolist

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set splitright " open vertical splits on the right
set splitbelow " open the horizontal split below

" Lines with equal indent form a fold.
set foldmethod=indent
" set foldlevel=1
set foldnestmax=10
set nofoldenable " Open all folds by default

set undofile " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

filetype plugin indent on
" filetype indent on

set shortmess=at " Avoid the 'Press ENTER or type command to continue' prompt
set foldlevelstart=0

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
" set autoindent            " auto-indent
set shiftround            " always indent/outdent to te nearest tabstop
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4         " unify
set shiftround            " always indent/outdent to the nearest tabstop
set smarttab              " use tabs at the start of a line, spaces elsewhere
set mouse=a
set showcmd
set scrolloff=5
set colorcolumn=80
set encoding=utf-8

set omnifunc=syntaxcomplete#Complete

" associate *.jinja templates with HTML for SparkUp plugin
" au BufRead,BufNewFile *.jinja set filetype=html.jinja
au BufNewFile,BufRead *.jinja set ft=jinja.html

au BufNewFile,BufRead *.py
    \ set fileformat=unix |

" au BufNewFile,BufRead *.erb
    " \ set expandtab |
    " \ set autoindent |
    " \ set fileformat=unix |

au BufNewFile,BufRead *.rb,*.coffee
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |

au BufNewFile,BufRead *.html,*.jinja,*.css,*.scss,*.erb,*.yml
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |

" let hour = strftime("%H")
" if 7 <= hour && hour < 18
  " set background=light
  " " colorscheme solarized
  " colorscheme Tomorrow
" else
  " set background=dark
  " " colorscheme Tomorrow-Night
  " colorscheme Tomorrow-Night-Eighties
" endif

set background=dark
" colorscheme Tomorrow-Night-Eighties
colorscheme jellybeans

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
set completeopt=longest,menuone
let g:SuperTabLongestEnhanced = 1
let g:SuperTabMappingForward = "<C-p>"
let g:SuperTabMappingBackward = "<C-n>"

" Try to fix latex folding
let g:tex_fold_override_foldtext = 1
let g:tex_fold_additional_envs = ['section', 'subsection', 'subsubsection']

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

autocmd VimEnter * call StartUp()
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

" Hide files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', 'pycache', 'egg.info']

" Hide files from CTRLP
set wildignore+=public/system
set wildignore+=software
set wildignore+=*.pyc
set wildignore+=*/tmp/*,*.zip,*/build/*,*/dist/*
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|build|dist|tmp)$',
    \ 'file': '\v\.(pyc|ipynb)$',
    \ }

set wildignore+=*public/system/build/dist/egg-info* " Ignore rails PortalRH big folder

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BUfWritePost $MYVIMRC :AirlineRefresh
augroup END " }

autocmd VimResized * :wincmd =


" # Plugins cutomization # "


" YouCompleteMe tweaks:
" let g:ycm_autoclose_preview_window_after_completion=0
" Leader+g goes to the definition of whatever you're stanting on
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

runtime macros/matchit.vim

" nnoremap <C-b> :CtrlPBuffer<CR>
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
" Airline themes that look ok: bubblegum, tomorrow, wombat, molokai,
" powerlineish, 
let g:airline_theme = 'bubblegum'

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

" let g:syntastic_python_python_exec = '/usr/bin/env python3'
let g:syntastic_python_checkers = ["pyflakes"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": ["python", "ruby", "css", "html", "erb"] }
" let g:syntastic_python_checker_args="--ignore=W391"  " Does't work if python-mode 
let g:pymode_lint_ignore = "W391,E501"  " Ignore blank line at the end of file

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" This highlighting depends on python-mode
" highlight pythonSelf ctermfg=darkgray
highlight pythonDot ctermfg=gray   
" highlight pythonFunction cterm=bold ctermfg=cyan
" ^ ctermfg=blue 
" highlight pythonClass ctermfg=yellow
highlight pythonDocstring ctermfg=blue
" ^ cterm=italic 
" highlight Comment cterm=italic
let python_highlight_all=1
let g:pymode_breakpoint_cmd = 'import pdb; pdb.set_trace()  # XXX BREAKPOINT'

" Flake8 for Python customization
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

" Py-mode customization
let g:pymode_options = 0  " Added so that nowrap is NOT set, I want text wrap!!
let g:pymode_syntax_all = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 79
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
" let g:jedi#completions_command = '<c-n>'
" let g:jedi#completions_enabled = 0
" let g:jedi#popup_on_dot = 0

let g:NERDSpaceDelims = 1 " Useful for Python PEP 8 specs

" Remove trailing whitespace on save
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.jinja %s/\s\+$//e
autocmd BufWritePre *.yml %s/\s\+$//e



"
"
" neocomplete config:
" 
"
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
  " let g:neocomplete#sources#omni#input_patterns = {}
" endif





" Tabs navigation
nnoremap <C-PAGEDOWN> :tabnext<CR>
nnoremap <C-PAGEUP> :tabprevious<CR>

let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['brown', 'darkcyan', 'darkmagenta', 'blue', 'gray']
\}

" " Disable autocomplete pop up for latex files, it's annoying
" autocmd FileType tex :AcpDisable

" RUn the current file
nnoremap <C-X> :!%:p<CR>

