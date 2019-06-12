set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot' " Better syntax highlighting

Plugin 'MarcWeber/vim-addon-mw-utils' " Snippets. YES!
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'w0rp/ale' " Error stuff

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

syntax on

set tabstop=4

set autoindent

set display+=lastline

set incsearch
set hlsearch
set ignorecase
set smartcase

inoremap {<CR> {}<Esc>i<CR><CR><Esc>kA<Tab>

set number relativenumber

autocmd FileType tex map <F8> <Esc>:w<CR>:!pdflatex %<CR>

autocmd FileType markdown map <F8> <Esc>:w<CR>:!pandoc --from markdown+tex_math_single_backslash % -o %<.pdf<CR>

autocmd FileType markdown inoremap \[<Space> \[<Space><Space><Space>\]<Esc>3hi
autocmd FileType markdown inoremap \(<Space> \(<Space><Space><Space>\)<Esc>3hi
autocmd FileType markdown set spell

