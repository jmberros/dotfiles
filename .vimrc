autocmd FileType ruby setlocal sw=2 ts=2 sts=2
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set number                " show line numbers
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set mouse=a
set showcmd
set scrolloff=5
