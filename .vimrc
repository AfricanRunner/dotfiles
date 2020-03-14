
" set nocompatible              " be iMproved, required
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

" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'

" Plugin 'artur-shaik/vim-javacomplete2' " Java auto-complete
Plugin 'ycm-core/YouCompleteMe' " auto-complete
" Plugin 'file:///Users/danieldupreez/.vim/bundle/eclim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" let g:ycm_use_clangd = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_filetype_blacklist = {
	\ 'tex': 1,
	\ 'markdown': 1
	\}

" let g:snips_trigger_key = '<C-Space>'
imap <C-Space> <Plug>snipMateNextOrTrigger

syntax on
set tabstop=4
" set shiftwidth=4
set autoindent

" Navigating multiple panes

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set splitright
set splitbelow

nnoremap <C-\> :Vexplore!<CR>
nnoremap  :Sexplore!<CR>

set display+=lastline

set incsearch
set hlsearch
set ignorecase
set smartcase

inoremap {<CR> {}<Esc>i<CR><Esc>kA<CR><Tab>

set number relativenumber

autocmd FileType tex map <F8> <Esc>:w<CR>:!pdflatex %<CR>
autocmd FileType tex set spell
autocmd FileType tex set linebreak

autocmd FileType markdown map <F8> <Esc>:w<CR>:!pandoc --from markdown+tex_math_single_backslash % -o %<.pdf<CR>

autocmd FileType python map <F8> <Esc>:w<CR>:!python3 %<CR>

autocmd FileType markdown inoremap \[<Space> \[<Space><Space><Space>\]<Esc>3hi
autocmd FileType markdown inoremap \(<Space> \(<Space><Space><Space>\)<Esc>3hi
autocmd FileType markdown set spell
autocmd FileType markdown set linebreak

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif
