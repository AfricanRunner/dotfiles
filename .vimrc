
" Vundle Plugin Manager Start
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot' " Better syntax highlighting
Plugin 'w0rp/ale' " Error stuff
" Plugin 'ycm-core/YouCompleteMe' " auto-complete


call vundle#end()
filetype plugin on
" Vundle Plugin Manager End

" let g:ycm_use_clangd = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_filetype_blacklist = {
	\ 'tex': 1,
	\ 'markdown': 1,
	\ 'c': 1
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
nnoremap <F10> :Texplore<CR>

set display+=lastline

set incsearch
set hlsearch
set ignorecase
set smartcase

inoremap {<CR> {}<Esc>i<CR><Esc>kA<CR><Tab>

set number relativenumber

autocmd FileType tex map <F8> <Esc>:w<CR>:!pdflatex %<CR>
autocmd FileType tex map <F9> <Esc>:w<CR>:!pdflatex % && open %<.pdf<CR>
autocmd FileType tex set spell
autocmd FileType tex set linebreak

autocmd FileType markdown map <F8> <Esc>:w<CR>:!pandoc --from markdown+tex_math_single_backslash % -o %<.pdf<CR>

autocmd FileType markdown map <F9> <Esc>:w<CR>:!pandoc --from markdown+tex_math_single_backslash % -o %<.pdf && open %<.pdf<CR>

autocmd FileType python map <F8> <Esc>:w<CR>:!clear && python3 %<CR>

autocmd FileType markdown inoremap \[<Space> \[<Space><Space><Space>\]<Esc>3hi
autocmd FileType markdown inoremap \(<Space> \(<Space><Space><Space>\)<Esc>3hi
autocmd FileType markdown set spell
autocmd FileType markdown set linebreak

autocmd FileType c map <F8> :w<CR>:!clear && gcc -Wall % -o %<<CR>
autocmd FileType c map <F9> :!clear && ./%<<CR>

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif
