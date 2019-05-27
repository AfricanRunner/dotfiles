syntax on

set tabstop=4

set autoindent

set display+=lastline

set laststatus=2

inoremap {<CR> {}<Esc>i<CR><CR><Esc>kA<Tab>

set number relativenumber

autocmd FileType tex map <F8> <Esc>:w<CR>:!pdflatex %<CR>

autocmd FileType markdown map <F8> <Esc>:w<CR>:!pandoc --from markdown+tex_math_single_backslash % -o %<.pdf<CR>

autocmd FileType markdown inoremap \[<Space> \[<Space><Space><Space>\]<Esc>3hi
autocmd FileType markdown inoremap \(<Space> \(<Space><Space><Space>\)<Esc>3hi
autocmd FileType markdown set spell

