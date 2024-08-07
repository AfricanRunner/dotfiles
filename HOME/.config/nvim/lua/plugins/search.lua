local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>t', builtin.find_files, {})
    vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}

local N = {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
}

return { M, N }
