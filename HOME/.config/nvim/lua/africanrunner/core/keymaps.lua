vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>h', ':noh<CR>')
keymap.set('n', '<leader>o', '<C-6>')

keymap.set('n', '<leader>p', ':bprev<CR>')
keymap.set('n', '<leader>n', ':bnext<CR>')

keymap.set('n', '<leader>jh', ': e%<.h<CR>')
keymap.set('n', '<leader>jc', ': e%<.cc<CR>')
keymap.set('n', '<leader>jt', ': e%<_test.cc<CR>')

-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
