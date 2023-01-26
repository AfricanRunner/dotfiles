vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>h', ':noh<CR>')
keymap.set('n', '<leader>o', '<C-6>')

-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
